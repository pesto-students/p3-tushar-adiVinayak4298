import React, { useState } from "react";

const InputShortner = ({ setInputValue }) => {
	const [value, setValue] = useState("");

	const handleValue = () => {
		setInputValue(value);
		setValue("");
	};

	return (
		<div className="inputContainer">
			<h1>
				URL <span>Shortner</span>
			</h1>
			<div>
				<input
					type="text"
					placeholder="Shorten the link here..."
					value={value}
					onChange={(e) => setValue(e.target.value)}
				></input>
				<button onClick={handleValue}>Shorten</button>
			</div>
		</div>
	);
};

export default InputShortner;
