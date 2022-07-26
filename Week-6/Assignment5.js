function findPair(arr, diff) {
	let m = new Map();
	for (let i = 0; i < arr.length; i++) {
		if (m.has(arr[i])) {
			m.set(arr[i], m.get(arr[i]) + 1);
		}
		if (diff == 0 && m.get(arr[i]) > 1) {
			return 1;
		}
		if (diff == 0) {
			return 0;
		} else {
			m.set(arr[i], 1);
		}
	}

	for (let i = 0; i < arr.length; i++) {
		if (m.has(arr[i] + diff)) {
			return 1;
		}
	}
	return 0;
}

console.log(findPair([5, 10, 3, 2, 50, 80], 78));
console.log(findPair([5, 10, 3, 2, 50, 80], 100));
console.log(findPair([-10, 20], 30));

/*
OUTPUT
**********************
1
0
1
**********************
*/
