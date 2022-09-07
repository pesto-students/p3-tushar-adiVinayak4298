import { useEffect, useState } from "react";
// import {CopyToClipboard} from 'react-copy-to-clipboard';
import axios from "axios";
import CopyToClipBoard from "./CopyToClipBoard";

const LinkResult = ({ inputValue }) => {
	// console.log(inputValue);
	const [shortenLink, setShortenLink] = useState("");
	const [shortenLinkList, setShortenLinkList] = useState([]);
	// console.log(shortenLink);
	const [copied, setCopied] = useState(false);
	const [loading, setLoading] = useState(false);
	const [error, setError] = useState(false);

	const fetchData = async () => {
		try {
			setLoading(true);
			const res = await axios(
				`https://api.shrtco.de/v2/shorten?url=${inputValue}`
			);
			setShortenLink(res.data.result.full_short_link);
			let finalObj = {
				inputValue: inputValue,
				linkValue: res.data.result.full_short_link,
			};
			setShortenLinkList([...shortenLinkList, finalObj]);
			error && setError(false);
		} catch (err) {
			setError(err);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		if (inputValue.length) {
			fetchData();
		}
	}, [inputValue]);

	useEffect(() => {
		const timer = setTimeout(() => {
			setCopied(false);
		}, 1000);

		return () => clearTimeout(timer);
	}, [copied]);

	if (loading) {
		return <p className="noData">Loading...</p>;
	}
	if (error) {
		setTimeout(() => {
			setError(false);
		}, 3000);
		return (
			<p className="noData">oops! something went wrong. Please wait ! </p>
		);
	}

	return (
		<>
			{shortenLinkList.length == 0 && <div>No links added</div>}
			{shortenLinkList.length != 0 &&
				shortenLinkList.map((item, key) => (
					<div className="result" key={key}>
						<p>{item.inputValue} </p>
						<p> {item.linkValue} </p>
						<CopyToClipBoard item={item.linkValue} />
					</div>
				))}
		</>
	);
};

export default LinkResult;
