decode_rl([],[]).
decode_rl([X|List],Result):-
    decode_rl(X,Result1),
    decode_rl(List,Result2),
    append(Result1,Result2,Result).
decode_rl((X,N),Result):-
    N > 1, 
    iter(X,N,Result).  % inserts symbol X into the Result N times by calling itself until N becomes 1
decode_rl(X,[X]):-
    X \= (_,_).


iter(X,1,[X]).
iter(X,N,[X|Result]):-
    N1 is N-1,
    iter(X,N1,Result).



encode_rl([],[]).
encode_rl(List,Result):-
    find_max_prefix(List,Prefix,Element,Occurences), %returns list containing the same symbol, including which symbol that is and the number for it's consequtive occurences
    create_element(Element,Occurences,X), % create element X which will be in either of the two representations specified in exercise
    append(Prefix,NewList,List),   %we delete the list containing the consequtive symbol from our input list
    encode_rl(NewList,Result2), 
    append([X],Result2,Result).


find_max_prefix([X],[X],X,1).
find_max_prefix([X,Y|Tail],Prefix,X,N):-
    X == Y,
    find_max_prefix([Y|Tail],Prefix2,_,N2),
    N is N2+1,
    append([X],Prefix2,Prefix).
find_max_prefix([X,Y|Tail],[X],X,1):-
    not (X == Y).         
%When running the command "encode_rl([p(3),p(X),q(X),q(Y),q(4)], L)",
%the output will be simply the same input list without any variable assingments
%X = X
%Y = Y
%L = [p(3), p(X), q(X), q(Y), q(4)]
%This will occur because when we compare to see if two symbols are the same/different, 
%we use the operator "p(3)==p(X)", and since X can have any value, the sentence is not true and also no assignment takes place
%Similarly, to see that the two are different we check whether the sentence "p(3)==p(X)" cannot be proven, which does happen since X can be anything

%Side note, i tested it and by changing "==" operator into "=", variable assingment does take place and the result is
%X = 3
%Y = 3
%L = [(p(3), 2), (q(3), 2), q(4)] 


create_element(Element,1,Element).
create_element(Element,N,(Element,N)):-
    N \= 1.
