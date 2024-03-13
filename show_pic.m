function [out,psf] = show_pic(obj,phase_disturb,X)
%   show_pic: Show intensity distribution on the camera
%   Input:
%   obj: Target to be imaged
%   phase_disturb: Phase disturbance caused by scattering media
%   X: Optimized phase on the SLM
%   Output:
%   out: Corrected image on the camera
%   psf: Corrected point spread function

    global N_pic;
    global N_phase;
    global ans_dim;
    slm = extends_mat(reshape(X,ans_dim,ans_dim),N_phase/ans_dim);
    phase_slm = extends_mat(exp(1j*(slm)),N_phase/ans_dim);

    phase_screen = zeros([N_pic N_pic]);
    slm_screen = zeros([N_pic N_pic]);
    phase_screen((round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase,(round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase) = phase_disturb;
    slm_screen((round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase,(round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase) = phase_slm;
    
    psf = abs(fftshift(fft2(phase_screen.*slm_screen))).^2;
    out = conv_2(obj,psf_move(psf));

    figure();
    subplot(1,2,1);
    imagesc(out);
    title('Corrected Image');
    hold on;
    subplot(1,2,2);
    imagesc(obj);
    title('Original Target');
end

