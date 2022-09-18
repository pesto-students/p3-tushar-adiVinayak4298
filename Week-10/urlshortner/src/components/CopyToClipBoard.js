import { useEffect, useState } from "react";
import { CopyToClipboard } from "react-copy-to-clipboard";

const CopyToClipBoard = ({ item }) => {
	const [copied, setCopied] = useState(false);

	useEffect(() => {
		const timer = setTimeout(() => {
			setCopied(false);
		}, 1000);

		return () => clearTimeout(timer);
	}, [copied]);
	return (
		<>
			<CopyToClipboard text={item} onCopy={() => setCopied(true)}>
				<button className={copied ? "copied" : ""}>
					Copy to clipboard
				</button>
			</CopyToClipboard>
			{copied ? <span style={{ color: "red" }}>Copied.</span> : null}
		</>
	);
};

export default CopyToClipBoard;
