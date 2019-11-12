% speech enhancement 14-11-2019
% data preprocessing

% load clean speech
clean_speech_path = 'C:\Users\Karen\Desktop\SpeechEnhancement\OriginalData\clean_speech.WAV';
% desired snr ratio
snr_ratio = 5; 
% add white noise to the original signal 
[y,Fs] = audioread(clean_speech_path);
signal = transpose(y);
noisy_signal = AddNoise(signal,snr_ratio);

% plot time domain the clean speech and the noisy speech 
figure(1);
subplot(2,1,1);
plot(signal);
title('clean speech');
subplot(2,1,2);
plot(noisy_signal);
title('noisy speech');
xlabel('time domain');


save('C:\Users\Karen\Desktop\SpeechEnhancement\SpeechEnhancement\TempData\Preprocessed.mat');


























