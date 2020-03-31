function PM_RC = Penman_Mothith(Sn,Ln,U10,Ta,Sh,Pa)
% from W/m2 to MJ/(m2day)
Sn = Sn.*0.0864;Sn = (1-0.23).*Sn; %0.23 is the albedo
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
% Slope of saturation vapour pressure curve
s = 4098 .* es ./ (Ta+237.3).^2;
% gamma Allen eq.(8)
gamma=0.665.*(Pa./1000)./1000;
%G is downward, thus Rn + G
PM_RC = ( 0.408.*s.*(Rn) + (gamma.*900.*U2.*VPD./(Ta+273)) )./(s+gamma.*(1+0.34.*U2));
PM_RC(PM_RC<0)=0;
end