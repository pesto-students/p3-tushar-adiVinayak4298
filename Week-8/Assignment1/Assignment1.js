//create a node for constructing a binary tree.
class Node {
	// left and right child values are null and initilise data with "value"
	constructor(value) {
		this.data = value;
		this.left = null;
		this.right = null;
	}
}

//declaring maxDepthOfBt function to calculate the depth of tree
function maxDepthOfBt(root) {
	//if root is null then depth is 0
	if (root == null) {
		return 0;
	} else {
		// call function recursively to compare the depth of left and right (subtrees)
		//return value of function will return max depth of both child
		return Math.max(maxDepthOfBt(root.left), maxDepthOfBt(root.right)) + 1;
	}
}

//create root node of tree for constructing tree.
let root = new Node(10);
root.left = new Node(20);
root.right = new Node(30);
root.right.left = new Node(40);
root.right.right = new Node(50);
root.right.right.left = new Node(60);
//calling maxDepthOfBt function to get max depth of the tree.
let a = maxDepthOfBt(root);
console.log(a);

//Space Complexity: O(h), h=>height of the tree.
//Time Complexity: O(n) n is the number of nodes as we are traversing each node one by one
