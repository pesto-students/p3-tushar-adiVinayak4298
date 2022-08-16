//calling class from source
const MyQueue = require("../queue/queue");
const BinarySearchTree = require("../BST/binarySearchTree");
//levelorder function created
const levelOrder = (tree) => {
	//resultant list
	let result = [];
	//using queue to arrange removed element using dequeue to arrange it from beginning
	let queue = new MyQueue();
	//pointer
	let current = tree.root;
	queue.enqueue(current);
	//loop to remove element from start of queue and add it to result
	while (queue.size) {
		current = queue.dequeue();
		result.push(current.value);
		// check if left child is present
		if (current.left) {
			// if present add it to queue
			queue.enqueue(current.left);
		}
		// check if right child is present
		if (current.right) {
			// if present add it to queue
			queue.enqueue(current.right);
		}
	}
	return result;
};
try {
	const binaryTree = new BinarySearchTree();
	binaryTree.insert(30);
	binaryTree.insert(20);
	binaryTree.insert(10);
	binaryTree.insert(25);
	binaryTree.insert(40);
	binaryTree.insert(35);
	binaryTree.insert(45);
	const getList = levelOrder(binaryTree);
	console.log(getList);
} catch (e) {
	console.warn(e);
}


//Time Complexity: O(n) as we visit every node just once.
//Space Complexity:O(h), h is height of the tree.