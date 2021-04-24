rectangle(id1,nil).
rectangle(id2,nil).
x(id1,20).
x(id2,10).
y(id1,10).
y(id2,40).
width(id1,120).
width(id2,20).
height(id1,80).
height(id2,20).


area(Subject,A) :-
    width(Subject,W),
    height(Subject,H),
    A is H * W.

bigger(Subject, Object) :-
    area(Subject,As),
    area(Object,Os),
    As > Os.

bounding_box(Subject,BB) :-
    x(Subject,X),
    y(Subject,Y),
    width(Subject,W),
    height(Subject,H),
    Right is X + W,
    Bottom is Y + H,
    BB = [X, Y, Right, Bottom].

% left side
naive_intersects(Subject,Object) :-
    write(a0),nl,
    Subject \= Object,
    write(a00),nl,
    bounding_box(Subject,[Ls,_,Rs,_]),
    write(a1),nl,
    bounding_box(Object,[Lo,_,_,_]),
    write(a2),nl,
    Ls < Lo,
    write(a3),nl,
    Rs > Lo.
% right side
naive_intersects(Subject,Object) :-
    write(b0),nl,
    Subject \= Object,
    bounding_box(Subject,[Ls,_,Rs,_]),
    write(b1),nl,
    bounding_box(Object,[_,_,Ro,_]),
    write(b2),nl,
    Ls < Ro,
    write(b3),nl,
    Rs > Ro.


intersects(Subject,Object) :-
    bounding_box(Subject,[Ls,_,Rs,_]),
    bounding_box(Object,[Lo,_,_,_]),
    Ls < Lo,
    Rs > Lo,
    !.
% right side
intersects(Subject,Object) :-
    bounding_box(Subject,[Ls,_,Rs,_]),
    bounding_box(Object,[_,_,Ro,_]),
    Ls < Ro,
    Rs > Ro,
    !.
% top
intersects(Subject,Object) :-
    bounding_box(Subject,[_,Lt,_,Lb]),
    bounding_box(Object,[_,Rtop,_,_]),
    Lt < Rtop,
    Lb > Rtop,
    !.
% bottom
intersects(Subject,Object) :-
    bounding_box(Subject,[_,Lt,_,Lb]),
    bounding_box(Object,[_,_,_,Rbottom]),
    Lt < Rbottom,
    Lb > Rbottom,
    !.

