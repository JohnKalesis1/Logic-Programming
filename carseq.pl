:-lib(ic).
:-lib(ic_global).

%classes([1,1,2,2,2,2]).
%options([2/1/[1,0,0,0,1,1],
%         3/2/[0,0,1,1,0,1],
%         3/1/[1,0,0,0,1,0],
%         5/2/[1,1,0,1,0,0],
%         5/1/[0,0,1,0,0,0]]).

%classes([5,3,7,1,10,2,11,5,4,6,12,1,1,5,9,5,12,1]).
%options([2/1/[1,1,1,0,1,1,1,1,0,0,0,0,0,1,0,0,0,0],
%         3/2/[1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,0,0,0],
%         3/1/[0,0,1,1,0,0,0,1,0,0,1,1,1,0,0,0,0,1],
%         5/2/[0,1,0,1,0,0,1,0,0,1,0,0,1,0,0,0,1,0],
%         5/1/[1,0,0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0]]).


%classes([6,3,2,2,1,4,1,5,2,3]).
%options([2/1/[1,1,1,0,0,0,0,0,1,0],
%         3/2/[0,1,1,1,0,1,1,0,0,0],
%         3/1/[0,1,0,1,0,0,1,1,1,1],
%         5/2/[1,0,0,0,1,0,1,1,1,0],
%         5/1/[0,0,1,0,0,0,0,0,0,0]]).

classes([6,10,2,2,8,15,1,5,2,3,2,1,8,3,10,4,4,2,4,6,1,1]).
options([7/6/[1,1,1,0,0,0,0,0,1,0,1,1,0,1,1,0,0,1,1,1,1,1],
         9/6/[0,1,1,1,0,1,1,0,0,0,0,1,1,0,0,1,0,0,1,1,0,1],
         6/4/[0,1,0,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1],
         4/2/[1,0,0,0,1,0,1,1,1,0,0,0,1,1,0,0,0,0,0,1,0,1],
         8/4/[0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,1,1,1,0,0,1,1]]).


carseq(Solution):-
    options(Options), 
    classes(Classes),
    length(Classes,NumConfigurations),                  % get number of different configurations
    count_cars(Classes,0,Total_Cars),
    length(Solution,Total_Cars),                        % create a list that will contain the order of cars will be sequenced
    Solution:: 1..NumConfigurations,                                 
    constrain(Options,Solution,Classes),                % constrain about maximum consecutive cars per configuration that can be sequenced
    constrain_occurrences(1,Classes,Solution),          % constrain to make sure that the correct number of each class of car gets sequenced
    search(Solution,0,first_fail,indomain,complete,[]).

constrain([],_,_).
constrain([M/K/Config|RestOptions],Solution,Classes):-
    make_list(1,Config,NewList),                        % e.x make [1,0,0,0,1,1] into [1,5,6] in order to be suitable for sequence_total predicate 
    config_count_cars(Classes,Config,0,Count),          % get number of cars using this configuration
    sequence_total(Count,Count,0,K,M,Solution,NewList), % using sequence_total instead of sequence as it allows to deny some values due to not correct count per configuration
    constrain(RestOptions,Solution,Classes).

constrain_occurrences(_,[],_).
constrain_occurrences(N,[X|Xs],Solution):-
    occurrences(N,Solution,X),
    N1 is N+1,
    constrain_occurrences(N1,Xs,Solution).    

count_cars([],FinalSum,FinalSum).
count_cars([X|Xs],Sum,FinalSum):-
    NewSum is X + Sum,
    count_cars(Xs,NewSum,FinalSum).


config_count_cars([],[],FinalSum,FinalSum).
config_count_cars([X|Xs],[Y|Ys],Sum,FinalSum):-
    Y==1,
    NewSum is X + Sum,
    config_count_cars(Xs,Ys,NewSum,FinalSum).
config_count_cars([_|Xs],[Y|Ys],Sum,FinalSum):-
    Y==0,
    config_count_cars(Xs,Ys,Sum,FinalSum).

make_list(_,[],[]).
make_list(N,[X|List],[N|NewList]):-
    X==1,
    N1 is N+1,
    make_list(N1,List,NewList).
make_list(N,[X|List],NewList):-
    X==0,
    N1 is N+1,
    make_list(N1,List,NewList).
