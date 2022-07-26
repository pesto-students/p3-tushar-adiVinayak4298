function contigousSumArr(arr) {
	let maxSum = 0;
	let currentSum = 0;

	for (let i = 0; i < arr.length; i++) {
		currentSum += arr[i];

		if (currentSum < 0) {
			currentSum = 0;
		} else {
			if (currentSum > maxSum) {
				maxSum = currentSum;
			}
		}
	}
	return maxSum;
}

console.log(contigousSumArr([1, 2, 3, 4, -10]));
console.log(contigousSumArr([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
