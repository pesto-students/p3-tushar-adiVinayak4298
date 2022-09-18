import { useState } from "react";
import InputShortner from "./InputShortner";
import LinkResult from "./LinkResult";
import { Link, Routes, Route, useLocation } from "react-router-dom";

const Home = () => {
	const [inputValue, setInputValue] = useState("");
	const [value, setValue] = useState("");
	return (
		<div className="container">
			<InputShortner setInputValue={setInputValue} setLink={setValue} />
			<LinkResult inputValue={inputValue} />
		</div>
	);
};

export default Home;
