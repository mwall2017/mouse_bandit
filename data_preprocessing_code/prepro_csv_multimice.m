%% prepro_csv 1 day for 1 or more mice

date = input('Date (MMDDYYYY): ','s');
root_dir = uigetdir;
file_names = dir(root_dir);
num_files = size(file_names,1);


for i = 1:num_files
    
    file_name = file_names(i).name;
    
    if file_name(1) ~= '.'
        
        cd(file_name);
        
        mouse_name = file_name;
        
        try
            prepro_csv(mouse_name,date,cd);
        catch ME
            warning(strcat('Error on Mouse: ',file_name))
            disp(ME)
        end
    end
    
    cd(root_dir);
end