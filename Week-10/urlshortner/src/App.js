import { useState } from "react";
import "./App.css";
import InputShortner from "./components/InputShortner";
import LinkResult from "./components/LinkResult";
import Home from "./components/Home";
import { Routes, Route, Link } from "react-router-dom";

function App() {
	return (
		<>
			<div className="header">
				<Link to="/" className="link">
					Home
				</Link>
				|
				<Link to="/contact" className="link">
					Contact
				</Link>
				<Link to="/LogIn" className="link">
					LogIn
				</Link>
				<Link to="/Signup" className="link">
					Signup
				</Link>
			</div>
			<Routes>
				<Route path="/" element={<Home />} />
			</Routes>
		</>
	);
}

export default App;
