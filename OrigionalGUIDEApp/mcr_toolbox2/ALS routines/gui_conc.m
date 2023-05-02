function [X] = gui_conc(t,Co,k_vals,rxn_path,rxn_order);
% [X] = gui_conc(t,Co,k_vals,rxn_path,rxn_order);
% use reaction order and pathway matrices to fit conc curves
% R. Dyson 1998

% From Kinetic HM:
% t = modelActiu
% Co = .concs.ci --> starting concentrations as entered by user (1 x #Species)
% k_vals = constants.ki --> starting reaction rates entered by user ()
% rxn_path = model.N Stoichiometric matrix
% rxn_order = model.R Reactant coefficint matrix
%   model from eq2mat_hard.m


ct = Co'; % (#specise x 1)
% X = Path x (K x C^n)
X = rxn_path * (k_vals' .* prod( ct(ones(size(k_vals)),:) .^ rxn_order , 2 ));
% Product allong row to make n x 1 matrix
