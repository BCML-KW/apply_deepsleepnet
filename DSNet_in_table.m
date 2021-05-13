load('SNU_experiment_63par_DSNet.mat')
Loc = 'F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\DeepSleepNet_SC_label\';
X = dir([Loc '*.mat']);
DSNet_SC = [];
for i = 1:size(X,1)
    load([Loc X(i).name]);
    f_name = X(i).name;
    for j = 1:size(Tmm,1)
    name = char(Tmm.Var2(j));
    sub = Tmm.sub(j);
    EEG_n = str2num(name(4));
    condition = name(end-5:end-4);
        if str2num(f_name(4:5)) == sub  &&  str2num(f_name(9)) == EEG_n
            if string(f_name(end-5:end-4))=='A0' && string(condition) =='A_'
                DSNet_SC = [DSNet_SC; {Label}];
            elseif string(f_name(end-5:end-4))=='S0' && string(condition) =='S_'
                DSNet_SC = [DSNet_SC; {Label}];
            elseif string(f_name(end-5:end-4))=='SH' && string(condition) =='SH'
                DSNet_SC = [DSNet_SC; {Label}];
            end
        end
    end
end

% Tmm = [Tmm, table(DSNet_SC)];