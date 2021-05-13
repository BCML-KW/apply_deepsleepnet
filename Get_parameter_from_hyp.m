load('SNU_experiment_64par_B0SNet.mat')
load('BCG_65_table.mat')
 
    TST_B0 = []; REM_B0=[]; Light_B0=[];Deep_B0=[];SSI_B0=[]; RNR_B0=[];
    SOL_B0 = []; REM_lat_B0 =[]; Light_lat_B0 = []; Deep_lat_B0 = []; SNR_B0 = [];
    WASO_B0 = [];

% Tmm = T30;
for i = 1:size(Td,1)
    eeg0 =cell2mat(Td.Pred(i))';
     eeg=[];
      for k=1:length(eeg0) % BCG만
          eeg = [eeg; eeg0(k)+1];
      end
%     plot(eeg);
    Wake_flag = 0;Wake_cnt = 0;
    REM_flag = 0;REM_cnt = 0;
    Deep_flag = 0;Deep_cnt = 0;
    Light_flag = 0;Light_cnt = 0;SSI_cnt=0; WASO_cnt=0;
    for j = 1:length(eeg)-1
        if Wake_flag ==1 &&  eeg(j)==1
            WASO_cnt= WASO_cnt+1;
        end
        if eeg(j)~=1&&Wake_flag ==0
           Wake_flag = 1;
           SOL_B0 =[SOL_B0; (j+1)/2];
        elseif eeg(j)==2&&REM_flag==0
            REM_flag = 1;
            REM_lat_B0 = [REM_lat_B0; j/2];
        elseif eeg(j)==3&&Light_flag ==0
            Light_flag = 1;
            Light_lat_B0 = [Light_lat_B0; j/2];
        elseif eeg(j)==4&&Deep_flag ==0
            Deep_flag = 1;
            Deep_lat_B0 = [Deep_lat_B0; j/2];
        end
        if REM_flag==0 && j == length(eeg)-1
            REM_lat_B0 = [REM_lat_B0; j/2];
        end
        if eeg(j) == 1; Wake_cnt=Wake_cnt+1;
        elseif eeg(j) == 2; REM_cnt = REM_cnt+1;
        elseif eeg(j) == 3; Light_cnt = Light_cnt+1;
        elseif eeg(j) == 4; Deep_cnt = Deep_cnt+1;end

        if eeg(j) ~=eeg(j+1)
            SSI_cnt = SSI_cnt+1;
        end
    end
        if j==length(eeg)&&REM_flag==0
            REM_flag = 1;
            REM_lat_B0 = [REM_lat_B0; j/2];
        end
        if  j==length(eeg)&&Light_flag==0
            Light_flag = 1;
            Light_lat_B0 = [Light_lat_B0; j/2];
        end
        if  j==length(eeg)&&Deep_flag==0
            Deep_flag = 1;
            Deep_lat_B0 = [Deep_lat_B0; j/2];
        end
        
        
        TST_B0=[TST_B0; 420-Wake_cnt/2];
        REM_B0=[REM_B0; REM_cnt/2];
        RNR_B0 =[RNR_B0; REM_cnt/(Light_cnt+Deep_cnt)];
        SNR_B0 = [SNR_B0; Deep_cnt/(Light_cnt+Deep_cnt)];
        Light_B0=[Light_B0; Light_cnt/2];
        Deep_B0=[Deep_B0; Deep_cnt/2];
        SSI_B0 = [SSI_B0; SSI_cnt*60/(420-Wake_cnt/2)];
        WASO_B0 = [WASO_B0; WASO_cnt/2];
end
% TST_B02=TST_B0SC; REM_B02=REM_B0SC; Light_B02=Light_B0SC; Deep_B02=Deep_B0SC; 
% RNR_B02=RNR_B0SC; SSI_B02=SSI_B0SC; SOL_B02=SOL_B0SC; REM_lat_B02=REM_lat_B0SC;
% Light_lat_B02=Light_lat_B0SC; Deep_lat_B02=Deep_lat_B0SC;

B = table(    TST_B0 , REM_B0, Deep_B0, RNR_B0, SNR_B0, SSI_B0, ...
    SOL_B0, REM_lat_B0 , WASO_B0);

Td = [Td B];

save('sub60_22par_table', 'Td')
% save('SNU_experiment_74par_B0SNet.mat', 'Tmm')