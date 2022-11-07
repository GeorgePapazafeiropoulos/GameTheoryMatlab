%% Examples of Nash Equilibrium for Pure Strategies
% Various examples are presented where Nash equilibrium is queried for the
% case of pure strategies, using the function NashEquilibriumPureStr.m

%% Example 1
% Payoff matrix
payoff={[0,4],[4,0],[5,3];
    [4,0],[0,4],[5,3];
    [3,5],[3,5],[6,6]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)

%% Example 2
% Payoff matrix
payoff={[-1,1],[1,2];
    [0,0],[0,1]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)

%% Example 3 (Prisoner's Dilemma)
% Payoff matrix
payoff={[-1,-1],[-9,0];
    [0,-9],[-6,-6]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)

%% Example 4 (Matching Pennies)
% Payoff matrix
payoff={[-1,1],[1,-1];
    [1,-1],[-1,1]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)

%% Example 5 (Battle of the Sexes)
% Payoff matrix
payoff={[2,1],[0,0];
    [0,0],[1,2]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)

%% Example 6 (Stag-hunt)
% Payoff matrix
payoff={[7,7],[0,3];
    [3,0],[3,3]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)

%% Example 7 (Chicken)
% Payoff matrix
payoff={[-10,-10],[5,-5];
    [-5,5],[0,0]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)

%% Example 8 (rock-paper-scissors)
% Payoff matrix
payoff={[0,0],[-1,-1],[1,1];[1,1],[0,0],[-1,-1];[-1,-1],[1,1],[0,0]};
celldisp(payoff)

%%
% Nash equilibrium for pure strategy
NE = NashEquilibriumPureStr(payoff)

%%
% Game value
v=zeros(0,2);
for i=1:size(NE,1)
    v=[v;payoff{NE(i,1),NE(i,2)}];
end
%%
% Game value for player 1
v1=v(:,1)

%%
% Game value for player 2
v2=v(:,2)


