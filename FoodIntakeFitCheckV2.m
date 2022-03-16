% first call setup
% (make sure FoodIntakeset zeros all unit responses
% and transmitter levels)
x=holdX(2,:);
FoodIntakeSetV2;
justInit = 1;

% set fixed receptor strengths

% set receptor strengths
% to be fit by the algorithm
AgRP.GHSR  = x(1);
AgRP.LepRB = x(2);
AgRP.FHT1BR= x(3);

NOSGABAergic.LepRB = x(4);

POMC.GABAR = x(5);
POMC.Y1R   = x(6);
POMC.FHT2CR= x(7);
POMC.LepRB = x(8);

MCH.GLUR   = x(9);

Ntsn.LepRB = x(10);

LHGal.LepRB= x(11);

OXT.MC4R   = x(12);
OXT.MC3R   = x(13);
OXT.GABAR  = x(14);
OXT.Y1R    = x(15);
OXT.MCHR   = x(16);

OX.GHSR    = x(17);
OX.Y1R     = x(18);
OX.GABAR   = x(19);
OX.GalR    = x(20);
OX.GLUR    = x(21);
OX.MC4R    = x(22) ;

NTSCA.OXR  = x(23);
NTSCA.OXTR = x(24);
NTSCA.LepRB= x(25);
NTSCA.CCKR = x(26);
NTSCA.GHSR = x(27); 

NTSGLP1.LepRB = x(28);
NTSGLP1.CAR   = x(29);
NTSGLP1.GHSR  = x(30);

VTA.LepRB = x(31);
VTA.GHSR  = x(32);
VTA.OXR   = x(33);
VTA.NtsnR = x(34);
VTA.GLP1R = x(35);

NAc.DAR   = x(36);
NAc.MCHR  = x(37);
NAc.GLP1R=  x(38);
NAc.Y1R=    x(39);

AgRP.Bias          = x(40);
NOSGABAergic.Bias  = x(41);
POMC.Bias          = x(42);
MCH.Bias           = x(43);
OXT.Bias           = x(44);
Ntsn.Bias          = x(45);
LHGal.Bias         = x(46);
OX.Bias            = x(47);
NTSCA.Bias         = x(48);
NTSGLP1.Bias       = x(49);
VTA.Bias           = x(50);
NAc.Bias           = x(51);
FoodIntakeBias     = x(52);

   
    
  
  
    


% find baselines
% zero all drugs
risperidone=0;
Metformin=0;
Exp1=0;
Exp2=0;
Exp3=0;
Exp4=0;
Exp5=0;
Exp6=0;
Exp7=0;
Exp8=0;
Exp9=0;
Exp10=0;
Exp11=0;
Exp12=0;
Exp13=0;
Exp14=0;
Exp15=0;
Exp16=0;
Exp17=0;
Exp18=0;
Exp19=0;
Exp20=0;
Exp21=0;
Exp22=0;
Exp23=0;
Exp24=0;
Exp25=0;
Exp26=0;
Exp27=0;
Exp28=0;
Exp29=0;
Exp30=0;
Exp31=0;
Exp32=0;
Exp33=0;

% call FoodIntake
FoodIntakeV2;

% record baselines
BL = [FoodIntake POMC.Res AgRP.Res OXT.Res NTSCA.Res];
BL2= [AgRP.Res  POMC.Res NOSGABAergic.Res OXT.Res  MCH.Res Ntsn.Res LHGal.Res OX.Res NTSCA.Res NTSGLP1.Res VTA.Res FoodIntake];

%BaseLbias=[50 50 50 50 50 50 50 50 50 50 50];


%for i=1:11
   % ghgh=abs(Out(1,i)-BaseLbias(1,i));
  %  error1 = error1 + ghgh;
%end
%error1
% find percent difference between baseline and 0.5
%actOutS(1,:) = ((BL - 0.5) ./ 0.5) * 100;
actOutPre(1,:)= BL;
[~, pop]=size(BL2);
errorF=0;
for i=1:pop
if BL2(1,i)<10
    if i~=3
    errorF=errorF + 1;
    end
end
end    

 % start experiments loop
for k = 1: numEx
    
    % set drugs for each experiment
    %risperidone = TTin(k,1);
    %Metformin = TTin(k,2);
     %Set experiments
Exp1=TTin(1,k);
Exp2=TTin(2,k);
Exp3=TTin(3,k);
Exp4=TTin(4,k);
Exp5=TTin(5,k);
Exp6=TTin(6,k);
Exp7=TTin(7,k);
Exp8=TTin(8,k);
Exp9=TTin(9,k);
Exp10=TTin(10,k);
Exp11=TTin(11,k);
Exp12=TTin(12,k);
Exp13=TTin(13,k);
Exp14=TTin(14,k);
Exp15=TTin(15,k);
Exp16=TTin(16,k);
Exp17=TTin(17,k);
Exp18=TTin(18,k);
Exp19=TTin(19,k);
Exp20=TTin(20,k);
Exp21=TTin(21,k);
Exp22=TTin(22,k);
Exp23=TTin(23,k);
Exp24=TTin(24,k);
Exp25=TTin(25,k);
Exp26=TTin(26,k);
Exp27=TTin(27,k);
Exp28=TTin(28,k);
Exp29=TTin(29,k);
Exp30=TTin(30,k);
Exp31=TTin(31,k);
Exp32=TTin(32,k);  
Exp33=TTin(33,k);  

    
        % zero all responses and transmitter levels
    
%AgRP neuron
AgRP.Net = 0;
AgRP.Res = 0;
AgRP.AgRPN = 0;
AgRP.NPY = 0;
AgRP.GABA = 0;

%LepR expressing GABAergic neurons
NOSGABAergic.Net = 0;
NOSGABAergic.Res = 0;
NOSGABAergic.GABA = 0;

%POMC neuron
POMC.Net = 0;
POMC.Res = 0;
POMC.aMSH = 0;

%MCH
MCH.MCHN=0;
MCH.Net=0;
MCH.Res=0;

%Oxytocin neuron
OXT.Net = 0;
OXT.Res = 0;
OXT.OXTN = 0;

%Neurotensin
Ntsn.Net=0;
Ntsn.Res=0;
Ntsn.NtsnN=0;

%LHGALanin
LHGal.Net=0;
LHGal.Res=0;
LHGal.GalN=0;

%Orexin
OX.OXN=0;
OX.Net=0;
OX.Res=0;


%NTSCA
NTSCA.Net=0;
NTSCA.Res=0;
NTSCA.CA=0;

%NTS GLP-1
NTSGLP1.Net=0;
NTSGLP1.Res=0;
NTSGLP1.GLP1N=0;

%VTA
VTA.DA=0;
VTA.Net=0;
VTA.Res=0;

%NAc
NAc.NAcN=0;
NAc.Net=0;
NAc.Res=0;

    % call FoodIntake
    FoodIntakeV2;
    
    % set actual percent changes
     actOutPre(k+1,:)= (([FoodIntake POMC.Res AgRP.Res OXT.Res NTSCA.Res] - BL(1,:)) ./ BL(1,:)) * 100;
       
    
end
[u p] = size(actOutPre);

for o = 1:u
    for h =1:p
      
        if actOutPre(o,h) >30 
              actOutS(o,h) = 5;
       
        elseif actOutPre(o,h) < -30 
              actOutS(o,h) = 1;
        else
                actOutS(o,h) = 3;  
        end
    end
end
% compute error
[a b] = size(actOutS);

NewError=zeros(a,b);
for i=2:a
    for j=1:b
        if actOutS(i,j) == TTSout(i,j)
           NewError(i,j)=0;
        else 
           NewError(i,j)=errWts(i,j);
        end
    end
end

%error=sum(NewError(:,1));
% compute error
error = errorF + sum(sum(NewError));%+ error1;
%error = sum(sum(abs(actOutS - TTSout) ));
error