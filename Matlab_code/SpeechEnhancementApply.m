% speech enhancement applied in other noisy signal

clc;
clear;
close all;

load('C:\Users\Karen\Desktop\SpeechEnhancement\SpeechEnhancement\TempData\WienerFilter.mat','wiener_filter');

clean_speech_path = 'C:\Users\Karen\Desktop\SpeechEnhancement\OriginalData\clean_speech.WAV';
% noise_path = 'C:\Users\Karen\Desktop\SpeechEnhancement\OriginalData\Speech_shaped_noise.WAV';
noise_path = 'C:\Users\Karen\Desktop\SpeechEnhancement\OriginalData\babble_noise.WAV';
[clean_speech,Fs_clean] = audioread(clean_speech_path);
[noise, Fs_noise] = audioread(noise_path);

clean_speech = transpose(clean_speech);
noise = transpose(noise);
snr = 15; 
noisy_speech = TestOtherNoise(clean_speech,noise,Fs_clean,Fs_noise,snr);

% speech enhance by wiener filter 
output_speech = filter(wiener_filter,1,noisy_speech);











