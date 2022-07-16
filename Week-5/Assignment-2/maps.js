const isVowel = (char) => {
	return "aeiou".includes(char.toLowerCase());
};

const countVowel = (str) => {
	const countVowel = new Map();
	for (let i of str) {
		let lowerCaseChar = i.toLowerCase();
		if (isVowel(i)) {
			if (countVowel.has(i)) {
				countVowel.set(
					lowerCaseChar,
					countVowel.get(lowerCaseChar) + 1
				);
			} else {
				countVowel.set(lowerCaseChar, 1);
			}
		}
	}
	return countVowel;
};

countVowel("adityaVinayak");
