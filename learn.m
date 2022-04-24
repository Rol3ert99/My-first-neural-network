% this function trains the neural network
% e - error to be achieved by the network
% m - maximum number of learning steps
function [W_after, MSE] = learn(W_before, P, T, e, m)
W = W_before;
learning_rate = 0.1;
number_of_examples = size(P, 2);
number_of_outputs = size(T, 1);
MSE = zeros(1, 1);
for i = 1 : m
    example_number = randi(number_of_examples);
    X = P(:, example_number);
    Y = work(W, X);
    D = T(:, example_number) - Y;
    dW = learning_rate * X * D';
    W = W + dW;
    MSE(1, i) = 1/number_of_outputs * (D') * D;
    if MSE(1, i) < e
        break
    end
end
MSE = [MSE 0];
W_after = W;