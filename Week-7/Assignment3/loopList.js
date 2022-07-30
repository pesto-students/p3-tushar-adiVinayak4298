let head;

class Node {
	constructor(val) {
		this.data = val;
		this.next = null;
		this.flag = 0;
	}
}

function push(data) {
	let temp = new Node(data);
	temp.next = head;
	head = temp;
}

function loopCheck() {
	let current = head;
	while (current != null) {
		if (current.flag == 1) {
			return true;
		}
		current.flag = 1;
		current = current.next;
	}
}

push(10);
push(20);
push(30);
push(40);
push(50);

//creating a loop here
head.next.next.next.next = head;

if (loopCheck()) {
	console.log("Loop is present");
} else {
	console.log("No Loop in the list");
}

//Time Complexity: O(N) Only one traversal of the loop is needed.
//Auxiliary Space: O(1)  There is no space required.
// Output:Loop is present