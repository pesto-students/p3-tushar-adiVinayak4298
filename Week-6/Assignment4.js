function maxProfit(arr) {
	let lo = 0;
	let hi = 1;
	let maxProfit = 0;

	while (hi < arr.length) {
		if (arr[lo] < arr[hi]) {
			maxProfit = Math.max(maxProfit, arr[hi] - arr[lo]);
		} else {
			lo = hi;
		}
		hi++;
	}
	return maxProfit;
}

const arr1 = [7, 1, 5, 3, 6, 4];
const arr2 = [7, 6, 4, 3, 1];

console.log(maxProfit(arr1));
console.log(maxProfit(arr2));

/* 
OUTPUT:-
**************************
5
0
**************************
*/
