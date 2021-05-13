file_dir = 'F:\Sleep_data\Gtec\All_data\EEG_600Hz\EEG_600Hz\';
save_dir = 'F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\SNU_data\';
X =dir([file_dir '*.mat' ]);
for i = 1:size(X,1)
    EEG1 = []; EEG2 = []; sig = [];
    load([file_dir X(i).name]);
    for j = 1:2
        if j == 1
            EEG1 = downsample(EEG(:,j), 6);
            sig = reshape(EEG1, 3000, [], 1)';
            save([save_dir X(i).name(1:6) 'EEG1_' X(i).name(11:15) '.mat'], 'sig', '-v7');
        else
            EEG2 = downsample(EEG(:,j), 6);
            sig = reshape(EEG2, 3000, [], 1)';
            save([save_dir X(i).name(1:6) 'EEG2_' X(i).name(11:15) '.mat'], 'sig', '-v7');
        end
    end
end    

file_dir = 'F:\Sleep_data\Biopac\EEG_500Hz\EEG_500Hz\';
X =dir([file_dir '*.mat' ]);
for i = 1:size(X,1)
    EEG1 = []; EEG2 = []; sig = [];
    load([file_dir X(i).name]);
    for j = 1:2
        if j == 1
            EEG1 = downsample(EEG(:,j), 5);
            sig = reshape(EEG1, 3000, [], 1)';
            save([save_dir X(i).name(1:6) 'EEG1_' X(i).name(11:15) '.mat'], 'sig', '-v7');
        else
            EEG2 = downsample(EEG(:,j), 5);
            sig = reshape(EEG2, 3000, [], 1)';
            save([save_dir X(i).name(1:6) 'EEG2_' X(i).name(11:15) '.mat'], 'sig', '-v7');
        end
    end
end    
