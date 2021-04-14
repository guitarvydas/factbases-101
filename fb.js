
var id1 = {kind: "rect", x: 10, y: 10, width: 15, height: 15};
var id2 = {kind: "rect", x: 9, y: 15, width: 2, height: 2};

answerA = [];

if (id1.kind === "rect") {
  answerA.push (id1);
}
if (id2.kind === "rect") {
  answerA.push (id2);
}

//console.log (answerA);

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

/// is rectangle id1 bigger than rectangle id2? ///

function area (obj) {
    var width = obj.width;
    var height = obj.height;
    return width * height;
}

function bigger (obj1, obj2) {
    var area1 = area (obj1);
    var area2 = area (obj2);
    return (area1 > area2);
}

function fetch (id) {
    return fb.find (obj => id === obj.id);
}

console.log ();

console.log (`(b) id1 is bigger than id1: ${bigger(fetch ("id1"), fetch ("id2"))}`);

/// query (c)
console.log (`(c) id2 is bigger than id1: ${bigger(fetch ("id2"), fetch ("id1"))}`);


//////// sub-query - bounding boxes //////////

for (obj of fb) {
    if (obj.kind === "rect") {
	obj.bounding_box_left = obj.x;
	obj.bounding_box_top = obj.y;
	obj.bounding_box_right = obj.x + obj.width;
	obj.bounding_box_bottom = obj.y + obj.height;
    }
    //console.log (obj);
}


function intersects (subject, object) {
    // left side
    if (subject.bounding_box_left <= object.bounding_box_left) {
	if (subject.bounding_box_right >= object.bounding_box_left) {
	    return true;
	}
    };
    // right side
    if (subject.bounding_box_left <= object.bounding_box_right) {
	if (subject.bounding_box_right >= object.bounding_box_right) {
	    return true;
	}
    };
    // top
    if (subject.bounding_box_top <= object.bounding_box_top) {
	if (subject.bounding_box_bottom >= object.bounding_box_top) {
	    return true;
	}
    };
    // bottom
    if (subject.bounding_box_top <= object.bounding_box_bottom) {
	if (subject.bounding_box_bottom >= object.bounding_box_bottom) {
	    return true;
	}
    };
    return false;
}

console.log (`(d) id1 intersects id2: ${intersects (fetch ("id1"), fetch ("id2"))}`);
console.log (`(e) id1 intersects id2: ${intersects (fetch ("id2"), fetch ("id1"))}`);

    
