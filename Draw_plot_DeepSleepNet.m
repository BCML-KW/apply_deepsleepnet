path = 'C:\Users\BMCL\Desktop\deepsleepnet-master\deepsleepnet-master\results_SC\';
name_path = 'C:\Users\BMCL\Desktop\deepsleepnet-master\deepsleepnet-master\output_SNU_SC\';
X = dir([name_path 'sub*.npz']);

for i = 1:60
Label2 = [];
name = X(i).name(1:end-4);
Pred = csvread([path name '_pred.csv']);
True = csvread([path name '_true.csv']);
figure;
    set(gca,'fontsize',14);
    plot(Pred,'b','linewidth',2);hold;
    plot(True','r--','linewidth',2);
    legend('DeepSleepNet', 'HMM');
    axis([1 length(Pred) -1 5]);
    set(gca,'YTick',0:4);
    set(gca,'YTickLabel',{'WAKE','N1','N2','N3', 'REM'});
    set(gca,'YDir','reverse');
    
    saveas(gca, ['F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\DeepSleepNet_SC_HMM_figure\' name '.png'])
Label = Pred;
% save(['F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\five_stage_label\' ...
%     name(1:end-2) '.mat'], 'Label')
for j = 1:length(Label)
    if Label(j)==0 %Wake
        Label2 = [Label2; 1]; %Wake
    elseif Label(j) ==1 %N1
        Label2 = [Label2; 3]; %Light
    elseif Label(j) ==2 %N2
        Label2 = [Label2;3];  %Light
    elseif Label(j) ==3 %N3
        Label2 = [Label2;4]; %Deep
    elseif Label(j) == 4 %REM
        Label2 = [Label2;2];
    end
end
    Label = Label2;
     save(['F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\DeepSleepNet_SC_label\' ...
     name(1:end-2) '.mat'], 'Label')
% figure;
%     set(gca,'fontsize',14);
%     plot(Label,'b','linewidth',2);
%     axis([1 length(Pred) 0 5]);
%     set(gca,'YTick',1:4);
%     set(gca,'YTickLabel',{'WAKE', 'REM', 'Light', 'Deep'});
%     set(gca,'YDir','reverse');
%     saveas(gca, ['F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\DeepSleepNet_figure\' name '.png'])
%     close all;
end

path = 'F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\Label for BCG\';
X = dir([path 'sub*.mat']);
for i = 1:30
    name = X(i).name;
    load([path X(i).name]);
    new_name = [name(1:5) name(10:end)];
    save([path new_name], 'Label');
end
    
    

