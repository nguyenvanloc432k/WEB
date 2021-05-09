// import
import {withRouter} from "react-router-dom"
import './Header.css'
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faCartPlus, faSearch} from "@fortawesome/free-solid-svg-icons";
import React, {useState} from "react";
import classNames from "classnames";
import {faUser} from "@fortawesome/free-solid-svg-icons/faUser";

function Header(props){

    const [search, setSearch] = useState("");

    const redirect = (event) => {
        window.scrollTo(0,0);
        props.history.push(`/${event.target.id}`)
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

            <div> </div>

            <div></div>

            <div>
                <ul className="menu">
                    {/*icon search*/}
                    <li>
                        <input
                            onChange={(e) =>{
                                setSearch(e.target.value)
                            }}
                            value={search}
                            className="input" placeholder="Search"
                        />
                        <div onClick={
                            ()=>{
                                this.props.history.push(`/shop/${search}`)
                            }
                        }>
                            <FontAwesomeIcon icon={faSearch} style={{marginLeft: '10px'}}/>
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


            {/*end of menu*/}
        </div>
    )
}
export default withRouter(Header)