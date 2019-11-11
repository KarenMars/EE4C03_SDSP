% speech enhancement 14-11-2019 
% select wav data from timit dataset

maindir = 'C:\Users\Karen\Desktop\SpeechEnhancement\Data\TIMIT\TRAIN';
subdir = dir(maindir);
td_path_list = { };

for i = 1:length(subdir)
    if (isequal(subdir(i).name,'.')||(isequal(subdir(i).name,'..'))||~subdir(i).isdir)
        continue;
    end
    ssubdir_path = fullfile(maindir,subdir(i).name);
    
    ssubdir_dir = dir(ssubdir_path);
    
    for j = 1:length(ssubdir_dir)
        if (isequal(ssubdir_dir(i).name,'.')||(isequal(ssubdir_dir(i).name,'..'))||~ssubdir_dir(i).isdir)
        continue;
        end
        sssubdir_path = fullfile(ssubdir_path,ssubdir_dir(i).name,'*.WAV');
        dat = dir(sssubdir_path);
        
        for k = 1:length(dat)
            data_path = fullfile(ssubdir_path,ssubdir_dir(i).name,dat(k).name);
            % the wav format training data path 
            td_path_list(end+1)= {data_path}; 
        end
        
        
       
    end
        
  
end
   

