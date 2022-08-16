import React, { useState } from "react";
import logo from "./logo.svg";
import "./App.css";
import InputField from "./components/InputField";
import { Todo } from "./model";
import ToDoList from "./components/ToDoList";

const App: React.FC = () => {
	const [todo, setTodo] = useState<string>("");
	const [todos, setTodos] = useState<Todo[]>([]);

	const handleAdd = (e: React.FormEvent) => {
		console.log(e);
		e.preventDefault();
		if (todo) {
			setTodos([...todos, { id: Date.now(), todo: todo, isDone: true }]);
			setTodo("");
		}
	};
	console.log(todos);
	return (
		<div className="App">
			<span className="heading">Taskello</span>
			{/* <span>
				You have got <span>{todos.length} task</span> day
			</span> */}
			<InputField todo={todo} setTodo={setTodo} handleAdd={handleAdd} />
			<ToDoList todos={todos} setTodos={setTodos} />
		</div>
	);
};

export default App;
