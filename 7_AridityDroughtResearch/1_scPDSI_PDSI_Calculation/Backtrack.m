%%%%%%%%%%%%% Code By Shulei Zhang 23 August 2017 %%%%%%%%%%%%%
% Yang, Y., Zhang, S., Roderick, M. L., McVicar, T. R., Yang, D., Liu, W., 
% & Li, X. (2020). Comparing Palmer Drought Severity Index drought assessments 
% using the traditional offline approach with direct climate model outputs. 
% Hydrology and Earth System Sciences, 24(6), 2921-2921.
function [altX1,altX2,X]=Backtrack( X1,X2,altX1_in,altX2_in,X_in,tolerance)
global oop;
altX1=altX1_in;
altX2=altX2_in;
X=X_in;
num1=X1;
num2=0;
Xindex=0;
while isempty(altX1)==0 && isempty(altX2)==0
    if num1>0
        num1=altX1(1);altX1=altX1(2:end);
        num2=altX2(1);altX2=altX2(2:end);
    else
        num2=altX1(1);altX1=altX1(2:end);
        num1=altX2(1);altX2=altX2(2:end);
    end
    if abs(num1)<=tolerance
        num1=num2;
    end
    Xindex=Xindex+1;
    if Xindex<=length(X)
        X(Xindex) = num1;
    else
        oop=oop+1;
        Xindex=0;
    end
end
end
