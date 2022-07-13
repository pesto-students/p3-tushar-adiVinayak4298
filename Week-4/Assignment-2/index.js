var Person = function () {};
Person.prototype.initilize = function (name, age) {
	this.name = name;
	this.age = age;
};
var Teacher = function () {
	Person.call(this);
	this.teach = function (subject) {
		console.log(`${this.name} is now teaching ${subject}`);
	};
};
Object.setPrototypeOf(Teacher.prototype, Person.prototype);
var him = new Teacher();
him.initilize("Adi", 23);
him.teach("Javscript");
