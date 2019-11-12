function [noisy_signal] = AddNoise(signal, dsnr_db)

% generating zero mean white noise 
num = length(signal);
mu = 0;
sigma = 1;
noise = sigma*rand(1, num)+mu;
% compute power of signal 
p_signal = sum(abs(signal).*abs(signal))/num;
p_noise = sum(abs(noise).*abs(noise))/num;

% scaling factor 
k = (p_signal/p_noise)*10^(-dsnr_db/10);

new_noise = sqrt(k)*noise;
noisy_signal = signal + new_noise; 
end 

