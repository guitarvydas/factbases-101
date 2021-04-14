
var id1 = {kind: "rect", x: 10, y: 10, width: 15, height: 15};
var id2 = {kind: "rect", x: 9, y: 15, width: 2, height: 2};

answerA = [];

if (id1.kind === "rect") {
  answerA.push (id1);
}
if (id2.kind === "rect") {
  answerA.push (id2);
}

console.log (answerA);

/////

var id1 = {id: "id1", kind: "rect", x: 10, y: 10, width: 15, height: 15};
var id2 = {id: "id2", kind: "rect", x: 9, y: 15, width: 2, height: 2};

answerAprimed = [];

if (id1.kind === "rect") {
  answerAprimed.push (id1);
}
if (id2.kind === "rect") {
  answerAprimed.push (id2);
}

console.log (answerAprimed);

for (r of answerAprimed) {
    console.log (r.id);
}
///////

var fb = [
  {id: "id1", kind: "rect", x: 10, y: 10, width: 15, height: 15},
  {id: "id2", kind: "rect", x: 9, y: 15, width: 2, height: 2},
];

for (obj of fb) {
    if (obj.kind === "rect") {
	console.log (obj.id);
    }
}


/// query b ///

//////// sub-query - bounding boxes //////////

for (obj of fb) {
    if (obj.kind === "rect") {
	obj.bounding_box_left = obj.x;
	obj.bounding_box_top = obj.y;
	obj.bounding_box_right = obj.x + obj.width;
	obj.bounding_box_bottom = obj.y + obj.height;
	console.log (obj);
    }
}

