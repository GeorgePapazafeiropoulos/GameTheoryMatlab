%% Examples of Iterated Elimination of Strictly Dominated Strategies
% Various examples are presented where iterated elimination of strictly
% dominated strategies takes place, using the function IESDS.m

%% Example 1
% Payoff matrix
payoff={[1,0],[1,2],[0,1];
    [0,3],[0,1],[2,0]};
celldisp(payoff)

%%
% Reduced payoff matrix after iterated elimination of strictly dominated
% strategies procedure
payoffR1 = IESDS(payoff);
celldisp(payoffR1)

%% Example 2
% Payoff matrix
payoff={[2,0],[2,5],[1,1];
    [0,3],[0,4],[2,2]};
celldisp(payoff)

%%
% Reduced payoff matrix after iterated elimination of strictly dominated
% strategies procedure
payoffR2 = IESDS(payoff);
celldisp(payoffR2)

%% Example 3
% Payoff matrix
payoff={[2,0],[3,5],[4,4];
    [0,3],[2,1],[5,2]};
celldisp(payoff)

%%
% Reduced payoff matrix after iterated elimination of strictly dominated
% strategies procedure
payoffR3 = IESDS(payoff);
celldisp(payoffR3)

%% Example 4
% Payoff matrix
payoff={[2,1],[2,2];
    [3,4],[1,2];
    [1,2],[0,3]};
celldisp(payoff)

%%
% Reduced payoff matrix after iterated elimination of strictly dominated
% strategies procedure
payoffR4 = IESDS(payoff);
celldisp(payoffR4)

%% Example 5
% Payoff matrix
payoff={[3,2],[1,1],[1,0];
    [1,3],[0,2],[0,4];
    [2,-1],[-1,3],[2,0]};
celldisp(payoff)

%%
% Reduced payoff matrix after iterated elimination of strictly dominated
% strategies procedure
payoffR5 = IESDS(payoff);
celldisp(payoffR5)

