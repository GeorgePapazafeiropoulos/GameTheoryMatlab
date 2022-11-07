function payoffR = IESDS(payoff)
%
% Iterated Elimination of Strictly Dominated Strategies
%
% Syntax
%     #payoff# = IESDS(#payoff#)
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
%     #payoffR# [cell(:inf x :inf)] is the reduced payoff matrix of the
%         game after elimination of the dominated strategies.
%
% Example
%     % Example 1
%     payoff={[1,0],[1,2],[0,1];
%         [0,3],[0,1],[2,0]};
%     payoffR1 = IESDS(payoff)
%     % Example 2
%     payoff={[2,0],[2,5],[1,1];
%         [0,3],[0,4],[2,2]};
%     payoffR2 = IESDS(payoff)
%     % Example 3
%     payoff={[2,0],[3,5],[4,4];
%         [0,3],[2,1],[5,2]};
%     payoffR3 = IESDS(payoff)
%     % Example 4
%     payoff={[2,1],[2,2];
%         [3,4],[1,2];
%         [1,2],[0,3]};
%     payoffR4 = IESDS(payoff)
%     % Example 5
%     payoff={[3,2],[1,1],[1,0];
%         [1,3],[0,2],[0,4];
%         [2,-1],[-1,3],[2,0]};
%     payoffR5 = IESDS(payoff)
%
% _________________________________________________________________________
% Copyright (c) 2022 by George Papazafeiropoulos
% _________________________________________________________________________


payoff1=cellfun(@(v)v(1),payoff);
payoff2=cellfun(@(v)v(2),payoff)';

sw1=true;
sw2=true;
while sw1 || sw2
    % Scan strategies of 2nd player and check the outcomes of the 1st
    % player
    sw1=false;
    i=1;
    j=2;
    s1=size(payoff1,1);
    while i<=s1
        while j<=s1
            [payoff1Sorted,ind]=sortrows([payoff1(i,:);payoff1(j,:)],1);
            if all(diff(payoff1Sorted,1,1)>0,2)
                sw1=true;
                if ind(1)==1
                    payoff1(i,:)=[];
                    payoff2(:,i)=[];
                elseif ind(1)==2
                    payoff1(j,:)=[];
                    payoff2(:,j)=[];
                end
            else
            end
            j=j+1;
            s1=size(payoff1,1);
        end
        i=i+1;
        j=i+1;
        s1=size(payoff1,1);
    end
    % Scan strategies of 1st player and check the outcomes of the 2nd
    % player
    sw2=false;
    i=1;
    j=2;
    s2=size(payoff2,1);
    while i<=s2
        while j<=s2
            [payoff1Sorted,ind]=sortrows([payoff2(i,:);payoff2(j,:)],1);
            if all(diff(payoff1Sorted,1,1)>0,2)
                sw2=true;
                if ind(1)==1
                    payoff2(i,:)=[];
                    payoff1(:,i)=[];
                elseif ind(1)==2
                    payoff2(j,:)=[];
                    payoff1(:,j)=[];
                end
            else
            end
            j=j+1;
            s2=size(payoff2,1);
        end
        i=i+1;
        j=i+1;
        s2=size(payoff2,1);
    end
end
% Generate the payoff matrix in its input format
payoffR=cell(size(payoff1,1),size(payoff2,1));
for i=1:size(payoff1,1)
    for j=1:size(payoff2,1)
        payoffR{i,j}=[payoff1(i,j),payoff2(j,i)];
    end
end

end
