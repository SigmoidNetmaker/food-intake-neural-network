% this script uses genetic algorithm search to
% search for initial receptor levels for FoodIntake

% AgRP.GHSR  = x(1);
% AgRP.LepRB = x(2);
% AgRP.FHT1BR= x(3);
% 
% NOSGABAergic.LepRB = x(4);
% 
% POMC.GABAR = x(5);
% POMC.Y1R   = x(6);
% POMC.FHT2CR= x(7);
% POMC.LepRB = x(8);
% 
% MCH.GLUR   = x(9);
% 
% Ntsn.LepRB = x(10);
% 
% LHGal.LepRB= x(11);
% 
% OXT.MC4R   = x(12);
% OXT.MC3R   = x(13);
% OXT.GABAR  = x(14);
% OXT.Y1R    = x(15);
% OXT.MCHR   = x(16);
% 
% OX.GHSR    = x(17);
% OX.Y1R     = x(18);
% OX.GABAR   = x(19);
% OX.GalR    = x(20);
% OX.GLUR    = x(21);
% OX.MC4R    = x(22) ;
% 
% NTSCA.OXR  = x(23);
% NTSCA.OXTR = x(24);
% NTSCA.LepRB= x(25);
% NTSCA.CCKR = x(26);
% NTSCA.GHSR = x(27); 
% 
% NTSGLP1.LepRB = x(28);
% NTSGLP1.CAR   = x(29);
% NTSGLP1.GHSR  = x(30);
% 
% VTA.LepRB = x(31);
% VTA.GHSR  = x(32);
% VTA.OXR   = x(33);
% VTA.NtsnR = x(34);
% VTA.GLP1R = x(35);
% 
% NAc.DAR   = x(36);
% NAc.MCHR  = x(37);
% NAc.GLP1R=  x(38);
% NAc.Y1R=    x(39);
% 
% AgRP.Bias          = x(40);
% NOSGABAergic.Bias  = x(41);
% POMC.Bias          = x(42);
% MCH.Bias           = x(43);
% OXT.Bias           = x(44);
% Ntsn.Bias          = x(45);
% LHGal.Bias         = x(46);
% OX.Bias            = x(47);
% NTSCA.Bias         = x(48);
% NTSGLP1.Bias       = x(49);
% VTA.Bias           = x(50);
% NAc.Bias           = x(51);
% FoodIntakeBias     = x(52);


% enter number of searches
numSearch =100;

% enter error tolerance
ERRtol = 10;

% enter the number of parameters to be optimized

numX = 52;
numR = 39;
numB = 13;

% set maximal allowed receptor level
reMin = 0;
reMax= 20;
biMin = -200;
biMax = 200; 

% set lower bound constraint
lb=ones(numX,1);
ub=ones(numX,1);
lb(1:numR) = lb(1:numR) * reMin;
ub(1:numR) = ub(1:numR) * reMax;
lb(numR+1:numR+numB) = lb(numR+1:numR+numB) * biMin;
ub(numR+1:numR+numB) = ub(numR+1:numR+numB) * biMax;
lb(51,1)=20;
lb(52,1)=20;


% increase population size
options = gaoptimset('PopulationSize',1000,'Generations',Inf);

% declare hold arrays
holdX=zeros(numSearch,numX);
holdE=zeros(numSearch,1);

% start clock
tic

% for each search
for l=1:numSearch,
    % initiate directed search
    [x error] = ga(@FoodIntakeFitV2,numX,[],[],[],[],lb,ub,[],options);
    % hold parameters
    holdX(l,:)=x;
    % save the error
    holdE(l)=error;
end

% grab any fit parameter sets
[holdE indxE] = sort(holdE);
holdX = holdX(indxE,:);
indxWT = find(holdE<=ERRtol);
fitX=holdX(indxWT,:);
[numGood dum]=size(fitX);

% stop clock
toc

% show results
fitX
holdE'
numGood
VectorSaver;
