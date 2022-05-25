:- lib(ic).
:- lib(branch_and_bound).
:- compile(graph).

% In order to not have an overlfow in the stack when creating the complement graph, we can simply avoid creating the graph,
% and instead do the proccess of finding the complement graphs edges and applying the constrains in the constrain predicate(without needing to have calculated the complement before hand)


maxclq(N,D,Detailed_Solution,Size) :-
    create_graph(N,D,Graph),
    length(Solution,N),
    Solution :: 0..1,
    constrain(1,2,N,Graph,Solution),  % place a constain of X+Y#<2 for all variables that are not connected 
    constrain_sum(Solution,0,Sum),    % get our cost function
    CostFunc #= -1*Sum,               % get negative of cost function so that the minimize of bb_min maximizes our result
    bb_min(search(Solution, 0, first_fail, indomain, complete, []),CostFunc,_),
    Size is -1*CostFunc,
    make_list(1,Solution,Detailed_Solution).



% Below is a double iteration that goes through all possible(non duplicate pairs of edges) and checks if they are part of the graph


constrain(N,J,N,Graph,Solution).
constrain(I,J,N,Graph,Solution):-
    Nplus is N+1,
    J==Nplus,
    Inew is I+1,
    Jplus is Inew+1,
    constrain(Inew,Jplus,N,Graph,Solution).
constrain(I,J,N,Graph,Solution):-
    I<N,
    J=<N,
    ((not(member(I-J,Graph)))->   % in case an edge is not a member of the graph, we place the constrain on the two points
        nth(X,Solution,I),
        nth(Y,Solution,J),
        X+Y #< 2
        ;
        true                      % else we move on to the rest
    ),
    Jnew is J+1,
    constrain(I,Jnew,N,Graph,Solution).


constrain_sum([],CostFunc,CostFunc).
constrain_sum([X|Xs],Cost,CostFunc):-
    NewCost#= X + Cost,
    constrain_sum(Xs,NewCost,CostFunc).

make_list(_,[],[]).
make_list(N,[X|List],[N|NewList]):-
    X==1,
    N1 is N+1,
    make_list(N1,List,NewList).
make_list(N,[X|List],NewList):-
    X==0,
    N1 is N+1,
    make_list(N1,List,NewList).


nth(X,[X|_],1).
nth(X,[_|Rest],N):-
    N1 is N-1,
    nth(X,Rest,N1).
