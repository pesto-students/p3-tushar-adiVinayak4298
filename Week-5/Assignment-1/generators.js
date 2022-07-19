const doTask1 = async () => {
	return new Promise((resolve, reject) => {
		setTimeout(() => {
			resolve(console.log("doing first task"));
		}, 2000);
	});
};

const doTask2 = async () => {
	return new Promise((resolve, reject) => {
		setTimeout(() => {
			resolve(console.log("doing second task"));
		}, 2000);
	});
};

const doTask3 = async () => {
	return new Promise((resolve, reject) => {
		setTimeout(() => {
			resolve(console.log("doing third task"));
		}, 2000);
	});
};

async function allAsync() {
	try {
		await doTask1();
		console.log("First task done");
		await doTask2();
		console.log("second task done");
		await doTask3();
		console.log("Third task done");
	} catch (err) {
		console.log(`Error-${err}`);
	} finally {
		console.log("finished all 3 async tasks");
	}
}
allAsync();

// executing doTask1,doTask2,and doTask3 by generator function
function* generatorAsync() {
	yield doTask1()
		.then((res) => console.log)
		.catch((err) => console.log(`Error-${err}`))
		.finally(() => console.log("doTask1 done"));
	yield doTask2()
		.then((res) => console.log)
		.catch((err) => console.log(`Error-${err}`))
		.finally(() => console.log("doTask2 done"));
	yield doTask3()
		.then((res) => console.log)
		.catch((err) => console.log(`Error-${err}`))
		.finally(() => console.log("doTask3 done"));
	return { done: true };
}
const gen = generatorAsync();
gen.next();
gen.next();
gen.next();
