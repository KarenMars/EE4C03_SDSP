% speech enhancement 14-11-2019

clc;
clear;
close all; 
% load clean speech
clean_speech_path = 'C:\Users\Karen\Desktop\SpeechEnhancement\OriginalData\clean_speech.WAV';
% desired snr ratio
snr_ratio = 15; 

% add white noise to the original signal 
[y,Fs] = audioread(clean_speech_path);
signal = transpose(y);
noisy_signal = AddNoise(signal,snr_ratio);

% compute wiener filter
NFFT = 100;
wiener_filter = WienerFilter(NFFT,signal,noisy_signal);

% apply wiener filter 
output_speech = filter(wiener_filter,1,noisy_signal);

% outcome analysis 
% compute difference of snr after filtering
snr_diff = ComputeSNR(signal,noisy_signal,output_speech); 

% plot frequency periodogram 
[epsd_dsig,wd] = periodogram(signal);
[epsd_nsig,wn] = periodogram(noisy_signal);
[epsd_osig,wo] = periodogram(output_speech); 


% plot time domain the clean speech, the noisy speech and the filtered
% speech 
figure(1);
subplot(1,2,1);
plot(signal,'r');
hold on; 
plot(noisy_signal,'b');
legend('desired(clean) speech', 'noisy speech');
title('comparison of clean speech and noisy speech in time domain');
subplot(1,2,2);
plot(signal,'r');
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
plot(noisy_signal,'b');
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

% save wiener filter paramter
save('C:\Users\Karen\Desktop\SpeechEnhancement\SpeechEnhancement\TempData\WienerFilter.mat','wiener_filter');





