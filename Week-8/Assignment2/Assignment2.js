//create a node for constructing a binary tree.
class Node {
    // left and right child values are null and initilise data with "value"
	constructor(value) {
		this.data = value;
		this.left = null;
		this.right = null;
	}
}
//prevValue variable to keep track of previous value.
let prevValue = null;
//using the inorder traversal for checking the if tree is valid bst or not 
function checkBST(root) {
	//check if root is not null or if its null return true
	if (root != null) {
		//check if left child is valid bst or not by calling the function recursilvely of left node 
		if (!checkBST(root.left)) {
			return false;
		}
		//if prevValue stored data is not null and root data is less then prevValue data then it can not be a BST
		if (prevValue != null && root.data <= prevValue.data) {
			return false;
		}
		//store root into prevValue.
		prevValue = root;
		return checkBST(root.right);
	}
	return true;
}

//create root node of tree for constructing tree and create its child
let root = new Node(5);
root.left = new Node(2);
root.right = new Node(7);
root.left.left = new Node(1);
root.left.right = new Node(4);
//call checkBST function
console.log(checkBST(root));

//Time Complexity: O(n) as we visit every node just once.
//Space Complexity:O(h), h is height of the tree.
