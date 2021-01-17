function [PM_RC_CO2_Yang , PM_RC_CO2_Jarvis_H , PM_RC_CO2_Jarvis_L] =...
    Penman_Mothith_CO2(Sn , Ln , U10 , Ta , Sh , Pa , CO2 , pr ,...
    OutputPath_Attribution , OutputPath_InterVar , Name)
% from W/m2 to MJ/(m2day)
Sg = Sn; % change Sg to represent Surface incident shortwave radiation (W/m2)
Sn = Sn.*0.0864;Sn=(1-0.23).*Sn; %0.23 is the albedo
Ln = Ln.*0.0864;Ln = Ln - 4.903./1000000000.*Ta.^4;%black body
Rn = Sn + Ln; % Ln is downward, thus Sn +Ln
% from U10 to U2 (m/s)
U2 = U10.*4.87./(log(67.8.*10-5.42));
% from K to oC
Ta = Ta - 273.15;
% e(kPa),es(kPa)
ea = Sh.*(Pa./1000)./(0.378.*Sh + 0.622); % Milly 2016
es = 0.6108.*exp((17.27.*Ta)./(Ta+237.3));
VPD = es - ea; %VPD (KPa)
% Slope of saturation vapour pressure curve kPa °„C-1
s = 4098 .* es ./ (Ta+237.3).^2;
% gamma Allen eq.(8) (kPa/oC)
gamma=0.665.*(Pa./1000)./1000;
% Jarvis Model Parameter
h = 0.12; % m
LAI = 24 .* h;
f = 0.55 .* 2 .* Sg ./ (100 .* LAI); %Sg W/m^2
fSg = (100./5000 + f) ./ (1 + f);
fSg(fSg<0.05) = 0.05; fSg(fSg>1) = 1; % Kumar 2014
fTa = 1 - 0.0016 .* (298 - 273.15 - Ta).^2;
fTa(fTa<0.05) = 0.05; fTa(fTa>1) = 1; % Kumar 2014
fVPD = 1 - 0.025 .* VPD;
fVPD(fVPD<0.05) = 0.05; fVPD(fVPD>1) = 1; % Kumar 2014
fCO2_H = 1 ./ (1 + 0.663.*(CO2./330-1));
fCO2_L = 1-0.4.*(CO2./330-1);
rl_H = 100 ./ ( LAI .* fSg .* fTa .* fVPD .* fCO2_H);
rl_L = 100 ./ ( LAI .* fSg .* fTa .* fVPD .* fCO2_L);
rs_H = rl_H./(0.5*LAI);
rs_L = rl_L./(0.5*LAI);
rs_Yang = 70 + 0.05.*(CO2-300);
% For Attribution Analysis
Attribution_Var.s = s; Attribution_Var.lamda = 2.501 - 0.002361.*Ta;
Attribution_Var.gamma = gamma; Attribution_Var.rs_H = rs_H;
Attribution_Var.rs_L = rs_L; Attribution_Var.rs_Yang = rs_Yang;
Attribution_Var.ra = 208./U2; Attribution_Var.ea = ea;
Attribution_Var.pa = (Pa./1000)./(1.01.*(Ta+273).*0.287);%rou_a
Attribution_Var.Ca = gamma.*0.622.*Attribution_Var.lamda./(Pa./1000);
Attribution_Var.Rn_s = Rn; Attribution_Var.VPD = VPD;
save(strcat(OutputPath_Attribution , '\Attribution_Var_' , Name) , 'Attribution_Var')
clear Attribution_Var
% Sg (W/m2),Ta (oC), VPD (kPa), CO2 (ppm), U2 (m/s), pr ((kg m-2 s-1))
Met_Var.Sg = Sg; Met_Var.Ta = Ta; Met_Var.VPD = VPD; Met_Var.CO2 = CO2; Met_Var.U2 = U2; Met_Var.pr = pr;
save(strcat(OutputPath_InterVar , '\Met_Var_',Name) , 'Met_Var')
clear Met_Var

% ETrc Output
PM_RC_CO2_Yang = (0.408.*s.*(Rn)+(gamma.*900.*U2.*VPD./(Ta+273)))./...
    (s+gamma.*(1+U2.*(0.34+2.4./10000.*(CO2-300))));
PM_RC_CO2_Jarvis_H = (0.408.*s.*(Rn)+(gamma.*900.*U2.*VPD./(Ta+273)))./...
    (s+gamma.*(1+U2.*0.116./(fSg.*fTa.*fVPD.*fCO2_H)));
PM_RC_CO2_Jarvis_L = (0.408.*s.*(Rn)+(gamma.*900.*U2.*VPD./(Ta+273)))./...
    (s+gamma.*(1+U2.*0.116./(fSg.*fTa.*fVPD.*fCO2_L)));

PM_RC_CO2_Yang(PM_RC_CO2_Yang<0)=0;
PM_RC_CO2_Jarvis_H(PM_RC_CO2_Jarvis_H<0)=0;
PM_RC_CO2_Jarvis_L(PM_RC_CO2_Jarvis_L<0)=0;
end