// import
import {withRouter} from "react-router-dom"
import '../../App.css'
import './Header.css'
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faCartPlus, faSearch} from "@fortawesome/free-solid-svg-icons";
import React, {useState} from "react";
import {faUser} from "@fortawesome/free-solid-svg-icons/faUser";
import Search from "./Search";

function Header(props){

    const [searchOpen, setSearchOpen] = useState('false')

    const redirect = (event) => {
        window.scrollTo(0,0);
        props.history.push(`/${event.target.id}`)
    }

    const clickToClose = () => {
        setSearchOpen(false)
        document.body.style.overflow = 'unset';
    }

    if (searchOpen) {
        document.body.style.overflow = 'hidden';
    }

    return (
        <div className="header">
            <div>
                <ul className="menu">
                    <li><a href="/home">Home</a></li>
                    <li><a href="/product">Product</a></li>
                    <li><a href="/contact">Contact</a></li>
                    <li><a href="/about">About</a></li>
                </ul>
            </div>
            {/*<div className="logo flex-center">*/}
            {/*    BK LAPTOP*/}
            {/*</div>*/}
            <div>
                <ul className="menu">
                    {/*icon search*/}
                    <li className="search-icon">
                        <div>
                            <FontAwesomeIcon onClick={()=>{setSearchOpen(true)}} icon={faSearch} style={{marginLeft: '10px'}}/>
                        </div>
                    </li>
                    {/*icon cart*/}
                    <li className="cart-icon">
                        <a href="/cart">
                            <FontAwesomeIcon
                                icon={faCartPlus}
                            />
                        </a>
                    </li>

                    {/*icon personal*/}
                    <li className="personal-icon">
                        <a href="/personal">
                            <FontAwesomeIcon
                                icon={faUser}
                            />
                        </a>
                    </li>
                </ul>
            </div>
            <Search searchOpen={searchOpen} clickToClose={clickToClose}/>
        </div>
    )
}
export default withRouter(Header)