% layer main
main(A,B) :-
    check(A,Abb),
    check(B,Bbb),
    main_0.

main_0 :-
    smallerThan(Abb,Bbb),
    intersects(Abb,Bbb).

% layer 1

check(R,BB) :-
    rectangle(R),
    notAPoint(R),
    boundingBox(R,BB),
    onlyVerticalAndHorizontalLines(BB),
    perfectRectangle(BB).

aSmallerThanB(A,B):-
  area(A,Aarea),	
  area(B,Barea),
  Aarea < Barea.

intersects(Abb, Bbb):-
    intersects_vertically(Abb,Bbb).
intersects(Abb, Bbb):-
    intersects_horizontally(Abb,Bbb).

% layer 2.1

% layer 1.x
intersect_horizontally(Abb,Bbb):-
    fig_a(Abb,Bbb).
intersect_horizontally(Abb,Bbb):-
    fig_b(Abb,Bbb).
intersect_horizontally(Abb,Bbb):-
    fig_c(Abb,Bbb).
intersect_horizontally(Abb,Bbb):-
    fig_d(Abb,Bbb).


% layer 1.1.x
intersect_vertically(Abb,Bbb):-
    fig_e(Abb,Bbb).
intersect_vertically(Abb,Bbb):-
    fig_f(Abb,Bbb).
intersect_vertically(Abb,Bbb):-
    fig_g(Abb,Bbb).
intersect_vertically(Abb,Bbb):-
    fig_h(Abb,Bbb).

% layer 1.2.x
intersect_vertically(Abb,Bbb):-
    fig_e(Abb,Bbb).
intersect_vertically(Abb,Bbb):-
    fig_f(Abb,Bbb).
intersect_vertically(Abb,Bbb):-
    fig_g(Abb,Bbb).
intersect_vertically(Abb,Bbb):-
    fig_h(Abb,Bbb).

 
aHorizontalIntersectsBVertical(A,B):-
    left(A,Ax1),
    right(A,Ax2),
    top(A,Ay1),
    top(B,By1),
    bottom(B,By2),
    left(B,Bx1),
    lineAintersectsLineB([Ax1,Ay1,Ax2,Ay1],[Bx1,By1,Bx1,By2]).

%% utilities %%

% A and B are lines (x1,y1) to (x2,y2)
% vertical A horizontal B
lineAintersectsLineB([Ax,Ay1,_,Ay2],[Bx1, By, Bx2, _]) :-
    Ax >= Bx1,
    Ax =< Bx2,
    Ay1 >= By,
    Ay2 =< By.
% horizontal A vertical B
lineAintersectsLineB([Ax1,Ay,Ax2,_],[Bx, By1, _, By2]) :-
    lineAintersectsLineB([Bx,By1,_,By2],[Ax1,Ay,Ax2,_]).
% all other cases are illegal
    

area(BB,Area) :-
    left(BB,L),
    top(BB,T),
    right(BB,R),
    bottom(BB,B),
    Width = R - L,
    Height = B - T,
    abs(Width, Wabs),
    abc(Height, Habs),
    Area = Wabs * Habs.

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
