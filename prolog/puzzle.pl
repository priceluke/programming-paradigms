rabbit(N) :-
       Street = [_House1,_House2,_House3],
       member(house(blue,_,_), Street),
       member(house(black,_,_), Street),
       member(house(brown,_,_), Street),
	   member(house(black,french,_), Street),
       member(house(_,spanish,jaguar), Street),
       sublist([house(blue,_,_),house(_,_,snail)], Street),
       sublist([house(_,_,snail),house(_,japanese,_)], Street),
       member(house(_,N,rabbit),Street).

prefix(P,L) :- append(P,_,L).

suffix(S,L) :- append(_,S,L).

sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).
