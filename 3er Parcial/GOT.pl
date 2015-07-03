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

king(baratheon,robert).
king(lannister,tywin).
king(aerys_ii).
king(stark,rickard).
king(tully,hoster).
king(frey,walder).

married(walder,joyeuse).
married(eddard,catelyn).
married(joanna,tywin).
married(kevan,dorna).
married(kevan,dorma).
married(robert,cersei).
married(aerys_ii, rhaella).
married(elia,rhaegar).
married(daenerys,khal_drogo).
siblings(benjen,brandon,lyanina,eddard).
siblings(robb,sansa,arya,bran,rickon,jon_snow).
siblings(catelyn,lisa,edmure).
siblings(joffrey,myrcella,tommen).
siblings(cersei,ser_jaime,tyrion).
siblings(willas,garlan,margaery,loras_tyrell).
siblings(rhaegar,viserys,daenerys).
siblings(rhaenys,aegon).
siblings(stannis,renly,robert).
siblings(tywin,kevan).
parent(robert,joffrey).
parent(cersei,joffrey).
parent(aerys_ii,rhaegar).
parent(aerys_ii,daenerys).
parent(rhaella,rhaegar,daenerys).
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

gender(joffrey,men).
gender(rickard,men).
gender(eddard,men).
gender(bran,men).

house(House_name,Person):-married(Person,Partner),house(House_name,Partner).

inheritsHouse(House,Person) :- parent(Parent,Person),king(House,Parent),gender(Person,men).

family(X,Y) :- house(Z,X),house(Z,Y).
canInherit(House,Person):- inheritsHouse(House,Person);(
    gender(Person,men),inheritsHouse(House,Parent)
);canInherit(House,Parent). 



/* A AGREGAR */
Estado de Vida (Hecho) -> Muerto/Vivo/Desterrado
Estado de Muertes (Hecho) -> Quien mata a quien
Numero de Nacimiento (Hecho) -> Orden de nacimiento
Heredero al Trono (Regla) -> Hijo hombre, menor, vivo y hijo de Rey. 
Episodio de Muerte (Hecho) -> Donde muere un personaje