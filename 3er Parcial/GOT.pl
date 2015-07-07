% Casas
house(frey,walder).
house(frey,joyeuse).
house(stark,rickard).
house(stark,benjen).
house(stark,brandon).
house(stark,lyanna).
house(stark,eddard).
house(stark,jon_snow).
house(stark,robb).
house(stark,sansa).
house(stark,arya).
house(stark,bran).
house(stark,rickon).
house(tully,catelyn).
house(tully,lysa).
house(tully,edmure).
house(tully,hoster).
house(tully,robin).
house(arryn, jon).
house(tyrell,mace).
house(tyrell,willas).
house(tyrell,garlan).
house(tyrell,margaery).
house(tyrell,loras_tyrell).
house(baratheon,stannis).
house(baratheon,renly).
house(baratheon,robert).
house(baratheon,joffrey).
house(baratheon,myrcella).
house(baratheon,tommen).
house(lannister,tywin).
house(lannister,kevan).
house(lannister,joanna).
house(lannister,dorna).
house(lannister,cersei).
house(lannister,ser_jaime).
house(lannister,tyrion).
house(lannister,lancel).
house(targaryen,aerys_ii).
house(targaryen,rhaella).
house(targaryen,elia).
house(targaryen,rhaegar).
house(targaryen,rhaenys).
house(targaryen,aegon).
house(targaryen,viserys).
house(targaryen,daenerys).
house(mormont,ser_jorah_mormont).
house(greyjoy,balon).
house(greyjoy,asha).
house(greyjoy,maron).
house(greyjoy,rodrik).
house(greyjoy,theon_greyjoy).

belongsHouses(House_name,Person):-
		house(House_name,Person).
belongsHouses(House_name,Person):-
		marriedWith(Person,Partner),
		house(House_name,Partner).
% End of Casas

% Reyes
king(baratheon,robert).
king(lannister,tywin).
king(targaryen,aerys_ii).
king(stark,rickard).
king(tully,hoster).
king(frey,walder).

queen(House, Queen):-
		king(House, King),
		marriedWith(King, Queen).

% Fin de Reyes

% Relaciones
married(jon, lysa).
married(baelish, lysa).
married(walder,joyeuse).
married(eddard,catelyn).
married(joanna,tywin).
married(kevan,dorna).
married(robert,cersei).
married(aerys_ii,rhaella).
married(elia,rhaegar).
married(khal_drogo,daenerys).

marriedWith(Person,Partner):-
		married(Person,Partner),
		state(Partner, alive), !.
marriedWith(Person,Partner):-
		married(Partner,Person),
		state(Person, alive).

siblings([benjen,brandon,lyanna,eddard]).
siblings([jon_snow,robb,sansa,arya,bran,rickon]).
siblings([catelyn,lysa,edmure]).
siblings([joffrey,myrcella,tommen]).
siblings([cersei,ser_jaime,tyrion]).
siblings([willas,garlan,margaery,loras_tyrell]).
siblings([rhaegar,viserys,daenerys]).
siblings([rhaenys,aegon]).
siblings([stannis,renly,robert]).
siblings([tywin,kevan]).
siblings(Person,Siblings) :-
		siblings(Generation),member(Person,Generation),
		delete(Generation,Person,Siblings).

descendance(kevan,    [lancel]).
descendance(dorna,    [lancel]).
descendance(aerys_ii, [rhaegar, viserys, daenerys]).
descendance(rhaella,  [rhaegar, viserys, daenerys]).
descendance(rhaegar,  [rhaenys, aegon]).
descendance(balon,    [theon_greyjoy, asha, maron, rodrik]).
descendance(tywin,    [cersei, ser_jaime, tyrion]).
descendance(robert,   [joffrey, myrcella, tommen]).
descendance(cersei,   [joffrey, myrcella, tommen]).
descendance(mace, 	  [willas, garlan, margaery, loras_tyrell]).
descendance(rickard,  [benjen, brandon, lyanna, eddard]).
descendance(hoster,   [catelyn, lysa, edmure]).
descendance(jon, 	  [robin]).
descendance(lysa, 	  [robin]).
descendance(eddard,   [jon_snow, robb, sansa, arya, bran, rickon]).
descendance(catelyn,  [robb, sansa, arya, bran, rickon]).

parent(Parent, Person):-
	descendance(Parent, Descendance),
	member(Person, Descendance).
% Fin de Relaciones

% Generos
gender(joffrey,man).
gender(jon,man).
gender(rickard,man).
gender(eddard,man).
gender(bran,man).
gender(robert,man).
gender(renly,man).
gender(rhaegar,man).
gender(robb,man).
gender(rickon,man).
gender(walder,man).
gender(tywin,man).
gender(kevan,man).
gender(khal_drogo,man).
gender(benjen,man).
gender(brandon,man).
gender(jon_snow,man).
gender(edmure,man).
gender(tommen,man).
gender(ser_jaime,man).
gender(tyrion,man).
gender(willas,man).
gender(garlan,man).
gender(aegon,man).
gender(loras_tyrell,man).
gender(aerys_ii,man).
gender(stannis,man).
gender(headsman,man).
gender(the_hound,man).
gender(roose_bolton,man).
gender(baelish,man).
gender(viserys,man).
gender(maron,man).
gender(rodrik,man).
gender(theon_greyjoy,man).

gender(joyeuse,woman).
gender(catelyn,woman).
gender(joanna,woman).
gender(dorna,woman).
gender(cersei,woman).
gender(rhaella,woman).
gender(elia,woman).
gender(daenerys,woman).
gender(lyanna,woman).
gender(sansa,woman).
gender(arya,woman).
gender(asha,woman).
gender(lysa,woman).
gender(myrcella,woman).
gender(margaery,woman).
gender(rhaenys,woman).
% Fin de Generos

%Inicio de Estado de Vida
state(jon,dead).
state(eddard,dead).
state(catelyn,dead).
state(lysa,dead).
state(robb,dead).
state(tywin,dead).
state(joanna,dead).
state(robert,dead).
state(stannis,dead).
state(renly,dead).
state(joffrey,dead).
state(khal_drogo,dead).
state(the_hound,dead).
state(maron,dead).
state(rodrik,dead).
state(lyanna,dead).
state(brandon,dead).
state(rickard,dead).
state(rhaenys,dead).
state(aegon,dead).
state(rhaegar,dead).
state(elia,dead).
state(aerys_ii,dead).
state(viserys,dead).
state(rhaella,dead).

state(jon_snow,exiled).

state(theon_greyjoy,disinherited).

state(Person, alive):- state(Person, dead), !, fail.
state(Person, alive):- killedby(Person, Killer), !, fail.
state(Person, alive).
%Fin de Estado de Vida

%Inicio Estado de Muertes
killedby(eddard,headsman).
killedby(robb,roose_bolton).
killedby(lysa,baelish).
killedby(catelyn,walder).
killedby(joffrey,baelish).
killedby(tywin,tyrion).
killedby(joanna,tyrion).
killedby(aerys_ii,ser_jaime).
killedby(viserys,khal_drogo).
killedby(brandon,rhaegar).
killedby(lyanna,rhaegar).
killedby(maron,robert).
killedby(rodrik,robert).
%Fin Estado de Muertes

%Inicio de reinos enemigos
enemies(lannister,stark).
enemies(lannister,targaryen).
enemies(grejoy,stark).
enemies(grejoy,baratheon).

areEnemies(House_A, House_B):- enemies(House_A, House_B), (House_A \= House_B).
areEnemies(House_A, House_B):- enemies(House_B, House_A), (House_A \= House_B).

%Fin de reinos enemigos

%Inicio de rivales
rivals(sandor_clegane, ser_gregor_clegane).
rivals(balon, robert).

areRivals(Person_A, Person_B):-
		rivals(Person_A, Person_B), (Person_A \= Person_B).
areRivals(Person_A, Person_B):-
		rivals(Person_B, Person_A), (Person_A \= Person_B).
areRivals(CharacterA,CharacterB):-belongsHouses(HouseA,CharacterA),belongsHouses(HouseB,CharacterB),areEnemies(HouseA,HouseB).

%Fin de rivales

% Reglas generales
inheritsHouse(House,Person) :-
		king(House,Parent),
		parent(Parent,Person),
		gender(Person,man),
		state(Person, exiled),
		!, fail.

inheritsHouse(House,Person) :-
		king(House,Parent),
		parent(Parent,Person),
		gender(Person,man),
		state(Person, disinherited),
		!, fail.

inheritsHouse(House,Person) :-
		king(House,Parent),
		parent(Parent,Person),
		gender(Person,man).

family(X,Y) :-
		belongsHouses(Z,X),
		belongsHouses(Z,Y),
		X \= Y.

canInherit(House,Person) :-
		inheritsHouse(House,Person).

canInherit(House,Person) :-
		belongsHouses(House,Person),
		gender(Person,man),
		state(Person, exiled),
		parent(Parent, Person),
		inheritsHouse(House,Parent),
		!, fail.

canInherit(House,Person) :-
		belongsHouses(House,Person),
		gender(Person,man),
		state(Person, disinherited),
		parent(Parent, Person),
		inheritsHouse(House,Parent),
		!, fail.

canInherit(House,Person) :-
		belongsHouses(House,Person),
		gender(Person,man),
		parent(Parent, Person),
		inheritsHouse(House,Parent).


inheritor(House, Inheritor):-
		canInherit(House, Inheritor),
		state(Inheritor, alive).

canMarry(X,Y):- gender(X,GX), gender(Y,GY), GX \= GY, canMarry_(X, Y).
canMarry_(X,Y):- marriedWith(X,Z),!,fail.
canMarry_(X,Y):- marriedWith(Y,Z),!,fail.
canMarry_(X,Y):- belongsHouses(House,X),belongsHouses(House,Y),!,fail.
canMarry_(X,Y):- state(X,dead),!,fail.
canMarry_(X,Y):- state(Y,dead),!,fail.
canMarry_(X,Y):- killedby(X,KX),!,fail.
canMarry_(X,Y):- killedby(Y,KY),!,fail.
canMarry_(X,Y):- state(X,exiled),!,fail.
canMarry_(X,Y):- state(Y,exiled),!,fail.
canMarry_(X,Y):- state(X,disinherited),!,fail.
canMarry_(X,Y):- state(Y,disinherited),!,fail.
canMarry_(X,Y).

% A AGREGAR %
% [DONE ] Estado de Vida (Hecho)       -> (Muerto/Vivo/Desterrado/Desheredado)
% [DONE ] Estado de Muertes (Hecho)    -> Quien mata a quien.
% [DONE ] Numero de Nacimiento (Hecho) -> Orden de nacimiento.
% [DONE ] Heredero al Trono (Regla)    -> Hijo hombre, mayor, vivo e hijo de Rey de una casa.
% [DONE ] Reinos enemigos (Hecho)      -> Los reinos que son enemigos.
%                                      ***Esto puede que de problemas al usar la regla canmarry.***
% [DONE ] canmarry (Regla)  		   -> Dependiendo del estado de vida y la relacion del
%                                      reino, ver cuales descendientes pueden casarse.
