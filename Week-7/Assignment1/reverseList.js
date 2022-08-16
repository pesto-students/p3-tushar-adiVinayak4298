let head;

class Node {
	constructor(val) {
		this.data = val;
		this.next = null;
	}
}

function reverse(node) {
	let prev = null;
	let current = node;
	let next = null;
	while (current != null) {
		next = current.next;
		current.next = prev;
		prev = current;
		current = next;
	}
	node = prev;
	return node;
}

function display(node) {
	let str = "";
	while (node != null) {
		str += node.data + " -> ";
		node = node.next;
	}
	console.log(str);
}

function push(data) {
	let temp = new Node(data);
	temp.next = head;
	head = temp;
}

push(10);
push(20);
push(30);
push(40);
push(50);

console.log("Given Linked list :");
display(head);
head = reverse(head);
console.log("\nReversed linked list :");
display(head);

// Time Complexity: O(N) because we have to traverse the linklist till the end and we are using one while loop to acheive this
//Auxiliary Space: O(1) because we are not using any extra space there fore space complexity will be  0(1)
// output:
// "Given Linked list :"
// "50 -> 40 -> 30 -> 20 -> 10 -> "
// "
// Reversed linked list :"
// "10 -> 20 -> 30 -> 40 -> 50 -> "