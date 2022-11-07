function [v,NE] = NashEquilibriumMixedStr(payoff)
%
% Find Nash Equilibrium in Mixed Strategies
%
% Syntax
%     [#v#,#NE#] = NashEquilibriumMixedStr(#payoff#)
%
% Input arguments
%     #payoff# [cell(:inf x :inf)] is the payoff matrix of the game for
%         which the equilibrium is queried. Each cell of #payoff#, i.e.
%         #payoff#{i,j} contains a double array of size [double(1 x 2)],
%         which contains the outcome (payoff) for 1st player and for 2nd
%         player. The player whose strategies are the rows of the payoff
%         matrix is considered as the 1st player, i.e. the number of
%         strategies of the 1st player is equal to size(#payoff#,1). The
%         player whose strategies are the columns of the payoff matrix is
%         considered as the 2nd player, i.e. the number of strategies of
%         the 2nd player is equal to size(#payoff#,2).
%
% Output arguments
%     #v# [double(2 x 1)] contains the values of the game. #v#(1,1) is the
%         value of the game for the 1st player, and #v#(2,1) is the value
%         of the game for the 2nd player
%     #NE# [double(:inf x 2)] contains the Nash equilibria. #NE#{1,1} is of
%         size [double(:inf x 1)] and provides the probabilities of the
%         strategies of the 1st player. #NE#{2,1} is of size [double(:inf x
%         1)] and provides the probabilities of the strategies of the 2nd
%         player.
%
% Example
%     % Example 1
%     payoff={[0,4],[4,0],[5,3];
%         [4,0],[0,4],[5,3];
%         [3,5],[3,5],[6,6]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%     % Example 2
%     payoff={[-1,1],[1,2];
%         [0,0],[0,1]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%     % Example 3 (Prisoner's Dilemma)
%     payoff={[-1,-1],[-9,0];
%         [0,-9],[-6,-6]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%     % Example 4 (Matching Pennies)
%     payoff={[-1,1],[1,-1];
%         [1,-1],[-1,1]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%     % Example 5 (Battle of the Sexes)
%     payoff={[2,1],[0,0];
%         [0,0],[1,2]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%     % Example 6 (Stag-hunt)
%     payoff={[7,7],[0,3];
%         [3,0],[3,3]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%     % Example 6 (Chicken)
%     payoff={[-10,-10],[5,-5];
%         [-5,5],[0,0]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%     % Example 7 (rock-paper-scissors)
%     payoff={[0,0],[-1,-1],[1,1];[1,1],[0,0],[-1,-1];[-1,-1],[1,1],[0,0]};
%     [v,NE] = NashEquilibriumMixedStr(payoff);
%
% _________________________________________________________________________
% Copyright (c) 2022 by George Papazafeiropoulos
% _________________________________________________________________________


payoff1=cellfun(@(v)v(1),payoff);
payoff2=cellfun(@(v)v(2),payoff)';
v=cell(2,1);
NE=cell(2,1);
% Solve for the mixed strategy of the 1st player
M=payoff2;
[c,r] = size(M);
A = [-M, ones(c,1)];
Aeq = [ones(1,r),0];
b = zeros(c,1);
beq = 1;
Aeq=[Aeq;A];
beq=[beq;b];
A=[];
b=[];
lb = [zeros(r,1);-inf];
ub = [ones(r,1);inf];
f = [ zeros(r,1);-1];
options = optimset('Display','off');
p = linprog(f,A,b,Aeq,beq,lb,ub,[],options);
if ~isempty(p)
    v{1,1} = p(r+1);
    NE{1,1} = p(1:r);
else
    v{1,1} = [];
    NE{1,1} = zeros(r,0);
end

% Solve for the mixed strategy of the 2nd player
M=payoff1;
[c,r] = size(M);
A = [-M, ones(c,1)];
Aeq = [ones(1,r),0];
b = zeros(c,1);
beq = 1;
Aeq=[Aeq;A];
beq=[beq;b];
A=[];
b=[];
lb = [zeros(r,1);-inf];
ub = [ones(r,1);inf];
f = [ zeros(r,1);-1];
options = optimset('Display','off');
p = linprog(f,A,b,Aeq,beq,lb,ub,[],options);
if ~isempty(p)
    v{2,1} = p(r+1);
    NE{2,1} = p(1:r);
else
    v{2,1} = [];
    NE{2,1} = zeros(r,0);
end

end