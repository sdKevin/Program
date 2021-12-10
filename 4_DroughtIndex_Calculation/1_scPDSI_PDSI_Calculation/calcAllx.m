%%%%%%%%%%%%% Code By Shulei Zhang 23 August 2017 %%%%%%%%%%%%%
% Yang, Y., Zhang, S., Roderick, M. L., McVicar, T. R., Yang, D., Liu, W., 
% & Li, X. (2020). Comparing Palmer Drought Severity Index drought assessments 
% using the traditional offline approach with direct climate model outputs. 
% Hydrology and Earth System Sciences, 24(6), 2921-2921.
function [Prob, X1,X2,X3,X] = calcAllx(Zr,wetm,wetb,drym,dryb )
global oop;
oop=0;
Prob = [];
X1 = [];
X2 = [];
X3 = [];
X1_last=0;
X2_last=0;
X3_last=0;
Prob_last=0;
X=[];
V = 0;
Q = 0;
altX1=[];
altX2=[];
tolerance=0.00001;
bug=0;
%read Zarr
for i=1:length(Zr)
    m=0;b=0;
    newX1=0;
    newX2=0;
    newX3=0;
    newX=0;
    newV=0;
    newProb=0;
    Z=Zr(i);
    wd=0;
    if X3_last>=0
        m=wetm;b=wetb;wd=1;
    else
        m=drym;b=dryb;wd=-1;
    end
    c = 1 - (m / (m + b));
    if X3_last==0
        newX3=0;
        newV=0;
        newProb=0;
        [newX1,newX2,newX3,newX,altX1,altX2,X]=chooseX(bug,wetm,wetb,drym,dryb,X1_last,X2_last,X3_last,Z,newX1,newX2,newX3,newX,altX1,altX2,X,tolerance);
    else
        newX3 = (c * X3_last + Z/(m+b));
        ZE = (m+b)*(wd*0.5 - c*X3_last);
        Q=ZE+V;
        newV = Z - wd*(m*0.5) + wd*min(wd*V+tolerance,0);
        if wd*newV>0
            newV=0;
            newProb=0;
            newX1=0;
            newX2=0;
            newX=newX3;
            altX1=[];
            altX2=[];
        else
            newProb=(newV/Q)*100;
            if(newProb>=100-tolerance)
                newX3=0;
                newV=0;
                newProb=100;
            end
            [newX1,newX2,newX3,newX,altX1,altX2,X]=chooseX(bug,wetm,wetb,drym,dryb,X1_last,X2_last,X3_last,Z,newX1,newX2,newX3,newX,altX1,altX2,X,tolerance);
        end
    end
    V=newV;
    X1_last=newX1;
    X2_last=newX2;
    X3_last=newX3;
    Prob_last=newProb;
    X=[newX,X];
    X1=[newX1,X1];
    X2=[newX2,X2];
    X3=[newX3,X3];
    Prob=[newProb,Prob];
end
X=fliplr(X);
X1=fliplr(X1);
X2=fliplr(X2);
X3=fliplr(X3);
Prob=fliplr(Prob);
end