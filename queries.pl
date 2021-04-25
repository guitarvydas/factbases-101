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

intersects(Subject,Object) :-
    dif(Subject,Object),
    bounding_box(Subject,[SubjL,_,SubjR,_]),
    bounding_box(Object,[ObjL,_,_,_]),
    SubjL < ObjL,
    SubjR > ObjL,
    format("~w ~w ~w ~w~n",[a,SubjL,SubjR,ObjL]).

% right side
intersects(Subject,Object) :-
    dif(Subject,Object),
    bounding_box(Subject,[SubjL,_,SubjR,_]),
    bounding_box(Object,[_,_,ObjR,_]),
    SubjL < ObjR,
    SubjR > ObjR,
    format("~w ~w ~w ~w~n",[b,SubjL,SubjR,ObjR]).

% top
intersects(Subject,Object) :-
    dif(Subject,Object),
    bounding_box(Subject,[_,SubjTop,_,SubjBottom]),
    bounding_box(Object,[_,ObjTop,_,_]),
    SubjTop < ObjTop,
    SubjBottom > ObjTop,
    format("~w ~w ~w ~w~n",[c,SubjTop,SubjBottom,ObjTop]).


% bottom
intersects(Subject,Object) :-
    dif(Subject,Object),
    bounding_box(Subject,[_,SubjTop,_,SubjBottom]),
    bounding_box(Object,[_,_,_,ObjBottom]),
    SubjTop < ObjBottom,
    SubjBottom > ObjBottom,
    format("~w ~w ~w ~w~n",[d,SubjTop,SubjBottom,ObjBottom]).

lineA_intersects_lineB(Ax1, Ay1, Ax2, Ay2, Bx1, By1, Bx2, By2) :-
    Bx1 < Ax1,
    Bx2 > Ax1,
    By1
