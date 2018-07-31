clear all

addpath(genpath('/Volumes/taghia/BayesianHiddenFactorAnalysis/BSDS'))
% generate a random data
nsubjs = 2;
dim = 4;
nsamps = 40;
for subj =1 : nsubjs
      data{subj} = randn(dim, nsamps);
end

%% full initialization
% max_nstates =   ; % set it to a large value. Model will automatically assign close to zeor weights to states with minimum responsibility
% max_ldim =   ; % <=dim-1
% opt.n_iter =   ; % 100-200 iterations are usually enough
% opt.noise =   ; % either 0 or 1
% opt.n_init_learning =   ; % has to be greater than 1 (uaually 10-15 is good of course you can have more if you got time :)
% model = BayesianSwitchingDynamicStateSpace(data, max_nstates, max_ldim, opt)

%% intialization using defualt
%load data
max_states = 20; % set it to a large value. Model will automatically assign close to zeor weights to states with minimum responsibility
max_ldim = size(data{1}, 1) - 1;
opt.n_iter = 10;
opt.tol = 1e-10;
opt.n_init_iter = 10;
opt.noise = 0;
opt.n_init_learning = 1;
data = data;
group_model = BayesianSwitchingDynamicalSystems(data, max_states, max_ldim, opt);
subj_model = compute_subject_level_stats(data, group_model, opt.n_iter);
[stats_group, stats_subj] = vector_autoregressive_model(data, group_model, subj_model);


