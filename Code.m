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

%Step 3: 



 