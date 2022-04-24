% builds the network and initialize weights (randomly)
function [W] = init(S, K)
W = rand(S, K) * 0.2 - 0.1;