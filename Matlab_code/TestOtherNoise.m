function [noisy_speech] = TestOtherNoise(clean_speech,noise,fs_clean,fs_noise,snr)
% function [noisy_signal] = TestOtherNoise(clean_speech,noise)
% clean_speech 
% noise
% noisy_speech mix clean_speech with other noise to test wiener filter 
clean_speech = clean_speech(:);
clean_speech = (clean_speech-mean(clean_speech)).';
clean_speech_L = length(clean_speech);

if fs_clean ~= fs_noise
    n = resample(noise,fs_clean,fs_noise);
else
    n = noise;

n = n(:);
n = (n-mean(n)).';
n_L = length(n);

if n_L > clean_speech_L
    n = n(1:clean_speech_L);
else
    % noise length smaller than clean speech length 
    % padded with zeros 
    n = [n; zeros(clean_speech_L-n_L,1)];
end

L = clean_speech_L;

p_clean_speech =  sum(abs(clean_speech).*abs(clean_speech))/L;

p_noise =  sum(abs(n).*abs(n))/L;

k = (p_clean_speech/p_noise)*10^(-snr/10);

new_noise = sqrt(k)*n;

noisy_speech = clean_speech + new_noise; 

end

