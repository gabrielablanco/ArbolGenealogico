hombre(arturo).
hombre(mauricio).  %Tatarabuelos
hombre(juan). %Bisabuelo
hombre(carlos).
hombre(faryd). %Abuelo o tio
hombre(diego).
hombre(andres).
hombre(luis).
hombre(manuel). %Padres o tios
hombre(jose). %Cuñado
hombre(alejandro).
hombre(sebastian).
hombre(oscar). %Hijos, nietos, bisnietos, tataranietos

mujer(lucia).
mujer(beatriz). %Tatarabuelas
mujer(leonor). %Bisabuela
mujer(argenis). %Abuela
mujer(angelica).
mujer(nohora).
mujer(laura).
mujer(sofia).
mujer(sandra). %Cuñadas
mujer(michelle). %Madre o tia
mujer(paula).
mujer(adriana).%adoptadas
mujer(gabriela).%nieta,hija, bisnieta, tataranieta

progenitor(arturo,juan).
progenitor(lucia, juan).
progenitor(mauricio, leonor).
progenitor(beatriz, leonor).

progenitor(juan,carlos).
progenitor(juan,argenis).
progenitor(juan,faryd).
progenitor(leonor,carlos).
progenitor(leonor,argenis).
progenitor(leonor,faryd).

progenitor(carlos,diego).
progenitor(carlos,michelle).
progenitor(sandra,diego).
progenitor(sandra,michelle).


progenitor(argenis,luis).
progenitor(argenis,manuel).
progenitor(jose,luis).
progenitor(jose,manuel).

progenitor(faryd,andres).
progenitor(angelica,andres).

progenitor(diego,sebastian).
progenitor(diego,gabriela).
progenitor(diego,alejandro).
progenitor(nohora,sebastian).
progenitor(nohora,gabriela).
progenitor(nohora,alejandro).

progenitor(michelle,paula).
progenitor(sofia,paula).
progenitor(michelle,adriana).
progenitor(sofia,adriana).

progenitor(andres,oscar).
progenitor(laura,oscar).

pareja(X,Y) :- progenitor(X,Z),progenitor(Y,Z),X \== Y.
padre(X,Y):- hombre(X),progenitor(X,Y).
madre(X,Y):- mujer(X),progenitor(X,Y).
adoptado(A) :- progenitor(X,A),hombre(X),hombre(Y),pareja(X,Y), X \== Y.
adoptado(A) :- progenitor(X,A),mujer(X),mujer(Y),pareja(X,Y), X\== Y.
abuelo(X,Y) :- progenitor(X,Z) , progenitor(Z,Y).
bisabuelo(X,Y) :- progenitor(X,Z), abuelo(Z,Y).
tatarabuelo(X,Y) :- progenitor(X,Z), bisabuelo(Z,Y).
tataranieto(X,Y) :- progenitor(Y,Z),bisabuelo(Z,X).
bisnieto(X,Y) :- progenitor(Y,Z),abuelo(Z,X).
nieto(X,Y) :- progenitor(Y,Z),progenitor(Z,X).
hermano(X,Y) :- progenitor(Z,X),progenitor(Z,Y),X \== Y.
tio(X,Y) :- progenitor(Z,Y),hermano(Z,X).
cuñado(X,Y) :- hermano(X,Z),pareja(Z,Y).
cuñado(X,Y):- hermano(Y,Z),pareja(Z,X).
sobrino(X,Y):-progenitor(Z,X),hermano(Z,Y).
serfeliz(X) :- pareja(X,Y),progenitor(X,Z),progenitor(Y,Z).













