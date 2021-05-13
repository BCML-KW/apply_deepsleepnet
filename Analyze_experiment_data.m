load('BCG_table_32par.mat')
Tc = Tmm; Tc = Td;
A = []; S = []; SH = [];
for i=1:size(Tc,1)
    name = char(Tc.Var2(i));
    if name(19:20) == 'A_'
        A = [A;Tc(i,:)];
    elseif name(19:20) == 'S_'
        S = [S;Tc(i,:)];
    elseif name(19:20) == 'SH'
        SH = [SH;Tc(i,:)];
    else
        S = [S;Tc(i,:)];
    end
end

%%
[ mean(A.TST_H) mean(S.TST_H) mean(SH.TST_H) ]
signrank(A.TST_H, SH.TST_H, 'Tail', 'left')

[ mean(A.REM_H) mean(S.REM_H) mean(SH.REM_H) ]
signrank(A.REM_H, SH.REM_H,'Tail', 'left')

[ mean(A.Deep_H) mean(S.Deep_H) mean(SH.Deep_H) ]
signrank(A.Deep_H, SH.Deep_H)

[ mean(A.RNR_H) mean(S.RNR_H) mean(SH.RNR_H) ]
signrank(A.RNR_H, SH.RNR_H)

[ mean(A.SNR_H) mean(S.SNR_H) mean(SH.SNR_H) ]
signrank(A.SNR_H, SH.SNR_H, 'Tail', 'right')

[ mean(A.SSI_H) mean(S.SSI_H) mean(SH.SSI_H) ]
signrank(A.SSI_H, SH.SSI_H)

[ mean(A.SOL_H) mean(S.SOL_H) mean(SH.SOL_H) ]
signrank(A.SOL_H, SH.SOL_H)

[ mean(A.REM_lat_H) mean(S.REM_lat_H) mean(SH.REM_lat_H) ]
signrank(A.REM_lat_H, SH.REM_lat_H, 'Tail', 'right')
    
[ mean(A.WASO_H) mean(S.WASO_H) mean(SH.WASO_H) ]
signrank(A.WASO_H, SH.WASO_H, 'Tail', 'right')

%%
[ mean(A.TST_D) mean(S.TST_D) mean(SH.TST_D) ]
signrank(A.TST_D, SH.TST_D, 'Tail', 'left')
signrank(A.TST_D, S.TST_D, 'Tail', 'left')

[ mean(A.REM_D) mean(S.REM_D) mean(SH.REM_D) ]
signrank(A.REM_D, SH.REM_D,'Tail', 'left')

[ mean(A.Deep_D) mean(S.Deep_D) mean(SH.Deep_D) ]
signrank(A.Deep_D, SH.Deep_D)

[ mean(A.RNR_D) mean(S.RNR_D) mean(SH.RNR_D) ]
signrank(A.RNR_D, SH.RNR_D,'Tail', 'right')

[ mean(A.SNR_D) mean(S.SNR_D) mean(SH.SNR_D) ]
signrank(A.SNR_D, SH.SNR_D, 'Tail', 'left')

[ mean(A.SSI_D) mean(S.SSI_D) mean(SH.SSI_D) ]
signrank(A.SSI_D, SH.SSI_D, 'Tail', 'left')
signrank(A.SSI_D, S.SSI_D, 'Tail', 'right')

[ mean(A.SOL_D) mean(S.SOL_D) mean(SH.SOL_D) ]
signrank(A.SOL_D, SH.SOL_D, 'Tail', 'right')

[ mean(A.REM_lat_D) mean(S.REM_lat_D) mean(SH.REM_lat_D) ]
signrank(A.REM_lat_D, SH.REM_lat_D, 'Tail', 'right')
    
[ mean(A.WASO_D) mean(S.WASO_D) mean(SH.WASO_D) ]
signrank(A.WASO_D, SH.WASO_D, 'Tail', 'right')
signrank(A.WASO_D, S.WASO_D, 'Tail', 'right')

%%
[ mean(A.TST_B) mean(S.TST_B) mean(SH.TST_B) ]
signrank(A.TST_B, SH.TST_B, 'Tail', 'left')

[ mean(A.REM_B) mean(S.REM_B) mean(SH.REM_B) ]
signrank(A.REM_B, SH.REM_B,'Tail', 'right')

[ mean(A.Deep_B) mean(S.Deep_B) mean(SH.Deep_B) ]
signrank(A.Deep_B, SH.Deep_B,'Tail', 'right')
signrank(A.Deep_B, S.Deep_B,'Tail', 'left')

[ mean(A.RNR_B) mean(S.RNR_B) mean(SH.RNR_B) ]
signrank(A.RNR_B, SH.RNR_B,'Tail', 'right')
signrank(A.RNR_B, S.RNR_B,'Tail', 'right')

[ mean(A.SNR_B) mean(S.SNR_B) mean(SH.SNR_B) ]
signrank(A.SNR_B, SH.SNR_B, 'Tail', 'right')
signrank(A.SNR_B, S.SNR_B, 'Tail', 'left')

[ mean(A.SSI_B) mean(S.SSI_B) mean(SH.SSI_B) ]
signrank(A.SSI_B, SH.SSI_B, 'Tail', 'right')

[ mean(A.SOL_B) mean(S.SOL_B) mean(SH.SOL_B) ]
signrank(A.SOL_B, SH.SOL_B, 'Tail', 'left')

[ mean(A.REM_lat_B) mean(S.REM_lat_B) mean(SH.REM_lat_B) ]
signrank(A.REM_lat_B, SH.REM_lat_B, 'Tail', 'left')
    
[ mean(A.WASO_B) mean(S.WASO_B) mean(SH.WASO_B) ]
signrank(A.WASO_B, SH.WASO_B, 'Tail', 'left')

%%
[ mean(A.TST_B0) mean(S.TST_B0) ]
signrank(A.TST_B0, S.TST_B0, 'Tail', 'left')
signrank(A.TST_B0, S.TST_B0, 'Tail', 'right')

[ mean(A.REM_B0) mean(S.REM_B0) mean(S.REM_B0) ]
signrank(A.REM_B0, S.REM_B0,'Tail', 'left')

[ mean(A.Deep_B0) mean(S.Deep_B0) mean(S.Deep_B0) ]
signrank(A.Deep_B0, S.Deep_B0,'Tail', 'right')
signrank(A.Deep_B0, S.Deep_B0,'Tail', 'left')

[ mean(A.RNR_B0) mean(S.RNR_B0) mean(S.RNR_B0) ]
signrank(A.RNR_B0, S.RNR_B0,'Tail', 'right')
signrank(A.RNR_B0, S.RNR_B0,'Tail', 'left')

[ mean(A.SNR_B0) mean(S.SNR_B0) mean(S.SNR_B0) ]
signrank(A.SNR_B0, S.SNR_B0, 'Tail', 'right')
signrank(A.SNR_B0, S.SNR_B0, 'Tail', 'left')

[ mean(A.SSI_B0) mean(S.SSI_B0) mean(S.SSI_B0) ]
signrank(A.SSI_B0, S.SSI_B0, 'Tail', 'right')
signrank(A.SSI_B0, S.SSI_B0, 'Tail', 'left')

[ mean(A.SOL_B0) mean(S.SOL_B0) mean(S.SOL_B0) ]
signrank(A.SOL_B0, S.SOL_B0, 'Tail', 'left')

[ mean(A.REM_lat_B0) mean(S.REM_lat_B0) mean(S.REM_lat_B0) ]
signrank(A.REM_lat_B0, S.REM_lat_B0, 'Tail', 'left')
signrank(A.REM_lat_B0, S.REM_lat_B0, 'Tail', 'right')
   

[ mean(A.WASO_B0) mean(S.WASO_B0) mean(S.WASO_B0) ]
signrank(A.WASO_B0, S.WASO_B0, 'Tail', 'left')