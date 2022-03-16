% FoodIntake
% this script implements the food intake network 

% start main adaptaton loop
for i =1:countlim
    
     % start network update loop
    for j=1:netlim
        %leptin injection
       % Leptin=Leptin + LeptinInj(1-Exp27);
     
        %Update AgRP structure Do we want to consider different
        %subpopulation?
        
        AgRP.Net = AgRP.GHSR * (Ghr + GhrInj* Exp28) + -AgRP.LepRB *(1- Exp8) * (1-Exp9) *(1- Exp11) *(1- Exp12) * (Leptin + LeptinInj * Exp27) * (1-Exp6)...
        + -AgRP.FHT1BR*(1- Exp13) * (FHT + FHT1Bagon * Exp29) +   ...
        + AgRP.Exci * (Exp15 + Exp18 + Exp21 + Exp22 + Exp24)  + AgRP.Bias;
        AgRP.Res = max(0, AgRP.Live * (1 -  Exp23) * AgRP.Net);
        AgRP.AgRPN = AgRP.Res ;
        AgRP.NPY = AgRP.Res ;
        AgRP.GABA = AgRP.Res;
        
        
        %Update LepR expressing GABAergic neurons (expressing NOS in ARC)
        
        NOSGABAergic.Net= - NOSGABAergic.LepRB *(1- Exp11) *(1- Exp12) * (Leptin + LeptinInj*Exp27) * (1-Exp6)+ NOSGABAergic.Bias;
        NOSGABAergic.Res = max (0, NOSGABAergic.Live * NOSGABAergic.Net) ;
        NOSGABAergic.GABA = NOSGABAergic.Res;
        
        %Update POMC structure
        POMC.Net = POMC.LepRB*(1- Exp7) *(1- Exp9) * (Leptin + LeptinInj* Exp27) * (1-Exp6) +  -POMC.GABAR *( AgRP.GABA + NOSGABAergic.GABA)...
        + -POMC.Y1R *(1- Exp4) * AgRP.NPY + (max(0,POMC.FHT2CR -(risperidone/2)))* (1-Exp14) * (FHT + FHT2Cagon * Exp30) + POMC.Exci * Exp24 + POMC.Bias;
        POMC.Res = max(0,POMC.Live * POMC.Net * (1-Exp1)) ;
        POMC.aMSH =  POMC.Res + aMSHinj * Exp31;
        
         %Update MCH structure
        MCH.Net = MCH.GLUR * (1-Exp32) * Glucose + MCH.Bias;
        MCH.Res = max(0,MCH.Live * MCH.Net);
        MCH.MCHN =MCH.Res;
        
        %Update Nesfatin structure %look up if Nesfatins have GABA and NPY receptors
        %if Yes : + AgRP.Exci * (Exp16 + Exp17))*(1-Exp18)add this to NPY
        %and GABA and AgRPN for nesfatin
        
        %Nesfatin.Net = Nesfatin.MC4R*(1- Exp3) *(POMC.aMSH -( AgRP.AgRPN ))  + Nesfatin.Bias;
        %Nesfatin.Res = max(0,Nesfatin.Live*(1-Exp25 ) * Nesfatin.Net);
        %Nesfatin.NesfatinN =Nesfatin.Res;
        
        %Update OXT structure
        OXT.Net = ((OXT.MC4R *(1- Exp3)) + (OXT.MC3R *(1- Exp2))) *(POMC.aMSH - (AgRP.AgRPN)) ...
        + -OXT.Y1R * (1-Exp4)*(1-Exp20)*(1 - Exp22) * (AgRP.NPY + AgRP.Exci * (Exp16 + Exp17 + Exp19 + Exp20))*(1-Exp18)...
        + -OXT.GABAR* (1 - Exp19)*(1 - 0) * (AgRP.GABA + AgRP.Exci * (Exp16 + Exp17 +  + Exp20))*(1-Exp18)...
        - OXT.MCHR * MCH.MCHN + OXT.Exci * Exp17 + OXT.Bias;
        OXT.Res = max(0,OXT.Live *(1- Exp25) * OXT.Net);
        OXT.OXTN =OXT.Res;
        
        %Update LHAGABAergic structure
        %LHAGABAergic.Net = LHAGABAergic.LepRB*(1- Exp11) * (1-Exp12) * (Leptin + LeptinInj* Exp27) * (1-Exp6) +  LHAGABAergic.Bias;
        %LHAGABAergic.Res = max(0,LHAGABAergic.Live * LHAGABAergic.Net) ;
        %LHAGABAergic.GABA =LHAGABAergic.Res;
        
        %Update Neurotensin in LH 
        Ntsn.Net=Ntsn.LepRB*(1- Exp11) * (1-Exp12) * (Leptin + LeptinInj* Exp27) * (1-Exp6) +  Ntsn.Bias;
        Ntsn.Res = max(0,Ntsn.Live * Ntsn.Net) ;
        Ntsn.NtsnN =Ntsn.Res;
        
        %Update LHGalanin expressing neurons 
        LHGal.Net=LHGal.LepRB*(1- Exp11) * (1-Exp12) * (Leptin + LeptinInj* Exp27) * (1-Exp6) +  LHGal.Bias;
        LHGal.Res = max(0,LHGal.Live * LHGal.Net) ;
        LHGal.GalN =LHGal.Res;

        
        %Update Orexin structure
        OX.Net = - OX.GalR * LHGal.GalN + OX.GHSR * (Ghr + GhrInj* Exp28) - Glucose * OX.GLUR ...
        -OX.MC4R *(1 - Exp3) * POMC.aMSH + OX.Y1R *(1 - Exp4) * (AgRP.NPY + AgRP.Exci * Exp26) + OX.Bias;
        OX.Res = max(0,OX.Live * OX.Net) ;
        OX.OXN =OX.Res;
        
       
        
        
        %Update CRH structure
        %CRH.Net = CRH.MC4R * POMC.aMSH + CRH.OXTR * OXT.OXTN;
        %CRH.Res = CRH.Live * (1 / (1 + exp(-CRH.Net)));
        %CRH.CRHN =CRH.Res;
        
        
        
        %Update BDNF structure
        %BDNF.Net = BDNF.LepRB * Leptin;
        %BDNF.Res = BDNF.Live * (1 / (1 + exp(-BDNF.Net)));
        %BDNF.BDNFN =BDNF.Res;
        
        
        %Update NTSCA structure
        if CCK * NTSCA.CCKR == 0 || (NTSCA.OXTR * OXT.OXTN + NTSCA.LepRB*(1- Exp10) * (1-Exp12) * (Leptin + LeptinInj* Exp27) * (1-Exp6) + -NTSCA.GHSR * (Ghr + GhrInj* Exp28) - NTSCA.OXR*OX.OXN) <= 0
            NTSCA.Net=0;
        else
        NTSCA.Net =  NTSCA.CCKR * CCK + 0.15 * Metformin + NTSCA.OXTR * OXT.OXTN + NTSCA.LepRB*(1- Exp10) * (1-Exp12) * (Leptin + LeptinInj* Exp27) * (1-Exp6) + -NTSCA.GHSR * (Ghr + GhrInj* Exp28)- NTSCA.OXR * OX.OXN + NTSCA.Bias ;
        end
        NTSCA.Res = max(0, NTSCA.Live * NTSCA.Net) ;
        NTSCA.CA=NTSCA.Res;
        
        %Update NTSGLP1
        NTSGLP1.Net= NTSGLP1.LepRB * (Leptin + LeptinInj* Exp27) * (1-Exp6)* (1- Exp10)*(1-Exp12) - NTSGLP1.GHSR * (Ghr + GhrInj* Exp28)+ NTSGLP1.CAR * NTSCA.CA;
        NTSGLP1.Res = max(0, NTSGLP1.Live * NTSGLP1.Net) ;
        NTSGLP1.GLP1N=NTSGLP1.Res + GLP1inj * Exp33;
        
        
        
        %Update VTA structure
        VTA.Net = VTA.OXR * OX.OXN + -VTA.LepRB *(1- Exp12) * (Leptin + LeptinInj* Exp27) * (1-Exp6) + VTA.GHSR * (Ghr + GhrInj* Exp28)...
            + VTA.NtsnR * Ntsn.NtsnN - VTA.GLP1R * NTSGLP1.GLP1N + VTA.Bias;
        VTA.Res = max(0,VTA.Live * VTA.Net) ;
        VTA.DA= VTA.Res;
        
        %Update NAc structure
        NAc.Net = NAc.GLP1R * NTSGLP1.GLP1N - NAc.DAR * VTA.DA - NAc.MCHR * MCH.MCHN -NAc.Y1R * AgRP.NPY + NAc.Bias;
        NAc.Res = max( 0, NAc.Live * NAc.Net);
        
        %Assign value to food intake
        
        FoodIntake= max(0,-NAc.Res - NTSCA.Res+ FoodIntakeBias) ;
        %Update DR structure
        %DR.Net = DR.CRHR * CRH.CRHN + DR.DAR * VTA.DA + DR.OXTR * OXT.OXTN;
        %DR.Res = DR.Live * (1 / (1 + exp(-DR.Net)));
        %DR.FHT=DR.Res;
        
       
        % hold cell segments up to netLim
       % AgRPresSeg(j) = AgRP.Res;
       % OXTresSeg(j) = OXT.Res;
       % NTSresSeg(j) = NTSCA.Res;
        %POMCresSeg(j) = POMC.Res;
        %NesfatinresSeg(j) = Nesfatin.Res;
       % CRHresSeg(j) = CRH.Res;
        %NeurotenresSeg(j) = Neuroten.Res;
        %LHAGABAergicresSeg(j) =LHAGABAergic.Res;
        %OXresSeg (j) = OX.Res;
        %BDNFresSeg (j) = BDNF.Res;
        %VTAresSeg (j)= VTA.Res;
       % DRresSeg (j)= DR.Res;
       %NAcresSeg (j) = NAc.Res;
       %NOSGABAergicresSeg(j) = NOSGABAergic.Res;
       
    end
    %break here to see the unadapted network
    if justInit ==1, break; end
end
