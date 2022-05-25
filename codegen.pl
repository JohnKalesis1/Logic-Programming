codegen(Start,Final,ActionList):-
    length(Start,Length),                               % usefull for every future move/swap 
    iterative(Start,[Start],1,ActionList,Final,Length). % everytime iddfs fails, it will restart with a higher depth
    
iddfs(State,States,Curr_depth,Max_depth,[],Final,Length,Prev_action):-
    compare_final(State,Final).
iddfs(State1, SoFarStates,Curr_depth,Max_depth,ActionList,Final,Length,Prev_action):-
    legal_action(State1,State2,Action,Length,Prev_action),
    not member(State2, SoFarStates),
    New_depth is Curr_depth+1,
    append(SoFarStates, [State2], NewSoFarStates),
    depth_check(State2,NewSoFarStates,New_depth,Max_depth,L2,Final,Length,Action), % instead of iddfs, we use an intermediate statement that gives us liberty to stop the dfs based on the max depth
    act_out(Action,L1),                                 % save the action in form desired for output
    append([L1],L2,ActionList).

depth_check(State,SoFarStates,Depth,Max_depth,ActionList,Final,Length,Prev_action):-
    (Depth<Max_depth->iddfs(State,SoFarStates,Depth,Max_depth,ActionList,Final,Length,Prev_action); % if we have not reached max depth continue the search, else check for final state
        compare_final(State,Final),ActionList=[]).

iterative(State,[State],Max_depth,ActionList,Final,Length):-
    New_max is Max_depth+1,
    (iddfs(State,[State],0,Max_depth,ActionList,Final,Length,0)->true;   % if iddfs fails for given depth, repeat iddfs for max_depth+1
        iterative(State,[State],New_max,ActionList,Final,Length) ).

compare_final([],[]).
compare_final([X|List1],[Y|List2]):-
    (X==Y;Y=='*'),
    compare_final(List1,List2).

between(N1,N2,N1):-
    N1 =< N2.
between(N1,N2,X):- 
    N1 < N2,
    NewN1 is N1+1,
    between(NewN1,N2,X).

legal_action(State1,State2,Action,N,Prev_action):- % move(X,X+1)
    N1 is N-1,
    between(1,N1,X),
    X1 is X+1,
    nth(X,State1,T0),
    nth(X1,State1,T1),
    T0 \= '*',
    T1 \= T0, % there is no point to move or swap the same symbols
    Action=X,
    (Prev_action==0;Prev_action\=Action), % there is no point in doing the same action again
    replace(T0,X1,State1,State2).

legal_action(State1,State2,Action,N,Prev_action):- % move(N,1)
    nth(N,State1,T0),
    nth(1,State1,T1),
    T0 \= '*',
    T1 \= T0,
    Action=N,
    (Prev_action==0;Prev_action\=Action),
    replace(T0,1,State1,State2).

legal_action(State1,State2,Action,N,Prev_action):- % swap(X,Y)
    N1 is N-1,
    between(1,N1,X),
    X2 is X+1,
    between(X2,N,Y),
    nth(X,State1,T0),
    nth(Y,State1,T1),
    T1 \= T0,
    Action=(X,Y),
    (Prev_action==0;Prev_action\=Action),
    replace(T0,Y,State1,State3),
    replace(T1,X,State3,State2).

nth(1,[X|List],X).
nth(N,[Y|List],X):-
    N > 1,
    N1 is N-1,
    nth(N1,List,X).

replace(X,1,[Z|List],[X|List]).
replace(X,N,[Z|List1],List2):-
    N > 1,
    N1 is N-1,
    replace(X,N1,List1,List3),
    append([Z],List3,List2).

act_out(X,move(X)):-
    X \= (_,_).
act_out((X,Y),swap(X,Y)).


