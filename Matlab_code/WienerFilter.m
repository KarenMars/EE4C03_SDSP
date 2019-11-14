function [wiener_filter] = WienerFilter(h_length, d_signal, x_signal)
% speech enhancement 14-11-2019
% h_order the order of the wiener filter
% d_signal clean speech
% x_signal clean speech with noise

% % estimate power spectrum density by welch method
% Pxx = cpsd(x_signal,x_signal,[ ],[ ],NFFT);
% % hamming window, noverlap
% % estimate cross power spectrum density by welch method 
% Pxd = cpsd(x_signal,d_signal,[ ],[ ],NFFT);
% % computer wiener filter
% H_fq = Pxd./Pxx; % in frequency domain 



% % time domain
% row_num = h_length;
% col_num = row_num;
% M = col_num;
% % compute Rx autocorrelation vector
% Rx_f = xcorr(x_signal);
% [~,k] = max(Rx_f);
% Rx = Rx_f(k:k+M-1);
% Rx = Rx.';
% 
% % compute Rx autocorrelation matrix 
% Rx_toep = toeplitz(Rx,Rx);
% 
% % computer Rdx
% Rdx_f = xcorr(d_signal,x_signal);
% Rdx = Rdx_f(k:k+M-1);
% Rdx = Rdx.';
% %wiener-hobf equation
% wiener_filter = Rx_toep\Rdx;

% estimate noise from ideal 
estimate_v = x_signal - d_signal;

N = length(x_signal);

Pd = real(fft(d_signal,N*2-1)).^2;
Pv = real(fft(estimate_v,N*2-1)).^2;
% Px = real(fft(x_signal,N*2-1));

H = Pd./(Pd+Pv);

H_time = real(ifft(H));

wiener_filter = H_time(1:h_length); 


end


