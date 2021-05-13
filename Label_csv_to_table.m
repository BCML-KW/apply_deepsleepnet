load('Mattress_30sub_table.mat')
load('BCG_table_32par.mat')
path = 'F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\BCG_result_1215\pred_15Dec\pred_15Dec\';
X = dir([path '*.csv']);
Pred = [];
for i = 1:size(X,1)
name = X(i).name(1:end-4);
eeg = csvread([path name '.csv']);
% eeg = [];
% for k = 1:length(eeg0)
%     eeg = [eeg; eeg0(k)+1];
% end

for j = 1:size(Td,1)
    table_name = char(Td.Var2(j));
    
    if  str2num(name(end-1))== mod(Td.Var1(j),10)
        if string([name(end) '_'])==string(table_name(end-5:end-4))
            Pred = [Pred; {eeg'}];
        end
    end
end
end

Td = [Td, table(Pred)];

save('BCG_65_table', 'Td')

%%
Td = Tmm;
emp = [];
for i = 1:size(Td,1)
    name = char(Td.Var2(i));
    if string(name(end-5:end-4)) ~= 'SH'
        emp = [emp; i];
    end
end

Te = [];
for j = 1:length(emp)
    Te = [Te; Td(emp(j),:)];
end

Td = Te