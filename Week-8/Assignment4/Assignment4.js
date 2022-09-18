const MyGraph = require("../Graphs/graphs");
MyGraph.prototype.isPathExists = function (source, target) {
	let visited = new Set();
	let list = this.adjacencyList;
	let found = false;

	let dfs = (vertex) => {
		if (vertex === null) throw new Error("Invalid input");
		if (vertex == target) return (found = true);

		visited.add(vertex);
		let neighbors = list[vertex];
		neighbors.forEach((neighbor) => {
			if (found == true) return;
			if (!visited.has(neighbor)) {
				return dfs(neighbor);
			}
		});
	};

	//  use  DFS to find if there is a path from source to target
    dfs(source);
	return found;
};

function pathExist() {
    try {
        let g = new MyGraph();
        g.addVertex(0);
        g.addVertex(1);
        g.addVertex(2);

        g.addEdge(0, 1);
        g.addEdge(1, 2);
        g.addEdge(2, 0);

        g.log();
        /**
         * Node 0 : [ 1, 2 ]
         * Node 1 : [ 0, 2 ]
         * Node 2 : [ 1, 0 ]
         */

        console.log(g.isPathExists(0, 2));      //  true
    } catch (error) {
        console.error(error);
    }
}
pathExist();
// Time Complexity: O(V + E)  V is the number of vertexes and E is the number of edges.
// Auxiliary Space: O(V) 
