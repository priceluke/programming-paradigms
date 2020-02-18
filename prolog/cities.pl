edge(1, 2, 4).
edge(1, 3, 10).
edge(1, 5, 2).
edge(2, 5, 1).
edge(2, 6, 1).
edge(2, 4, 6).
edge(3, 5, 2).
edge(3, 4, 1).
edge(4, 5, 8).

connected(X,Y,L) :- edge(Y,X,L).
connected(X,Y,L) :- edge(X,Y,L).

path(X,Y,Path,Len) :- traverse(X,Y,[X],Q,Len),reverse(Q,Path), print(Path), writef("\n").

traverse(X,Y,P,[Y|P],L) :- connected(X,Y,L).
traverse(X,Y,Visited,Path,L) :- connected(X,Z,N), Z \== Y, \+member(Z,Visited),traverse(Z,Y,[Z|Visited],Path,L1), L is N+L1.

find(X,Y,Path,Length) :-
   writef("Possible Paths:\n"),
   setof([P,L],path(X,Y,P,L),Set),
   Set = [_|_],
   minimal(Set,[Path,Length]),
   writef("Most Efficent Paths:\n").

minimal([F|R],M) :- min(R,F,M).

min([],M,M).
min([[P,L]|R],[_,M],Min) :- L < M, !, min(R,[P,L],Min).
min([_|R],M,Min) :- min(R,M,Min).
