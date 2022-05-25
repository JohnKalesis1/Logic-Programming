:-lib(ic).

genrand(N, List) :-
 length(List, N),
 make_list(N, List).
make_list(_, []).
make_list(N, [X|List]) :-
 random(R),
 X is R mod (N+1),
 make_list(N, List).


liars(List,Liars):-
    length(List,N),
    length(Liars,N),
    Liars::0..1,
    constrain_sum(Liars,0,Sum),
    constrain(Sum,List,Liars), % get sum of constrained variables in list
    search(Liars, 0, first_fail, indomain, complete, []).

constrain(_,[],[]).
constrain(Sum,[X|ListRest],[Y|LiarsRest]):-
    Y #= ( X#>Sum ),     % if someone is telling the truth, they need to be assigned 0, thus when the Sum of liars is at least X we want to get a false logic value, which means we use the denial of the Sum >= X sentence
    constrain(Sum,ListRest,LiarsRest).
    

constrain_sum([],FinalSum,FinalSum).
constrain_sum([X|Xs],Sum,FinalSum):-
    NewSum#= X + Sum,
    constrain_sum(Xs,NewSum,FinalSum).


nth(X,[X|_],1).
nth(X,[_|Rest],N):-
    N1 is N-1,
    nth(X,Rest,N1).
