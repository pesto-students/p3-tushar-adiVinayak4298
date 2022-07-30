class Queue {
	constructor() {
		this.stack1 = [];
		this.stack2 = [];
	}

	enQueue(x) {
		while (this.stack1.length != 0) {
			this.stack2.push(this.stack1.pop());
		}

		this.stack1.push(x);

		while (this.stack2.length != 0) {
			this.stack1.push(this.stack2.pop());
		}
	}

	deQueue() {
		if (this.stack1.length == 0) {
			return -1;
		}
		let num = this.stack1[this.stack1.length - 1];
		this.stack1.pop();
		return num;
	}
}

let que = new Queue();
let arr = [1, 2, 2, 2, 1, 4];

for (let i = 0; i < arr.length; i++) {
	if (arr[i] == 1) {
		que.enQueue(arr[i + 1]);
		i++;
	} else if (arr[i] == 2) {
		console.log(que.deQueue());
	}
}

//Time Complexity: push -> O(N)   pop -> O(1)
// for push :In the worst case we can empty whole of stack 1 into stack 2.
// for pop:Same as pop operation in stack.
//Auxiliary Space: O(N) // Use of stack for storing values.
// Use of stack for storing values.
// enQueue(x) will be before inserting into stack1 pop everything into stack2
// then push into stack1 and pop everything from stack2 back to stack1

// deQueue() will be just pop from stack1
