dominos([(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),
               (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),
                     (2,2),(2,3),(2,4),(2,5),(2,6),
                           (3,3),(3,4),(3,5),(3,6),
                                 (4,4),(4,5),(4,6),
                                       (5,5),(5,6),
                                             (6,6)]).


frame([[3,1,2,6,6,1,2,2],
       [3,4,1,5,3,0,3,6],
       [5,6,6,1,2,4,5,0],
       [5,6,4,1,3,3,0,0],
       [6,1,0,6,3,2,4,0],
       [4,1,5,2,4,3,5,5],
       [4,1,0,2,4,5,2,0]]).

bounds(7,8).

csp_solve([],[]). 
csp_solve(Solution,Domains):-
    dominos(Dominos),
    create_domains(Dominos,Domains),
    mrv_variable(Domains,(X,Y),Var_Domain),    % to be finished
    act((X,Y),Domains,(Point1,Point2)),         % to be finished 
    fc_remove(Domains,Point1,Point2,NewDomains), % to be finished
    csp_solve(PartialSolution,NewDomains),
    append([(P1,P2)],PartialSolution,Solution).


create_domains([],[]).
create_domains([K|List],Domains):-
    (X,Y)=K,
    bounds(N,M),
    iterate(0,0,M,N,X,Y,Domain),
    append([(X,Y)],[Domain],Element),
    create_domains(List,Domain_List),
    append(Element,Domain_List,Domains).

iterate(LimitI,LimitJ,LimitI,LimitJ,X,Y,[]).
iterate(LimitI,J,LimitI,LimitJ,X,Y,Domain):-
    J \= LimitJ,
    Jnext is J+1,
    iterate(0,Jnext,LimitI,LimitJ,X,Y,Domain).
iterate(I,J,LimitI,LimitJ,X,Y,Domain):-
    I \= LimitI,
    Inext is I+1,
    Jnext is J+1,
    ((domino_candidate(I,J,Inext,J,X,Y);domino_candidate(I,J,Inext,J,Y,X))->
        Avail1=[[I,J,Inext,J]]
        ;
        Avail1=[[-1,-1,-1,-1]]
    ),
    ((domino_candidate(I,J,I,Jnext,X,Y);domino_candidate(I,J,I,Jnext,Y,X))->
        Avail2=[[I,J,I,Jnext]]
        ;
        Avail2=[[-1,-1,-1,-1]]
    ),
    iterate(Inext,J,LimitI,LimitJ,X,Y,RestDomain),
    (append([],Avail1,[[-1,-1,-1,-1]])->
        (append([],Avail2,[[-1,-1,-1,-1]])->
            Domain=RestDomain
            ;
            append(Avail2,RestDomain,Domain)
        )
        ;
        append(Avail1,RestDomain,TempDomain),
        (append([],Avail2,[[-1,-1,-1,-1]])->
            Domain=TempDomain
            ;
            append(Avail2,TempDomain,Domain)
        )
    ).
    

domino_candidate(I,J,Iother,Jother,X,Y):-
    get_frame_element(I,J,P1),
    get_frame_element(Iother,Jother,P2),
    (X,Y)==(P1,P2).



get_frame_element(X,Y,Element):-
    frame(Frame),
    bounds(N,M),
    (((X>=M;X<0);(Y>=N;Y<0))->(Element is -1);get_row_list(Y,Frame,List),nth(X,List,Element) ).

get_row_list(0,[List|Rest],List).
get_row_list(N,[_|Lists],Result):-
    N > 0,
    N1 is N-1,
    get_row_list(N1,Lists,Result).

nth(0,[X|List],X).
nth(N,[Y|List],X):-
    N > 0,
    N1 is N-1,
    nth(N1,List,X).
