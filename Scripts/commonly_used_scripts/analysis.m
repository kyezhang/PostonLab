function result = analysis(Mask,W)

% Find True Positives
N = length(find(Mask > 0));
x1 = W .* Mask;
TP = length(find( abs(x1) > 0));
FN = N-TP;  %False Negatives
fTP = TP/N;  %fraction true positives
fFN = FN/N;  %fraction false negatives
x2 = W .* (1-Mask);
FP = length(find( abs(x2) > 0));
% Find True Negatives
n_actMask = (1-Mask);
n_actMask = n_actMask - eye(size(n_actMask));
Nn = length(find(n_actMask > 0));%actual true negtives
W1 = W > 0;
x3 = (1-W1) .* n_actMask;
TN = length(find( abs(x3) > 0));
A = (TP+TN)/(TP+TN+FP+FN);
fFP = FP/Nn; %fraction false positives
fTN = TN/Nn; %fraction true negatives
result = [fTP fTN fFP fFN A];