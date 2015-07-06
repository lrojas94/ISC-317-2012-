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
% Fin de Reyes

% Relaciones
married(jon, lysa).
married(walder,joyeuse).
married(eddard,catelyn).
married(joanna,tywin).
married(kevan,dorna).
married(robert,cersei).
married(aerys_ii,rhaella).
married(elia,rhaegar).
married(khal_drogo,daenerys).
marriedWith(Person,Partner):-
		married(Person,Partner);
		married(Partner,Person).

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
state(viserys,dead).
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
state(rhaella,dead).

state(jon_snow,exiled).

state(theon_greyjoy,disinherited).
state(viserys,disinherited).
%state(daenerys,disinherited).	-- Confuso por la imagen fuente.

state(Person, alive):- 
	not(state(Person, dead)), 
	not(killedby(Person, Killer)).
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

areEnemies(House_A, House_B):- 
		(enemies(House_A, House_B); enemies(House_B, House_A)),
		(House_A \= House_B).
%Fin de reinos enemigos

%Inicio de rivales
rivals(sandor_clegane, ser_gregor_clegane).
rivals(balon, robert).

areRivals(Person_A, Person_B):-
		(rivals(Person_A, Person_B); rivals(Person_B, Person_A)),
		(Person_A \= Person_B).
%Fin de rivales

% Reglas generales
inheritsHouse(House,Person) :-
		king(House,Parent),
		parent(Parent,Person),
		gender(Person,man),
		not(state(Person, exiled)),
		not(state(Person, disinherited)).

family(X,Y) :-
		belongsHouses(Z,X),
		belongsHouses(Z,Y),
		X \= Y.
		
canInherit(House,Person) :-
		inheritsHouse(House,Person).
canInherit(House,Person) :-
		belongsHouses(House,Person),
		gender(Person,man),
		not(state(Person, exiled)),
		not(state(Person, disinherited)),
		parent(Parent, Person),
		inheritsHouse(House,Parent).

inheritor(House, Inheritor):-
		canInherit(House, Inheritor),
		state(Inheritor, alive).

canMarry(X, Y):- 
		gender(X, GX), state(X, alive), belongsHouses(HX, X),
		not(marriedWith(X, PX)), 
		(GX == man, gender(Y, woman); GX == woman, gender(Y, man)),
		state(Y, alive), belongsHouses(HY, Y), (HX \= HY),
		not(marriedWith(Y, PY)).



% A AGREGAR %
% [DONE ] Estado de Vida (Hecho)       -> (Muerto/Vivo/Desterrado/Desheredado)
% [DONE ] Estado de Muertes (Hecho)    -> Quien mata a quien.
% [DONE ] Numero de Nacimiento (Hecho) -> Orden de nacimiento.
% [DONE ] Heredero al Trono (Regla)    -> Hijo hombre, mayor, vivo e hijo de Rey de una casa.
% [DONE ] Reinos enemigos (Hecho)      -> Los reinos que son enemigos.
%                                      ***Esto puede que de problemas al usar la regla canmarry.***
% [DONE ] canmarry (Regla)  		   -> Dependiendo del estado de vida y la relacion del
%                                      reino, ver cuales descendientes pueden casarse.
