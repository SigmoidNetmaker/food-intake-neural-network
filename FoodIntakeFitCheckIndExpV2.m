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
Exp31=1;
Exp32=0;
Exp33=0;

% call FoodIntake
FoodIntakeV2;
