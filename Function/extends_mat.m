function [out_mat] = extends_mat(mat_in,times)
% function [out_mat] = extends_mat(mat_in,times)

[r,c]=size(mat_in);
A = 1:r;
B = repmat(A,times,1);
C = [B(:)]';
A = 1:c;
B = repmat(A,times,1);
C_ = [B(:)]';
out_mat = mat_in(C,C_);
end

