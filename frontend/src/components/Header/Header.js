// import
import {withRouter} from "react-router-dom"
import '../../App.css'
import './Header.css'
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faCartPlus, faSearch, faHeart} from "@fortawesome/free-solid-svg-icons";
import React, {useState} from "react";
import {faUser} from "@fortawesome/free-solid-svg-icons/faUser";
import Search from "./Search";
import Cart from './Cart'

function Header(props){

    const [searchOpen, setSearchOpen] = useState(false)
    const [cartOpen, setCartOpen] = useState(false)
    const [accountOpen, setAccountOpen] = useState(false)
    const [wishlistOpen, setWishlistOpen] = useState(false)

    const redirect = (event) => {
        window.scrollTo(0,0);
        props.history.push(`/${event.target.id}`)
    }

    const clickToClose = () => {
        setSearchOpen(false)
        setCartOpen(false)
        setSearchOpen(false)
        setWishlistOpen(false)
        document.body.style.overflow = 'unset';
    }

    if (searchOpen || cartOpen || accountOpen || wishlistOpen) {
        document.body.style.overflow = 'hidden';
    }

    return (
        <div className="header">
            <div className="flex-center">
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
            <div className="flex-center">
                <ul className="menu">
                    {/*icon search*/}
                    <li className="search-icon">
                        <div>
                            <FontAwesomeIcon onClick={()=>{setSearchOpen(true)}} icon={faSearch} style={{marginLeft: '10px'}}/>
                        </div>
                    </li>
                    {/*icon cart*/}
                    <li className="cart-icon">
                        <div>
                            <FontAwesomeIcon
                                icon={faCartPlus}
                                onClick={() => { setCartOpen(true) }}
                            />
                        </div>
                    </li>
                    {/*icon wishlist*/}
                    <li className="wishlist-icon">
                        <div>
                            <FontAwesomeIcon
                                icon={faHeart}
                                onClick={() => { setWishlistOpen(true) }}
                            />
                        </div>
                    </li>

                    {/*icon personal*/}
                    <li className="personal-icon">
                        <div>
                            <FontAwesomeIcon
                                icon={faUser}
                            />
                        </div>
                    </li>
                </ul>
            </div>
            <Search check={props.check} searchOpen={searchOpen} clickToClose={clickToClose}/>
            <Cart cartOpen={cartOpen} clickToClose={clickToClose}/>
        </div>
    )
}
export default withRouter(Header)