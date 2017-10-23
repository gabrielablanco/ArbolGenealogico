mujer("helena").
mujer("amanda").
mujer("argenis").
mujer("nohora").
mujer("maria").
mujer("deicy").
mujer("gabriela").
mujer("adriana").
mujer("paula").
mujer("sofia").
mujer("sandra").
mujer("luisa").
mujer("marcela").

hombre("victor").
hombre("arturo").
hombre("primitivo").
hombre("javier").
hombre("jose").
hombre("manuel").
hombre("alejandro").
hombre("sebastian").
hombre("diego").
hombre("david").
hombre("bernardo").

padre("victor", "primitivo").
padre("helena", "primitivo").
padre("arturo", "argenis").
padre("amanda", "argenis").
padre("primitivo", "jose").
padre("argenis", "jose").
padre("primitivo", "javier").
padre("argenis", "javier").
padre("primitivo", "manuel").
padre("argenis", "manuel").
padre("maria", "adriana").
padre("jose", "adriana").
padre("nohora", "sebastian").
padre("nohora", "gabriela").
padre("nohora", "diego").
padre("javier", "sebastian").
padre("javier", "gabriela").
padre("javier", "diego").
padre("gabriela", "bernardo").
padre("alejandro", "bernardo").
padre("gabriela", "sandra").
padre("alejandro", "sandra").
padre("sebastian", "luisa").
padre("david", "luisa").
padre("manuel", "paula").
padre("deicy", "paula").
padre("paula", "marcela").
padre("sofia", "marcela").

hijo(X, Y) :- padre(Y, X).
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \== Y.
familiar(X, Y) :- padre(X, Y).
familiar(X, Y) :- abuelo(X, Y).
familiar(X, Y) :- hermano(X, Y).

tio(X, Y) :- padre(Z, Y), hermano(Z, X).
sobrino(X, Y) :- tio(Y, X).
primo(X, Y) :- abuelo(Z, X), abuelo(Z, Y).
nieto(X, Y) :- abuelo(Y, X).
pareja(X, Y) :- hijo(Z, X), padre(Y, Z), X \== Y.
bisabuelo(X, Y) :- hijo(Z, X), abuelo(Z, Y).
tatarabuelo(X, Y) :- hijo(Z, X), bisabuelo(Z, Y).
bisnieto(X, Y) :- bisabuelo(Y, X).
tataranieto(X, Y) :- tatarabuelo(Y, X).
serfeliz(X) :- pareja(X, Z), pareja(Z, X).
adoptado(X) :- padre(P, X), padre(M, X ), hombre(P), hombre(M), P  \==  M.
adoptado(X) :- padre(P, X), padre(M, X), mujer(P), mujer(M), P  \==  M.
cuñado(X, Y) :- pareja(A,Y),hermano(X,A).
cuñado(X,Y) :- pareja(A,X), hermano(Y,A).
















