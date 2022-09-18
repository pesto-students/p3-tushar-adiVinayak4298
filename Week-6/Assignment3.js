function sort(arr) {
	let lo = 0;
	let hi = arr.length - 1;
	let mid = 0;
	let temp = 0;
	while (mid <= hi) {
		if (arr[mid] == 0) {
			temp = arr[lo];
			arr[lo] = arr[mid];
			arr[mid] = temp;
			lo++;
			mid++;
		} else if (arr[mid] == 1) {
			mid++;
		} else {
			temp = arr[mid];
			arr[mid] = arr[hi];
			arr[hi] = temp;
			hi--;
		}
	}
	return arr;
}

let arr = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1];
console.log(sort(arr));

/* 
OUTPUT:-
**************************
[
  0, 0, 0, 0, 0,
  1, 1, 1, 1, 1,
  2, 2
]
**************************
*/
