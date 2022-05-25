% Each of the three given examples is found in instant time, with the correct number of solutions given when pressing More (16 for the very_big_data as was mentionend in lists)
% To test each example add/remove the neccesary "%"

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



%dominos([(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,a),
%               (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,a),
%                     (2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,a),
%                           (3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,a),
%                                 (4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,a),
%                                       (5,5),(5,6),(5,7),(5,8),(5,9),(5,a),
%                                             (6,6),(6,7),(6,8),(6,9),(6,a),
%                                                   (7,7),(7,8),(7,9),(7,a),
%                                                         (8,8),(8,9),(8,a),
%                                                               (9,9),(9,a),
%                                                                     (a,a)]).
%
%frame([[6,5,0,5,5,3,3,1,1,4,6],
%       [1,2,2,a,a,5,7,0,1,0,7],
%       [5,8,6,0,8,0,9,7,7,4,2],
%       [4,0,9,0,7,7,9,9,8,8,0],
%       [1,a,3,8,8,5,a,8,0,0,3],
%       [9,2,3,5,7,6,9,1,6,3,9],
%       [2,2,2,5,8,6,0,4,6,a,a],
%       [9,4,2,1,7,9,5,4,a,4,a],
%       [9,a,4,9,5,5,6,6,0,a,2],
%       [1,a,1,2,1,1,8,2,2,7,8],
%       [7,7,3,3,4,3,6,6,4,3,1],
%       [5,9,6,3,3,a,7,4,4,8,8]]). 
%

%dominos([(a,b),(b,c),(c,d),(d,e),(e,f),(f,g),(g,h),(h,i),(i,j),(j,k),(k,l),(l,m),
%         (a,c),(b,d),(c,e),(d,f),(e,g),(f,h),(g,i),(h,j),(i,k),(j,l),(k,m),(l,n),
%         (a,d),(b,e),(c,f),(d,g),(e,h),(f,i),(g,j),(h,k),(i,l),(j,m),(k,n),(l,o),
%         (a,e),(b,f),(c,g),(d,h),(e,i),(f,j),(g,k),(h,l),(i,m),(j,n),(k,o),(l,p),
%         (a,f),(b,g),(c,h),(d,i),(e,j),(f,k),(g,l),(h,m),(i,n),(j,o),(k,p),(l,q),
%         (a,g),(b,h),(c,i),(d,j),(e,k),(f,l),(g,m),(h,n),(i,o),(j,p),(k,q),(l,r),
%         (a,h),(b,i),(c,j),(d,k),(e,l),(f,m),(g,n),(h,o),(i,p),(j,q),(k,r),(l,s),
%         (a,i),(b,j),(c,k),(d,l),(e,m),(f,n),(g,o),(h,p),(i,q),(j,r),(k,s),(l,t),
%         (a,j),(b,k),(c,l),(d,m),(e,n),(f,o),(g,p),(h,q),(i,r),(j,s),(k,t),(l,u),
%         (a,k),(b,l),(c,m),(d,n),(e,o),(f,p),(g,q),(h,r),(i,s),(j,t),(k,u),(l,v),
%         (a,l),(b,m),(c,n),(d,o),(e,p),(f,q),(g,r),(h,s),(i,t),(j,u),(k,v),(l,w),
%         (a,m),(b,n),(c,o),(d,p),(e,q),(f,r),(g,s),(h,t),(i,u),(j,v),(k,w),(l,x)]).
%
%frame([[d,g,i,r,d,f,g,l,n,f,i,s,f,k,w,l],
%       [k,e,a,j,k,e,s,k,j,k,b,i,r,c,j,o],
%       [l,q,j,p,n,h,k,l,s,j,r,t,f,v,k,k],
%       [x,k,a,d,f,m,m,o,c,g,d,h,j,i,c,u],
%       [g,q,i,b,m,a,f,e,i,b,l,a,e,i,f,g],
%       [n,a,o,i,p,g,r,l,r,h,a,o,g,l,p,i],
%       [d,c,d,g,e,f,n,h,b,t,j,e,d,h,c,i],
%       [i,m,g,b,q,i,b,f,c,l,l,b,u,i,h,t],
%       [j,h,c,g,f,a,s,l,f,l,e,c,d,j,i,j],
%       [p,s,n,d,a,p,c,l,b,e,k,j,u,t,h,g],
%       [c,f,g,g,b,h,n,e,j,h,m,i,j,f,h,c],
%       [f,l,w,h,e,o,h,j,k,j,v,d,b,b,n,k],
%       [h,r,g,n,m,d,a,d,h,l,k,b,h,m,a,i],
%       [o,j,l,e,k,g,d,m,e,h,k,r,j,j,l,k],
%       [e,c,o,h,a,n,f,k,d,q,k,k,a,j,f,p],
%       [v,l,i,q,p,p,k,o,m,e,d,l,g,m,k,s],
%       [e,n,i,g,e,q,l,m,i,o,g,m,i,c,l,k],
%       [q,n,j,q,l,h,f,o,b,j,p,c,l,l,u,t]]).



put_dominos:-
    dominos(Dominos),
    create_domains(Dominos,Domains),  % we create a list of the form [ [(0,0),[[1,2,1,3],[5,1,5,2],...],....,[(Var_X,Var_Y),[Var_Domain1,Var_Domain2,...] ]  ] from which we can access any domino's/variable's domain in a simple way
    csp_solve(Solution,Domains),
    print_Solution(Solution).

csp_solve([],[]). 
csp_solve(Solution,Domains):-
    mrv_variable(Domains,(X,Y),Var_Domain),   % pick variable with least amount of options
    act_out(Var_Domain,(P1x,P1y),(P2x,P2y)),   % pick any of each available options(here takes place the essence of backtracking, as we call a between(...) function to get which action is picked)
    fc_remove(Domains,(X,Y),(P1x,P1y),(P2x,P2y),NewDomains), % remove the points picked from any other variable that may have them in its domain(here we also completely remove the mrv variable and its domain as to signify that it has been chosen)
    csp_solve(PartialSolution,NewDomains),
    append([[(P1x,P1y),(P2x,P2y)]],PartialSolution,Solution). % in the end we will have all the pairs of points in the two dimensional array that must be connected in order to achieve the desired result

print_Solution(Solution):-
    bounds(N,M),
    iter_print(0,0,M,N,[],Solution).

iter_print(_,LimitJ,LimitI,LimitJ,_,Solution).
iter_print(LimitI,J,LimitI,LimitJ,Queue,Solution):-
    J \= LimitJ,
    Jnext is J+1,
    write("\n"),
    pretty_print(Queue),           % after each row is printed, we also print another row below it that will contain " " or "|" as stated by the list we passed onto it
    write("\n"),
    iter_print(0,Jnext,LimitI,LimitJ,[],Solution).
iter_print(I,J,LimitI,LimitJ,Queue,Solution):-
    I \= LimitI,
    J \= LimitJ,
    Inext is I+1,
    Jnext is J+1,
    get_frame_element(I,J,Element),
    (connected((I,J),(Inext,J),Solution)->
        write(Element),write("-")
        ; 
        write(Element),write(" ")
    ),
    (connected((I,J),(I,Jnext),Solution)->
        append([1],Queue,NewQueue)  % since this point is connected vertically, we put an 1 on the Queue, signifying a "|" needs to be printed below at this spot
        ; 
        append([0],Queue,NewQueue)
    ),
    iter_print(Inext,J,LimitI,LimitJ,NewQueue,Solution).

pretty_print([]).
pretty_print([X|List]):-
    pretty_print(List), % elements are appended in the List at the start, thus we first need to look at its end to get the correct order
    ((X==0)->
        write(" "),write(" ")
        ;
        write("|"),write(" ")
    ).

connected((P1x,P1y),(P2x,P2y),Solution):- % returns true if two points are connected 
    member([(P1x,P1y),(P2x,P2y)],Solution);member([(P2x,P2y),(P1x,P1y)],Solution).


act_out(Domain,(P1x,P1y),(P2x,P2y)):-
    mylen(Domain,Len),
    between(0,Len,X),
    Depth is Len-1,
    nth(X,Domain,Action),
    [P1x,P1y,P2x,P2y]=Action.


between(N1,N2,N1):-
    N1 =< N2.
between(N1,N2,X):- 
    N1 < N2,
    NewN1 is N1+1,
    between(NewN1,N2,X).


fc_remove([],(_,_),(_,_),(_,_),[]).
fc_remove([K|RestDomains],(X,Y),(P1x,P1y),(P2x,P2y),NewDomains):-
    [(I,J),Domain]=K,
    fc_remove(RestDomains,(X,Y),(P1x,P1y),(P2x,P2y),NewDomains2),
    ( ((I,J)==(X,Y))->
        NewDomains=NewDomains2           % skip appending this domain, as to show variable has been added to the solution
        ;
        delete_point(Domain,(P1x,P1y),(P2x,P2y),Var_Domain),   % delete occurence of points picked by solution from other variables
        Var_Domain \= [],
        append([[(I,J),Var_Domain]],NewDomains2,NewDomains)
    ).

delete_point([],(_,_),(_,_),[]).
delete_point([[I1,J1,I2,J2]|RestDomain],(P1x,P1y),(P2x,P2y),Result):-
    delete_point(RestDomain,(P1x,P1y),(P2x,P2y),Partial_Result),
    ( ((I1,J1)==(P1x,P1y);(I2,J2)==(P2x,P2y);(I1,J1)==(P2x,P2y);(I2,J2)==(P1x,P1y))->
        Result=Partial_Result        
        ;
        append([[I1,J1,I2,J2]],Partial_Result,Result)
    ).

mrv_variable(Domains,(X,Y),Var_Domain):-
    find_min(Domains,(X,Y),Var_Domain,Min),
    Min \= -1.

find_min([],(_,_),_,-1).
find_min([K|RestDomains],(X,Y),Result_Domain,NewMin):-
    [(I1,J1),Domain_List]=K,
    mylen(Domain_List,Len),
    Len > 0,
    find_min(RestDomains,(I2,J2),Var_Domain,Min),
    ((Min \= -1)->
        ((Len < Min)->
            NewMin=Len,
            (X,Y)=(I1,J1),
            Result_Domain=Domain_List
            ;
            NewMin=Min,
            (X,Y)=(I2,J2),
            Result_Domain=Var_Domain
        )
        ;
        NewMin=Len,
        (X,Y)=(I1,J1),
        Result_Domain=Domain_List
    ).

mylen([],0).
mylen([[_,_,_,_]|Rest],N):-
    mylen(Rest,N1),
    N is N1+1.



create_domains([],[]).
create_domains([K|List],Domains):-
    (X,Y)=K,
    bounds(N,M),
    iterate(0,0,M,N,X,Y,Domain),
    append([(X,Y)],[Domain],Element),
    create_domains(List,Domain_List),
    append([Element],Domain_List,Domains).

iterate(LimitI,LimitJ,LimitI,LimitJ,X,Y,[]).
iterate(LimitI,J,LimitI,LimitJ,X,Y,Domain):-
    J \= LimitJ,
    Jnext is J+1,
    iterate(0,Jnext,LimitI,LimitJ,X,Y,Domain).
iterate(I,J,LimitI,LimitJ,X,Y,Domain):-
    I \= LimitI,
    Inext is I+1,
    Jnext is J+1,
    ((domino_candidate(I,J,Inext,J,X,Y);domino_candidate(I,J,Inext,J,Y,X))->  % check whether it can be placed horizontally in any of the two orientations
        Avail1=[[I,J,Inext,J]]
        ;
        Avail1=[[-1,-1,-1,-1]]
    ),
    ((domino_candidate(I,J,I,Jnext,X,Y);domino_candidate(I,J,I,Jnext,Y,X))->  % check whether it can be placed vertically in anyof the two orientations
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


bounds(N,M):-
    frame(Frame),
    length(Frame,N),
    nth(0,Frame,SubList),
    length(SubList,M).