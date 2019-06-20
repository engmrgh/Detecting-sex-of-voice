% Step 2: Some matlab scripts to load voice files from files and drawing its power spectrum.
% voices_path = "voices\";
% voices = dir(voices_pat
clc;
clear all;
MAX_VOICE_LENGTH = 2000000; % The maximum size of the voice file
voice_folder = dir('voices\*.mp3'); % The folder in which the voice files has been saved
voice = zeros(length(voice_folder), MAX_VOICE_LENGTH, 'double'); % An array of all the voices its demensions are 1 to 20000000
for i = 1:length(voice_folder)
    tmp = audioread(fullfile('voices', voice_folder(i).name)); % this line reads a audio file from the address determined by fullfile 
    for j = 1:length(tmp)
        voice(i,j) = tmp(j); % add manuly and one to one a index from voice file into where we want to save that
    end
end