function NE = NashEquilibriumPureStr(payoff)
% 
% Find Nash Equilibrium in Pure Strategies
% 
% Syntax
%     #NE# = NashEquilibriumPureStr(#payoff#)
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
%     #NE# [double(:inf x 2)] contains the Nash equilibria. #NE#(i,:)
%         provides one Nash equilibrium of the game with matrix #payoff#.
%         If there are more than one Nash equilibria, then size(#NE#,1)>1.
%         At the ith Nash equilibrium (#NE#(i,:)), #NE#(i,1) shows the
%         strategy of the 1st player (i.e. the id of the row of #payoff#
%         where the Nash equilibrium exists) whereas #NE#(i,2) shows the
%         strategy of the 2nd player (i.e. the id of the column of #payoff#
%         where the Nash equilibrium exists).
% 
% Example
%     % Example 1
%     payoff={[0,4],[4,0],[5,3];
%         [4,0],[0,4],[5,3];
%         [3,5],[3,5],[6,6]};
%     NE = NashEquilibriumPureStr(payoff);
%     % Example 2
%     payoff={[-1,1],[1,2];
%         [0,0],[0,1]};
%     NE = NashEquilibriumPureStr(payoff);
%     % Example 3 (Prisoner's Dilemma)
%     payoff={[-1,-1],[-9,0];
%         [0,-9],[-6,-6]};
%     NE = NashEquilibriumPureStr(payoff);
%     % Example 4 (Matching Pennies)
%     payoff={[-1,1],[1,-1];
%         [1,-1],[-1,1]};
%     NE = NashEquilibriumPureStr(payoff);
%     % Example 5 (Battle of the Sexes)
%     payoff={[2,1],[0,0];
%         [0,0],[1,2]};
%     NE = NashEquilibriumPureStr(payoff);
%     % Example 6 (Stag-hunt)
%     payoff={[7,7],[0,3];
%         [3,0],[3,3]};
%     NE = NashEquilibriumPureStr(payoff);
%     % Example 6 (Chicken)
%     payoff={[-10,-10],[5,-5];
%         [-5,5],[0,0]};
%     NE = NashEquilibriumPureStr(payoff);
%     % Example 2
%     % Outcome matrix for 1st player (1st player strategies as rows and
%     % 2nd player strategies as columns)
%     payoff1=round(5*rand(10));
%     % Outcome matrix for 2nd player (2nd player strategies as rows and
%     % 1st player strategies as columns)
%     payoff2=round(5*rand(10));
%     % Generate the payoff matrix in format acceptable by
%     % NashEquilibriumPureStr.m
%     for i=1:size(payoff1,1)
%         for j=1:size(payoff2,1)
%             payoff{i,j}=[payoff1(i,j),payoff2(j,i)];
%         end
%     end
%     NE = NashEquilibriumPureStr(payoff);
% 
% _________________________________________________________________________
% Copyright (c) 2022 by George Papazafeiropoulos
% _________________________________________________________________________


payoff1=cellfun(@(v)v(1),payoff);
payoff2=cellfun(@(v)v(2),payoff)';
NE=zeros(0,2);
% ith strategy of 2nd player
for i=1:size(payoff1,2)
    a=find(payoff1(:,i)==max(payoff1(:,i)));
    best1{i}=[a,i*ones(size(a))];
end
% ith strategy of 1st player
for i=1:size(payoff2,2)
    a=find(payoff2(:,i)==max(payoff2(:,i)));
    best2{i}=[i*ones(size(a)),a];
end
for i=1:size(payoff1,2)
    for j=1:size(payoff2,2)
        a=intersect(best1{i},best2{j},'rows');
        if ~isempty(a)
            NE=[NE;a];
        end
    end
end
end

