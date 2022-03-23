codegen(Start,Final,ActionList):-
    iddfs(Start,Final,ActionList).

iddfs(Start,Final,ActionList):-
    iterative(Start,[Start],1,2,ActionList,Final).

iddfs(State,States,curr_depth,max_depth,[],Final):-
    State==Final,!.
iddfs(State1, SoFarStates,curr_depth,max_depth,ActionList,Final):-
    legal_action(State1, State2,Action),
    act_out(Action,L1),
    \+ member(State2, SoFarStates),
    append(SoFarStates, [State2], NewSoFarStates),
    depth_check(State2,NewSoFarStates,curr_depth,max_depth,L2,Final),
    append(L1,L2,ActionList).

depth_check(State,SoFarStates,depth,max_depth,ActionList,Final):-
    depth =< max_depth,
    new_depth is depth+1,
    iddfs(State2,SoFarStates,new_depth,max_depth,ActionList,Final).

iterative(State,[State],1,max_depth,ActionList,Final):-
    iddfs(State,[State],1,max_depth,ActionList,Final),!.
iterative(State,[State],1,max_depth,ActionList,Final):-
    new_max is max_depth+1,
    iterative(State,[State],1,new_max,ActionList,Final).

between(N1,N2,N1):-
    N1 =< N2.
between(N1,N2,X):- 
    N1 < N2,
    NewN1 is N1+1,
    between(NewN1,N2,X).

legal_action(State1,State2,Action):-
    length(State1,N),
    N1 is N-1,
    between(1,N1,X),
    move(X,State1,State2),
    Y is X+1,
    Action is X.
legal_action(State1,State2,Action):-
    length(State1,N),
    move(N,1,State1,State2),
    Action is N.
legal_action(State1,State2,Action):-
    length(State1,N),
    N1 is N-1,
    between(1,N1,X),
    X1 is X+1,
    between(X1,N,Y),
    swap(X,Y,State1,State2),
    Action=(X,Y).

move(X,State1,State2):-
    length(State1,N),
    X \= N,
    X1 is X-1,
    nth(X1,State1,T0),
    length(Prefix,X),
    append(Prefix,[_|Suffix],State1),
    append(Prefix,[T0],List),
    append(List,Suffix,State2).

move(X,State1,State2):-
    length(State1,N),
    X == N,
    X1 is X-1,
    nth(X1,State1,T0),
    append([],[_|Suffix],State1),
    append([T0],Suffix,State2).

swap(X,Y,State1,State2):-
    X1 is X-1,
    Y1 is Y-1,
    nth(X1,State1,T0),
    nth(Y1,State1,T1),
    length(Prefix1,X1),
    Len is Y1-X,
    length(Prefix2,Len),
    append(Prefix1,[_|Rest],State1),
    append(Prefix1,[T1],List1),
    append(Prefix2,[_|Suffix],Rest),
    append(Prefix2,[T0],List2),
    append(List1,List2,List3),
    append(List3,Suffix,State2).

nth(0,[X|List],X).
nth(N,[Y|List],X):-
    N > 0,
    N1 is N-1,
    nth(N1,List,X).

act_out(X,move(X)):-
    X \= (_,_).
act_out((X,Y),swap(X,Y)).

