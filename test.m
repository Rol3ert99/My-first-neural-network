% network inputs
P = [4              2               -1      % in 1 - number of legs
    0.01            -1              3.5     % in 2 - does it live in water
    0.01            2               0.01    % in 3 - can it fly
    -1              2.5             -2      % in 4 - does it have feathers
    -1.5            2               1.5];   % in 5 - does it born from eggs
%example1        example2         example3


% desired network outputs:
T = [1              0               0
     0              1               0
     0              0               1];
%example1        example2        example3
%mammal            bird            fish

W_before = init(5, 3);   %weight matrix
Y_before = work(W_before, P);
[W_after, MSE] = learn(W_before, P, T, 0.001, 100);
Y_after = work(W_after, P);     %network outputs after learning
%--------------------------------------------------------------------------
%TESTING
human = [2;
            0.2;
            0.2;
            0.1;
            0.05];

ostrich = [2;
         0;
         0.3;
         1;
         1];

answer_human = work(W_after, human);
answer_ostrich = work(W_after, ostrich);
plot(MSE)
xlabel('number of learning steps')
ylabel('MSE value')
title('Mean squared error in subsequent learning steps')
curtick = get(gca, 'xTick');
xticks(unique(round(curtick)));
