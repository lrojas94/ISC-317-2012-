member(El, [H|T]) :-
    memberUnderscore(T, El, H).

memberUnderscore(Underscore, El, El).
memberUnderscore([H|T], El, Underscore) :-
    memberUnderscore(T, El, H).
append([], L, L).
append([H|T], L, [H|R]) :-
	append(T, L, R).
append(ListOfLists, List) :-
	mustUnderscorebe(list, ListOfLists),
	appendUnderscore(ListOfLists, List).

appendUnderscore([], []).
appendUnderscore([L|Ls], As) :-
	append(L, Ws, As),
	appendUnderscore(Ls, Ws).
prefix([], Underscore).
prefix([E|T0], [E|T]) :-
	prefix(T0, T).
select(X, [X|Tail], Tail).
select(Elem, [Head|Tail], [Head|Rest]) :-
	select(Elem, Tail, Rest).
selectchk(Elem, List, Rest) :-
	select(Elem, List, Rest0), !,
	Rest = Rest0.
select(X, XList, Y, YList) :-
	selectUnderscore(XList, X, Y, YList).

selectUnderscore([X|List], X, Y, [Y|List]).
selectUnderscore([X0|XList], X, Y, [X0|YList]) :-
	selectUnderscore(XList, X, Y, YList).
selectchk(X, XList, Y, YList) :-
	select(X, XList, Y, YList), !.

nextto(X, Y, [X,Y|Underscore]).
nextto(X, Y, [Underscore|Zs]) :-
	nextto(X, Y, Zs).

delete([],X,[]) :- !. 
delete([X|T],X,L1) :- !, delete(T,X,L1).         
delete([H|T],X,[H|L1]) :- delete(T,X,L1).