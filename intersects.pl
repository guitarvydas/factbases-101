intersects(A,B) :-
    check1(A,Abb),
    check1(B,Bbb),
    smallerThan(Abb,Bbb),
    bb_intersects(Abb,Bbb).

check1(R,BB) :-
    rectangle(R),
    notAPoint(R),
    boundingBox(R,BB),
    onlyVerticalAndHorizontalLines(BB),
    perfectRectangle(BB).

%% utilities %%
rectangle(R) :-
    rect(R,_).

notAPoint(R):-
    \+ point(R).

point(R):-
    boundingBox(R,BB),
    left(BB,L),
    top(BB,T),
    right(BB,R),
    bottom(BB,B),
    (L \= R ; T \= B).

boundingBox(R,BB):-
    left(BB),
    top(BB,T),
    right(BB,R),
    bottom(BB,B),
    BB is [L,T,R,B].

onlyVerticalAndHorizontalLines([L,_,R,_]):-
    L = R.
onlyVerticalAndHorizontalLines([_,T,_,B]):-
    T = B.

perfectRectangle(_).  % if it's a bouding box, then it's already a perfect rectanble (e.g. not a parallelogram))
