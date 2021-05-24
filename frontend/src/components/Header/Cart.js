import React, {useContext} from 'react'
import "../../App.css"
import './Cart.css'
import { CartContext } from '../../contexts/Cart'
import { faTimes } from "@fortawesome/free-solid-svg-icons"
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import CartItem from './CartItem'

function Cart(props) {
    const {total} = useContext(CartContext)

    return(
        <div className={props.cartOpen === false ? "Cart displayNone" : "Cart"}>
            <div className="cart-header">
                <div className="cart-header__title">
                    Cart
                </div>
                <div className="cart-header__close"
                onClick={props.clickToClose}>
                    <FontAwesomeIcon icon={faTimes} className="icon"/>
                </div>
            </div>
            <div>
                <CartItem/>
            </div>
            <div className="cart-checkout-box flex-center">
                <div className="cart-checkout-text flex">
                    <p>Total: </p>
                    {
                        total &&
                        <p>{total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")}</p>
                    }
                </div>
                <div
                    className="cart-checkout-btn btn"
                    onClick={()=>{
                        if (total > 0) {
                            props.history.push(`/checkout`);
                        }
                    }}
                >
                    Checkout
                </div>
            </div>
        </div>
    )
}
export default Cart