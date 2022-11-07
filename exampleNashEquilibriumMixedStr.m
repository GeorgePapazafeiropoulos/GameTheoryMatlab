%% Examples of Nash Equilibrium for Mixed Strategies
% Various examples are presented where Nash equilibrium is queried for the
% case of mixed strategies, using the function NashEquilibriumMixedStr.m

%% Example 1
% Payoff matrix
payoff={[0,4],[4,0],[5,3];
    [4,0],[0,4],[5,3];
    [3,5],[3,5],[6,6]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)

%% Example 2
% Payoff matrix
payoff={[-1,1],[1,2];
    [0,0],[0,1]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)

%% Example 3 (Prisoner's Dilemma)
% Payoff matrix
payoff={[-1,-1],[-9,0];
    [0,-9],[-6,-6]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)

%% Example 4 (Matching Pennies)
% Payoff matrix
payoff={[-1,1],[1,-1];
    [1,-1],[-1,1]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)

%% Example 5 (Battle of the Sexes)
% Payoff matrix
payoff={[2,1],[0,0];
    [0,0],[1,2]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)

%% Example 6 (Stag-hunt)
% Payoff matrix
payoff={[7,7],[0,3];
    [3,0],[3,3]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)

%% Example 7 (Chicken)
% Payoff matrix
payoff={[-10,-10],[5,-5];
    [-5,5],[0,0]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)

%% Example 8 (rock-paper-scissors)
% Payoff matrix
payoff={[0,0],[-1,-1],[1,1];[1,1],[0,0],[-1,-1];[-1,-1],[1,1],[0,0]};
celldisp(payoff)

%%
% Nash equilibrium for mixed strategy
[v,NE] = NashEquilibriumMixedStr(payoff);
celldisp(v)
celldisp(NE)


