% FoodIntakeset
% this script sets up for all of
% the other FoodIntake mfiles
% just look at initial values?
% (1 for initial only, 0 for adaptation)
% (usually you want justInit = 0 for adaptation)

justInit = 1;
risperidone=0;
Metformin=0;
%Enter Glucose level
Glucose=7;
%Enter the ghrelin level
Ghr=7;
%Enter Ghrelin injection exp28
GhrInj=200;
%Enter leptin level
Leptin = 7;
%Enter leptin injection exp 27
LeptinInj=200;

%Enter CCK level
CCK =7;
%Enter 5-HT level

FHT=7;
%FHT1B agonist (Exp29)
FHT1Bagon = 200;
%FHT2C agonist(Exp30)
FHT2Cagon=200;

%aMSH injection(exp 31)
aMSHinj=200;
%GLP-1 injection (exp 33)
GLP1inj=200;
%Enter counters
countlim = 100;
netlim = 10;

%Inactivate Y2 receptor to prevent feedback
Y2RInactivate=0;
%Using optimized receptor levels
useOp=0;
%Set use bias vector
useBiasVec = 0;
%xz=[7.59976738257415,0,7.05315250587047,2.25000000000000,3.89184089856724,3.00335944018598,0,0.0223380099067830,4.25000000000000,3.10706883701740,1.90904547383477,2.28176518050849,1.72765439429540,1.50000000000000,2.68750000000000,4.01660156250000,3.02192199793603,5.20149116708750,2.04517021556140,5.13085937500000,1.84977574203229,6.81649922851658,0.0330637652910907,7.91378646342864,3.08109961159833,4.02164550410693,3.15818236688099,2.14395412215412,0.843941403003645,0.00390625000000000,3.15940630826184,1,50.0302495785598,0.748825918595607,5.84567662029369,3.22527797288811,5.44888896628296,22.2573143962599,0.993447297104430,7.37346643348663,28.6514654144458,7.11820501073244,4.70467171811045];
%xr= [0.915205249965282,0.224853438516300,1.93193551091597,0.285050901468251,0.224552398034405,0.913385301695234,0.126791977836757,0.162273572583835,2.39088607458963,0.184627170133465,0.468899663973859,0.770346360357110,0.148252693007145,0.221419970435468,0.382552511337453,1.38438848857032,0.378802625225376,1.41953717999702,0.643009426991785,0.777157863093922,2.07553769309001,0.863901614833289,0.857152075668700,0.409965596707165,1.72330518159961,0.982176891107990,1.53070310898275,1.68716414763854,0.174659176467309,0.998196304721524,1.96426056046991];
%xz=[27.9161892942619,1.41477797869945,2.32131198706637,1.06891800842814,0.117146055728236,253.827946602284,6.19641133819109,0.726414742243974,0.661071707854689,1.65816783496888,1.51206183599933,0.148897775927598,0.0102425410151386,0.621965300338033,48.9974735441407,31.6988791999976,67.3096566412467,30.6231379388880,0.358382102584498,0.652844055016002,1.34144658367814,0.113344415255060,63.4261777697433,74.1547081020908,1.97377168415709,0.745838489649780,197.691001553625,298.884910183241,392.128093500769,268.725364783434,159.755456034124,53.5580365925601,113.220190633970,236.406628744739,104.738710488828,230.310125866220,132.126215867837,0.354252567249256];

%Set biases
if useBiasVec == 1

AgRP.Bias          = xz(40);
NOSGABAergic.Bias  = xz(41);
POMC.Bias          = xz(42);
MCH.Bias           = xz(43);
OXT.Bias           = xz(44);
Ntsn.Bias          = xz(45);
LHGal.Bias         = xz(46);
OX.Bias            = xz(47);
NTSCA.Bias         = xz(48);
NTSGLP1.Bias       = xz(49);
VTA.Bias           = xz(50);
NAc.Bias           = xz(51);
FoodIntakeBias     = xz(52);
end
if useBiasVec == 0

AgRP.Bias          = 0;
NOSGABAergic.Bias  = 0;
POMC.Bias          = 0;
MCH.Bias           = 0;
OXT.Bias           = 0;
Ntsn.Bias          = 0;
LHGal.Bias         = 0;
OX.Bias            = 0;
NTSCA.Bias         = 0;
NTSGLP1.Bias       = 0;
VTA.Bias           = 0;
NAc.Bias           = 0;
FoodIntakeBias     = 0;
end

% Enter structures

%AgRP neuron
AgRP.Live = 1;
AgRP.GHSR = 1;
AgRP.LepRB= 1;
%AgRP.OXR=1;
AgRP.FHT1BR=1;
%AgRP.NMDAR=1;
AgRP.Y2R=0;
AgRP.Exci=50;
AgRP.inhib=50;
AgRP.Net = 0;
AgRP.Res = 0;
AgRP.AgRPN = 0;
AgRP.NPY = 0;
AgRP.GABA = 0;

%LepRB nitric oxide expressing GABAergic neurons
NOSGABAergic.Live = 1;
NOSGABAergic.LepRB= 1;
NOSGABAergic.Net = 0;
NOSGABAergic.Res = 0;
NOSGABAergic.GABA = 0;

%POMC neuron
POMC.Live = 1;
POMC.GABAR = 1;
POMC.Y1R = 1;
POMC.FHT2CR=1;
POMC.LepRB = 1;
POMC.Exci=50;
POMC.Net = 0;
POMC.Res = 0;
POMC.aMSH = 0;


%Oxytocin neuron
OXT.Live = 1;
OXT.MC4R = 1;
OXT.MC3R = 1;
OXT.GABAR=1;
OXT.Y1R=1;
OXT.MCHR=1;
OXT.Exci=200;
OXT.inhib=200;
OXT.Net = 0;
OXT.Res = 0;
OXT.OXTN = 0;


%Nesfatin neuron

%Nesfatin.Live = 1;
%Nesfatin.MC4R = 1;
%Nesfatin.inhib=50;
%Nesfatin.Net = 0;
%Nesfatin.Res = 0;
%Nesfatin.NesfatinN = 0;

%CRH neuron
%CRH.Live = 1;
%CRH.MC4R = 1;
%CRH.OXTR = 1;
%CRH.Net = 0;
%CRH.Res = 0;
%CRH.CRHN = 0;

%NTSCA

NTSCA.Live=1;
NTSCA.OXTR=1;
%NTSCA.MC4R=1;
%NTSCA.MC3R=1;
NTSCA.LepRB=1;
NTSCA.CCKR=1;
NTSCA.GHSR=1;
NTSCA.OXR=1;
NTSCA.Net=0;
NTSCA.Res=0;
NTSCA.CA=0;

%NTSGLP1

NTSGLP1.Live=1;
NTSGLP1.LepRB=1;
NTSGLP1.CAR=1;
NTSGLP1.GHSR=1;
NTSGLP1.Net=0;
NTSGLP1.Res=0;
NTSGLP1.GLP1N=0;

%LHA GABAergic neuron

%LHAGABAergic.Live=1;
%LHAGABAergic.LepRB=1;
%LHAGABAergic.GABA=0;
%LHAGABAergic.Net=0;
%LHAGABAergic.Res=0;

%Neurotensin in LH 
Ntsn.Live=1;
Ntsn.LepRB=1;
Ntsn.Net=0;
Ntsn.Res=0;
Ntsn.NtsnN=0;

%Neurotensin and Galanin-1 expressing neurons in LH 
LHGal.Live=1;
LHGal.LepRB=1;
LHGal.Net=0;
LHGal.Res=0;
LHGal.GalN=0;

%Orexin

OX.Live=1;
%OX.GABAR=1;
%OX.GLP1R=1;
OX.GalR=1;
OX.GLUR=1;
OX.GHSR=1;
OX.Y1R=1;
OX.MC4R=1;
OX.OXN=0;
OX.Net=0;
OX.Res=0;

%MCH

MCH.Live=1;
%MCH.NAcR=1;
MCH.GLUR=1;
MCH.MCHN=0;
MCH.Net=0;
MCH.Res=0;




%BDNF

%BDNF.Live=1;
%BDNF.LepRB=1;
%BDNF.BDNFN=0;
%BDNF.Net=0;
%BDNF.Res=0;

%VTA

VTA.Live=1;
VTA.LepRB=1;
VTA.GHSR=1;
VTA.OXR=1;
%VTA.GABAR=1;
VTA.NtsnR=1;
VTA.GLP1R=1;
VTA.DA=0;
VTA.Net=0;
VTA.Res=0;

%NAc

NAc.Live=1;
NAc.DAR=1;
NAc.MCHR=1;
NAc.GLP1R=1;
NAc.Y1R=1;
NAc.Net=0;
NAc.Res=0;

%DR

%DR.Live=1;
%DR.DAR=1;
%DR.OXTR=1;
%DR.CRHR=1;
%DR.FHT=0;
%DR.Net=0;
%DR.Res=0;

%Using optimized values
%xr=[27.9161892942619,1.41477797869945,2.32131198706637,1.06891800842814,0.117146055728236,253.827946602284,6.19641133819109,0.726414742243974,0.661071707854689,1.65816783496888,1.51206183599933,0.148897775927598,0.0102425410151386,0.621965300338033,48.9974735441407,31.6988791999976,67.3096566412467,30.6231379388880,0.358382102584498,0.652844055016002,1.34144658367814,0.113344415255060,63.4261777697433,74.1547081020908,1.97377168415709,0.745838489649780,197.691001553625,298.884910183241,392.128093500769,268.725364783434,159.755456034124,53.5580365925601,113.220190633970,236.406628744739,104.738710488828,230.310125866220,132.126215867837,0.354252567249256];

if useOp==1
AgRP.GHSR  = xr(1);
AgRP.LepRB = xr(2);
AgRP.FHT1BR= xr(3);

NOSGABAergic.LepRB = xr(4);

POMC.GABAR = xr(5);
POMC.Y1R   = xr(6);
POMC.FHT2CR= xr(7);
POMC.LepRB = xr(8);

MCH.GLUR   = xr(9);

Ntsn.LepRB = xr(10);

LHGal.LepRB= xr(11);

OXT.MC4R   = xr(12);
OXT.MC3R   = xr(13);
OXT.GABAR  = xr(14);
OXT.Y1R    = xr(15);
OXT.MCHR   = xr(16);

OX.GHSR    = xr(17);
OX.Y1R     = xr(18);
OX.GABAR   = xr(19);
OX.GalR    = xr(20);
OX.GLUR    = xr(21);
OX.MC4R    = xr(22) ;

NTSCA.OXR  = xr(23);
NTSCA.OXTR = xr(24);
NTSCA.LepRB= xr(25);
NTSCA.CCKR = xr(26);
NTSCA.GHSR = xr(27); 

NTSGLP1.LepRB = xr(28);
NTSGLP1.CAR   = xr(29);
NTSGLP1.GHSR  = xr(30);

VTA.LepRB = xr(31);
VTA.GHSR  = xr(32);
VTA.OXR   = xr(33);
VTA.NtsnR = xr(34);
VTA.GLP1R = xr(35);

NAc.DAR   = xr(36);
NAc.MCHR  = xr(37);
NAc.GLP1R=  xr(38);
NAc.Y1R=    xr(39);

end

% set hold vectors
AgRPresSeg = zeros(1, netlim);
OXTresSeg = zeros(1, netlim);
NTSresSeg = zeros(1, netlim);
NesfatinresSeg = zeros(1, netlim);
CRHresSeg = zeros(1, netlim);
POMCresSeg = zeros(1, netlim);
NeurotenresSeg = zeros(1, netlim);
BDNFresSeg = zeros(1, netlim);
OXresSeg = zeros(1, netlim);
MCHresSeg = zeros(1, netlim);
VTAresSeg = zeros(1, netlim);
NAcresSeg = zeros(1, netlim);
NOSGABAergicresSeg = zeros(1, netlim);
numAdjRuns = 100;


% set number of experiments
numEx = 33;

% set number of cells in truth table
numTTunits = 5;

% set number of truth table drugs
numTTdrugs = 33;

% set acute output truth table
%aMSHcol =   [-50; NaN];
%leptincol = [20 ; NaN];
%NPYcol =    [0  ; NaN];
%AgRPcol =   [0  ; NaN];
%NTSNEScol = [NaN; 15 ];
%FIcol =     [20 ; -64];
%FIcol = [5 ; 5 ; 5 ; 1 ; 5 ; 5 ; 3 ; 3 ; 3 ; 5 ; 5 ; 5 ; 3 ; 5 ; 5 ; 5 ; 3 ; 4 ; 3 ; 3 ; 4 ; 4 ; 1 ; 5 ; 5 ; 5 ; 1 ; 5 ; 0 ; 1 ; 1];
FIcol = [5 ; 5 ; 5 ; 1 ; 5 ; 5 ; 3 ; 3 ; 3 ; 5 ; 5 ; 5 ; 3 ; 5 ; 5 ; 5 ; 3 ; 5 ; 3 ; 3 ; 5 ; 5 ; 1 ; 5 ; 5 ; 5 ; 1 ; 5 ; 0 ; 1 ; 1 ;3 ;1];
POMCcol=[0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 5 ; 1 ; 0 ; 5 ; 0 ;0 ;0];
AgRPcol=[0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 1 ; 5 ; 1 ; 0 ; 0 ;0 ;0];
OXTcol =[0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 5 ; 0 ; 0 ; 0 ; 5 ;0 ;0];
NTSCAcol =[0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 3 ;0 ;0];
TTSout = [FIcol POMCcol AgRPcol OXTcol NTSCAcol];
TTSout = [zeros(1,numTTunits); TTSout];

% set input truth table
% (order of drugs is risperidone,Metformin)
TTin = eye(numEx,numTTdrugs);

% set up monoVec for depCNcheckA
%monoVec = zeros(3,1);

% set output mask
%TTAmask = ones(numEx,numTTunits);
%TTAmask(numEx,numTTunits) = 0;

% set output error weight array
 errWts = ones(numEx+1,numTTunits);

 errWts(30,1) = 0;
 errWts(1,:) = 0;
 errWts(6,1)=0;
 errWts([1:27 30 32 33 34],2) = 0;
 errWts([1:27 31 32 33 34],3) = 0;
 errWts([1:27 29 30 31 33 34],4) = 0;
 errWts([1:31 33 34] ,5) = 0;



% set percent change hold array
changeHold = zeros(numEx, numTTunits, numAdjRuns);

% set actual output arrays
actOutPre=zeros(numEx+1,numTTunits);
actOutS = zeros(numEx +1 , numTTunits);
%actOutA = zeros(numEx, numTTunits);

% set a spacer
spacerS = ones(numEx +1, 1) * NaN;
spacerA = ones(numEx, 1) * NaN;

% set number of units in the network
numUnits = 13;


return





