function snr = ComputeSNR(desired_sig,oobs_sig,moobs_sig)
% function [snr] = ComputerSNR(desired_sig,obs_sig,moobs_sig)
% desired_signal clean speech 
% oobs_sig noisy speech
% moobs_sig filtered noisy speech
% Speech enhancement 14-11-2019
P_desired_sig = sum(abs(desired_sig).*abs(desired_sig))/length(desired_sig);
P_oobs_sig = sum(abs(oobs_sig).*abs(oobs_sig))/length(oobs_sig);
P_moobs_sig = sum(abs(moobs_sig).*abs(moobs_sig))/length(moobs_sig);

snr_1 = P_desired_sig/P_oobs_sig;
snr_2 = P_desired_sig/P_moobs_sig;

snr = snr_2-snr_1; 

end

