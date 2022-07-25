function threeSumClosest(nums, target) {
	nums.sort((x, y) => x - y);
	let closest = Infinity;

	for (let i = 0; i < nums.length - 2; i++) {
		if (i > 0 && nums[i] === nums[i - 1]) continue;

		let left = i + 1,
			right = nums.length - 1;

		while (left < right) {
			const total = nums[i] + nums[left] + nums[right];

			//If found, return target.
			if (total === target) return target;

			//Otherwise set closest to min of distance between current total and target
			closest =
				Math.abs(target - closest) < Math.abs(target - total)
					? closest
					: total;

			//If current total is less than target, we know we need a higher number and arr
			//is sorted.  Incrementing left pointer and looping until we find a unique val
			//gives us the next highest number.

			if (total < target) {
				left++;
				while (left < right && nums[i] === nums[i - 1]) left++;
			} else {
				right--;
				while (left < right && nums[right] === nums[right + 1]) right--;
			}
		}
	}
	return closest;
}

console.log(threeSumClosest([-1, 2, 1, -4], 1));

/*
OUTPUT
**********************
2
**********************
*/
