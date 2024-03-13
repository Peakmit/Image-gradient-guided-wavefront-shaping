function [out] = Image_metric(correct_phase, phase_disturb, obj)
%   Image_metric: Cost Function of GA including different image
%   metrics(e.g. image gradient, modified entropy, image variance)
%   Input:
%   correct_phase: Target to be imaged
%   phase_disturb: Phase disturbance caused by scattering media
%   obj: Target to be imaged
%   Output:
%   out: The value calculated by image metric

    global N_pic;
    global N_phase;
    global ans_dim;
    global SNR;
    global operator_x;
    global operator_y;
    global I_cam

    phase_slm = extends_mat(exp(1i*(correct_phase)),N_phase/ans_dim);
    phase_screen = zeros([N_pic N_pic]);
    slm_screen = zeros([N_pic N_pic]);
    phase_screen((round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase,(round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase) = phase_disturb;
    slm_screen((round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase,(round(N_pic-N_phase)/2)+1:(round(N_pic-N_phase)/2)+N_phase) = phase_slm;
    psf = abs(fftshift(fft2(phase_screen.*slm_screen))).^2;
    I_cam = conv_2(obj,psf_move(psf));
    
    % Add detection noise
    I_cam = awgn(I_cam,SNR,'measured');
    
    % Select region of interest
    ROI = [1 N_pic; 1 N_pic];
    I_cam = I_cam(ROI(1,1):ROI(1,2), ROI(2,1):ROI(2,2));
    
%---------Image Metric--------
    % Image Gradient
    G = (abs(conv2(I_cam,operator_x,'valid')).^2 + abs(conv2(I_cam,operator_y,'valid')).^2);
    out = -sum(G,'all');
    
    % Modified Entropy
%     alpha = 0.4;
%     I_cam = alpha*I_cam/max(I_cam,[],'all');
%     out = -sum(I_cam.*log(I_cam),'all');

    % Image Variance
%     out =  -1*(mean(I_cam.^2,'all') - (mean(I_cam,'all')).^2);
end

