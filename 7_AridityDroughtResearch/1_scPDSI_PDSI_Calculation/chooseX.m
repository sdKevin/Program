%%%%%%%%%%%%% Code By Shulei Zhang 23 August 2017 %%%%%%%%%%%%%
% Yang, Y., Zhang, S., Roderick, M. L., McVicar, T. R., Yang, D., Liu, W., 
% & Li, X. (2020). Comparing Palmer Drought Severity Index drought assessments 
% using the traditional offline approach with direct climate model outputs. 
% Hydrology and Earth System Sciences, 24(6), 2921-2921.
function [newX1,newX2,newX3,newX,altX1,altX2,X]=chooseX(bug,wetm,wetb,drym,dryb,X1,X2,X3,Z,newX1_in,newX2_in,newX3_in,newX_in,altX1_in,altX2_in,X_in,tolerance)
altX1=altX1_in;
altX2=altX2_in;
newX1=newX1_in;
newX2=newX2_in;
newX3=newX3_in;
newX=newX_in;
X=X_in;
wetc = 1 - (wetm / (wetm+wetb));
dryc = 1 - (drym / (drym+wetb));
newX1 = (wetc*X1 + Z/(wetm+wetb));
if(newX1 < 0)
    newX1 = 0;
end
newX2 = X2;
if(bug==0)
    newX2 = (dryc*X2 + Z/(drym+dryb));
    if(newX2 > 0)
        newX2 = 0;
    end
end

if((newX1 >= 0.5)&&(newX3 == 0))
    [altX1,altX2,X]=Backtrack( newX1,newX2,altX1,altX2,X,tolerance);
    newX = newX1;
    newX3 = newX1;
    newX1 = 0;
else
    newX2 = (dryc*X2 + Z/(drym+dryb));
    if(newX2 > 0)
        newX2 = 0;
    end
    if((newX2 <= -0.5)&&(newX3 == 0))
        [altX1,altX2,X]=Backtrack( newX2,newX1,altX1,altX2,X,tolerance);
        newX=newX2;
        newX3 = newX2;
        newX2 = 0;
    elseif (newX3 == 0)
        if(newX1 == 0)
            [altX1,altX2,X]=Backtrack( newX2,newX1,altX1,altX2,X,tolerance);
            newX = newX2;
        elseif(newX2 == 0)
            [altX1,altX2,X]=Backtrack( newX1,newX2,altX1,altX2,X,tolerance);
            newX = newX1;
        else
            altX1=[newX1,altX1];
            altX2=[newX2,altX2];
            newX = newX3;
        end
    else
        altX1=[newX1,altX1];
        altX2=[newX2,altX2];
        newX = newX3;
    end
end
end