import React, { useRef, useState } from 'react';
import './NewsLetter.css'
export default function Newsletter () {

    const inputEmailRef = useRef();//chua tim hieu
    const [emailInput, setEmailInput] = useState(""); // tao mot email la rong
    const handleOnChange = (event) => {
        setEmailInput(event.target.value) // lay email khi handle set cho emailInput
    }
    const handleOnSubmit = (event) => {
        event.preventDefault(); // nhap den khi Enter moi tra ve ket qua
        fetch.post('http://pe.heromc.net:4000/email', {
            subscriber: emailInput
        })
            .then(res => res.json())
            .then(res => {
                alert(res.data)
            })
            .catch(err => {
                alert(err.response.data)
            })
        inputEmailRef.current.value = ""
    }


    return(
        <div className="Newsletter">
            <div className="newsletter-container">
                <div className="newsletter-title">Newsletter</div>
                <div className="newsletter-small">Get timely updates from your favorite products</div>
                <form className="newsletter-form flex-center" onSubmit={handleOnSubmit}>
                    <input
                        className="newsletter-input"
                        placeholder="Enter your email address"
                        type="email"
                        onChange={handleOnChange}
                        ref={inputEmailRef}
                    ></input>
                    <button className="newsletter-btn btn">Subcribe</button>
                </form>
                <div className="newsletter-line"></div>
            </div>
        </div>
    )
}
