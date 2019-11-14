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
% compute diffenrence of snr after filtering
snr_diff = ComputeSNR(clean_speech,noisy_speech,output_speech);

% plot frequency periodogram 
[epsd_dsig,wd] = periodogram(clean_speech);
[epsd_nsig,wn] = periodogram(noisy_speech);
[epsd_osig,wo] = periodogram(output_speech); 

% plot time domain the clean speech, the noisy speech and the filtered
% speech 
figure(1);
subplot(1,2,1);
plot(clean_speech,'r');
hold on; 
plot(noisy_speech,'b');
legend('desired(clean) speech', 'noisy speech');
title('comparison of clean speech and noisy speech in time domain');
subplot(1,2,2);
plot(clean_speech,'r');
hold on;
plot(output_speech,'g');
legend('desired(clean) speech','output speech'); 
title('comparison of clean speech and output speech in time domain');

% plot frequency domain the clean speech, the noisy speech and the filtered
% speech 
figure(2);
subplot(1,2,1);
plot(wd,10*log10(epsd_dsig),'r--');
hold on;
plot(wn,10*log10(epsd_nsig),'b--');
legend('desired(clean) speech','noisy speech');
title('comparison of clean speech and noisy speech in freq domain');

subplot(1,2,2);
plot(wd,10*log10(epsd_dsig),'r--');
hold on;
plot(wo,10*log10(epsd_osig),'g--');
legend('desired(clean) speech','output speech');
title('comparison of clean speech and output speech in freq domain');


% compare between noisy speech and output speech
figure(3)
subplot(1,2,1);
plot(noisy_speech,'b');
hold on;
plot(output_speech,'g');
legend('noisy speech','output speech');
title('comparison of noisy speech and output speech in time domain');
subplot(1,2,2);
plot(wn,10*log10(epsd_nsig),'b--');
hold on;
plot(wo,10*log10(epsd_osig),'g--');
legend('noisy speech','output speech');
title('comparison of noisy speech and output speech in freq domain');









