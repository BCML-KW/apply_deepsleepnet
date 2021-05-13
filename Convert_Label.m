% 1(W) => 0
% 2(R)  => 4
% 3(L)  => 1
% 4(D)  => 3
load('SNU_experiment_final_all_last_41parameter.mat')
data_dir = 'F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\SNU_data\';

% save('SNU_experiment_final_all_last_41parameter.mat', 'Tmm')

for i=1:size(Tmm, 1)
    name0 = char(Tmm.Var2(i));
    name = [name0(6:14) name0(4) name0(15:end)];
    name_save = ['sub' num2str(Tmm.sub(i), '%02d') name0(12:14) name0(4) name0(19:end)];
    if name_save(end-4)=='_'
        name_save(end-4)='0';
    end

    new_hyp = [];
    hyp = cell2mat(Tmm.Var14(i));
    hyp = hyp(1:end-1);
    for j = 1:length(hyp)
        if hyp(j) == 1 %W
            new_hyp = [new_hyp; 0];
        elseif hyp(j) == 2 %R
            new_hyp = [new_hyp; 4];
        elseif hyp(j) == 3 %N1 + N2
            new_hyp = [new_hyp; 1];
        elseif hyp(j) == 4 %N3
            new_hyp = [new_hyp; 3];
        end
    end
    load([data_dir name]);
    save(string(['.\SNU_exp_Label\' name_save]), 'new_hyp', 'sig');
end