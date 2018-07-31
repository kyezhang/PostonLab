function Mapm_fdr = fdr_correction(Pvals, pval_uc)

M = size(Pvals,1);
pth = FDR(Pvals,pval_uc);
%pth = 0.02
if ~isempty(pth)
    Mapm_fdr = Pvals <= pth;
else
    Mapm_fdr = zeros(M);
end