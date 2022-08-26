function findTownJudge(n, trust) {
    if (!trust.length && n === 1) return 1;
    if (n < 1 || n > 1000) throw new Error("Invalid number of persons passed!");
    if (trust.length === 1) return trust[0][1];
    if (trust.length > 104) throw new Error("Trust size exceeded!");
    if (trust.every(arr => arr[0] != arr[1])) throw new Error("Trust person can't be himself");
   
    const totalTrustCount = Array(n + 1).fill(0);

    for (let [person, trustPerson] of trust) {
        // considering that person isn't a judge
        totalTrustCount[person]--;
        // person trusts another person next to it
        totalTrustCount[trustPerson]++;
    }

    for (let i = 0; i < totalTrustCount.length; i++) {
        // the last person will be most trusted i.e the judge
        if (totalTrustCount[i] == n - 1) return i;
    }

    return -1;
}

function find() {
    try {
        const n = 2, trust = [[1, 2]];
        console.log(findTownJudge(n, trust));       //  2

    } catch (error) {
        console.error(error);
    }
}
find();

// Time Complexity - O(n),
//  Space Complexity - O(n+1) space take by array isn+1