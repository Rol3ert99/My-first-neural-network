% network operation - identification of one example
function [Y] = work(W, X)
beta = 5;
U = W' * X;
%activation function
Y = ones(size(U, 1), 1) ./ (1 + exp(-beta*U));
