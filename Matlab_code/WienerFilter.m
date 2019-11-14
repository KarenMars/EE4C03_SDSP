function [wiener_filter] = WienerFilter(h_length, d_signal, x_signal)
% speech enhancement 14-11-2019
% h_order the order of the wiener filter
% d_signal clean speech
% x_signal clean speech with noise

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% estimated power spectrum density by welch method
Pxx = cpsd(x_signal,x_signal,[],[],1024);
% hamming window, noverlap
% estimated power spectrum density by welch method 
Pdd = cpsd(d_signal,d_signal,[],[],1024); 
% estimate noise and power spectrum density 
v = x_signal-d_signal;
Pvv = cpsd(v,v,[],[],1024); 
% estimate cross power spectrum density 
Pxd = cpsd(x_signal,d_signal,[],[],1024);

% plot estimiate power spectrum
figure(1);
subplot(2,1,1);
plot(Pxx,'b');
hold on;
plot(Pxd,'g');
legend('estimated power spectrum density of observed signal','estimated cross power spectrum');
title('estimated power spectrum density'); 


%  wiener filter


H_fq = Pdd./(Pdd+Pvv); % in frequency domain 

H_time = ifft(H_fq);


wiener_filter = (H_time(1:h_length));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % time domain FIR wiener filter 
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % estimate noise from ideal 
% estimate_v = x_signal - d_signal;
% 
% N = length(x_signal);
% 
% Pd = real(fft(d_signal,N*2-1)).^2;
% Pv = real(fft(estimate_v,N*2-1)).^2;
% 
% H = Pd./(Pd+Pv);
% 
% H_time = real(ifft(H));
% 
% wiener_filter = H_time(1:h_length); 


end


