% Step 2: Some matlab scripts to load voice files from files and drawing its power spectrum.
voice_folder = dir('voices\*.mp3'); % The folder in which the voice files has been saved
for i = 1:length(voice_folder)
    [voice,fs] = audioread(fullfile('voices', voice_folder(i).name));
    voice_X = fft(voice);
    hz = linspace(0,1000,fs/2+1);
    psd = abs(voice_X).^2;
    plot(hz,psd(1:length(hz)));
    xlabel('hz'); ylabel('Amplitude');
    title(strcat('Power spectrum of voice ',int2str(i)));
    % This part is for saving the drawn figure
    h = figure(1);
    file_name = strcat('v',int2str(i),'.png');
    saveas(h,fullfile('images',file_name));
end

%Step 3: fucntions to detect gender of a voice

% A function that gets the address of a file and then returns the peak
% value of the input voice address
function peak = peak_detector(file_address)
    [voice,fs] = audioread(file_address);
    voice_X = fft(voice);
    power_specturm_density = abs(voice_X).^2;
    hz = linspace(0, 1000, fs/2 + 1);
    [peak_y, peak_x] = max(power_specturm_density(0:length(hz)));
end

% This function is supposed to detect the gender of the voices passed to 
% it using peak_detector function. If the peak was between 50 and 180 the 
% voice is said to be of men and If the peak was between 165 and 255 the
% voice is said to be of women otherwise it says that it couldn't
% understand the gender of the voice
function genderdetector(folder_address)
    voice_folder = dir(fullfile(folder_address,'*.mp3')); % The folder in which the voice files has been saved
    fileID = fopen('labeled voices.txt','a');
    for i = 1:length(voice_folder)
        peak = peak_detector(fullfile(folder_address,voice_folder(i).name));
        if (peak <= 180 && peak >= 50)
            label = fullfile(folder_address,voice_folder(i).name) + ' male';
        elseif(peak >= 165 && peak <= 255)
            label = fullfile(folder_address,voice_folder(i).name) + 'female';
        else 
            label = fullfile(folder_address,voice_folder(i).name) + ' not detected';
        end
        fprintf(fileID, '%f \n',label);
    end
end



 