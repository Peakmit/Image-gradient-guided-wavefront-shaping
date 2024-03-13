function [psf_new] =  psf_move(psf)
% function psf_new =  psf_move(psf)
[R C] = size(psf);
[r c] = find(psf == max(psf,[],'all'));
psf_new = circshift(psf,[R/2-r C/2-c]);
end

