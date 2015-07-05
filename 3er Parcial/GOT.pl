% Casas
house(frey,walder).
house(frey,joyeuse).
house(stark,rickard).
house(stark,benjen).
house(stark,brandon).
house(stark,lyanna).
house(stark,eddard).
house(stark,john_snow).
house(stark,robb).
house(stark,sansa).
house(stark,arya).
house(stark,bran).
house(stark,rickon).
house(tully,catelyn).
house(tully,lysa).
house(tully,edmure).
house(tully,hoster).
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

house(House_name,Person):-married(Person,Partner),house(House_name,Partner).
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
married(walder,joyeuse).
married(eddard,catelyn).
married(joanna,tywin).
married(kevan,dorna).
married(kevan,dorma).
married(robert,cersei).
married(aerys_ii,rhaella).
married(elia,rhaegar).
married(daenerys,khal_drogo).

siblings([benjen,brandon,lyanina,eddard]).
siblings([robb,sansa,arya,bran,rickon,jon_snow]).
siblings([catelyn,lisa,edmure]).
siblings([joffrey,myrcella,tommen]).
siblings([cersei,ser_jaime,tyrion]).
siblings([willas,garlan,margaery,loras_tyrell]).
siblings([rhaegar,viserys,daenerys]).
siblings([rhaenys,aegon]).
siblings([stannis,renly,robert]).
siblings([tywin,kevan]).

parent(robert,joffrey).
parent(cersei,joffrey).
parent(aerys_ii,rhaegar).
parent(aerys_ii,daenerys).
parent(rhaella,rhaegar).
parent(rhaella,daenerys).
parent(eddard,robb).
parent(eddard,sansa).
parent(eddard,arya).
parent(eddard,bran).
parent(eddard,rickon).
parent(catelyn,robb).
parent(catelyn,sansa).
parent(catelyn,arya).
parent(catelyn,bran).
parent(catelyn,rickon).
parent(rickard,eddard).
% Fin de Relaciones

% Generos
gender(joffrey,man).
gender(rickard,man).
gender(eddard,man).
gender(bran,man).
gender(robert,man).
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

gender(joyeuse,woman).
gender(catelyn,woman).
gender(joanna,woman).
gender(dorna,woman).
gender(cersei,woman).
gender(rhaella,woman).
gender(elia,woman).
gender(daenerys,woman).
gender(lyanina,woman).
gender(sansa,woman).
gender(arya,woman).
gender(lisa,woman).
gender(myrcella,woman).
gender(margaery,woman).
gender(viserys,woman).
gender(rhaenys,woman).
gender(renly,woman).
% Fin de Generos

%Inicio de Estado de Vida
state(eddard,dead).
state(catelyn,dead).
state(lusa,dead).
state(robb,dead).
state(tywin,dead).
state(robert,dead).
state(stannis,dead).
state(renly,dead).
state(joffrey,dead).
state(khal_drogo,dead).
state(viserys,dead).
state(the_hound,dead).
%Fin de Estado de Vida

%Inicio Estado de Muertes
killedby(eddard,headsman).
killedby(robb,roose_bolton).
killedby(catelyn,walder).
killedby(joffrey,baelish).
killedby(tywin,tyrion).
killedby(viserys,khal_drogo).
%Fin Estado de Muertes

%Inicio de reinos enemigos
enemies(lannister,stark).
enemies(lannister,targaryen).
enemies(grejoy,stark).
enemies(lannister,lannister).
%Fin de reinos enemigos



% Reglas generales
inheritsHouse(House,Person):- 
	king(House,Parent), gender(Person,man), parent(Parent,Person).

family(X,Y) :- house(Z,X), house(Z,Y), X \= Y.
canInherit(House,Person):- 
	inheritsHouse(House,Person);
	(gender(Person,man),parent(Parent, Person),inheritsHouse(House,Parent)).

/* A AGREGAR */
% [DONE ] Estado de Vida (Hecho)       -> (Muerto/Vivo/Desterrado)
% [DONE ] Estado de Muertes (Hecho)    -> Quien mata a quien
% [ ] Numero de Nacimiento (Hecho) -> Orden de nacimiento
% [ ] Heredero al Trono (Regla)    -> Hijo hombre, mayor, vivo e hijo de Rey. 
% [DONE ] Reinos enemigos (Hecho)   -> Los reinos que son enemigos 
                                    Esto puede que de problemas al usar la regla canmarry.
% [ ] canmarry (Regla)  -> Dependiendo del estado de vida y la relacion del     
                                        reino, ver quienes descendientes que pueden casarse


