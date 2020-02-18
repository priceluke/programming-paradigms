lang_switch([],[]).
lang_switch([H_ENG|T_ENG], [H_FRENCH|T_FRENCH]):-
    equivalent(H_ENG, H_FRENCH),
    lang_switch(T_ENG, T_FRENCH).

equivalent(hello,bonjour).
equivalent(goodbye,aurevoir).
equivalent(cat,chat).
equivalent(car,voiture).
equivalent(slipped,glisse).
equivalent(top,haut).
equivalent(wonderful,merveilleux).
equivalent(sitting,seance).
equivalent(computer,ordinateur).
equivalent(boat,bateau).
equivalent(aeroplane,avion).
