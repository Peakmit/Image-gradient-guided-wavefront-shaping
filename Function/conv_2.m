function out = conv_2(A,B)
% function out = conv_2(A,B)
out = ifftshift(ifft2(fft2(A).*fft2(B)));
end

