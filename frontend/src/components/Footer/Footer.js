import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faFacebookF, faTwitter, faInstagram, faPinterest, faGoogle } from '@fortawesome/free-brands-svg-icons';
import './Footer.css'



export default function Footer() {
    return (
        <div className="Footer">
            <div className="footer-container">
                <div className="footer-left">
                    <p className="cr">©2021 Sober</p>
                    <a href="/contact">FAQs</a>
                </div>
                <div className="footer-right">
                    <FontAwesomeIcon icon={faTwitter} className="cart-icon-footer" />
                    <FontAwesomeIcon icon={faFacebookF} className="cart-icon-footer" />
                    <FontAwesomeIcon icon={faInstagram} className="cart-icon-footer" />
                    <FontAwesomeIcon icon={faPinterest} className="cart-icon-footer" />
                    <FontAwesomeIcon icon={faGoogle} className="cart-icon-footer" />
                </div>
            </div>
        </div>
    )
}
