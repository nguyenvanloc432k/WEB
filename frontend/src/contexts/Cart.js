import React, { useEffect, useState } from 'react'

export const CartContext = React.createContext();

export function CartProvider(props) {
    const [cartItems, setCartItems] = useState([])
    const [wishListItems, setWishListItems] = useState([])
    const [clickedCart, setClickedCart] = useState(0)
    const [total, setTotal] = useState(0)

    const  isExists = (cartItems = [], item = {}) => {
        for (let cartItem of cartItems ) { // loop qua value, neu for in thi loop key
            if (cartItem.productID === item.productID) {
                return cartItem;
            }
        }
        return false;
    }

    useEffect(() => {// nếu có data trong localStorage thì lấy ra
        if (localStorage.getItem('cart')) {
            setCartItems(JSON.parse(localStorage.getItem('cart')))
        }
        if (localStorage.getItem('wishlist')) {
            setWishListItems(JSON.parse(localStorage.getItem('wishlist')))
        }
        setTotal(JSON.parse(localStorage.getItem('total')))
    }, [])

    const addToWishList = (product = {}) => {
        const virtualCart =  [...wishListItems]
        if (wishListItems.length === 0) {
            virtualCart.push({...product})
        } else {
            if (!isExists(wishListItems, product)) {
                virtualCart.push({...product})
            }
        }
        localStorage.setItem('wishlist', JSON.stringify(virtualCart))
        setWishListItems(virtualCart)
    }

    const addToCart = (product = {}, count) => {
        if (count) {
            setClickedCart(clickedCart + count)
            const virtualCart = [...cartItems]
            if (cartItems.length === 0) {
                virtualCart.push({...product, count: count})
            } else {
                const productNew = isExists(cartItems, product)
                if (!productNew) {
                    virtualCart.push({...product, count: 1})
                } else {
                    productNew.count += count
                }
            }
            localStorage.setItem('cart', JSON.stringify(virtualCart))
            setCartItems(virtualCart)
            getTotal(virtualCart)
        } else {
            setClickedCart(clickedCart + 1)
            const virtualCart = [...cartItems]
            if (cartItems.length === 0) {
                virtualCart.push({...product, count: 1})
            } else {
                const productNew = isExists(cartItems, product)
                if (!productNew) {
                    virtualCart.push({...product, count: 1})
                } else {
                    productNew.count += 1
                }
            }
            localStorage.setItem('cart', JSON.stringify(virtualCart))
            setCartItems(virtualCart)
            getTotal(virtualCart)
        }
    }

    const removeFromCart = (event) => {
        const id =parseInt(event.target.id)

        // console.log("remove"+id)
        const virtualCart = [...cartItems]
        for (let i = 0; i < virtualCart.length; i++) {
            if (virtualCart[i].productID === id) {
                console.log("an")
                virtualCart.splice(i, 1)
                break
            }
        }
        localStorage.setItem('cart', JSON.stringify(virtualCart))
        setCartItems(virtualCart)
        getTotal(virtualCart)
    }

    const removeFromWishList = (event) => {
        const id = event.target.id
        const virtualCart = [...cartItems]
        for (let i = 0; i < virtualCart.length; i++) {
            if (virtualCart[i].productID === id) {
                virtualCart.splice(i, 1)
                break
            }
        }
        localStorage.setItem('wishlist', JSON.stringify(virtualCart))
        setWishListItems(virtualCart)
    }

    const minusCount = (event) => {
        const id = event.target.id
        const virtualCart = [...cartItems]
        for (let i = 0; i < virtualCart.length; i++) {
            if (virtualCart[i].productID === Number(id)) {
                if (virtualCart[i].count > 1) {
                    virtualCart[i].count = virtualCart[i].count - 1
                }
            }
        }
        localStorage.setItem('cart', JSON.stringify(virtualCart))
        setCartItems(virtualCart)
        getTotal(virtualCart)
    }

    const plusCount = (event) => {
        const id = event.target.id
        const virtualCart = [...cartItems]
        for (let i = 0; i < virtualCart.length; i++) {
            if (virtualCart[i].productID === Number(id)) {
                virtualCart[i].count += 1
            }
        }
        localStorage.setItem('cart', JSON.stringify(virtualCart))
        setCartItems(virtualCart)
        getTotal(virtualCart)
    }

    const updateCount = (event) => {
        const id = event.target.id
        const value = event.target.value
        const virtualCart = [...cartItems]
        for (let i = 0; i < virtualCart.length; i++) {
            if (virtualCart[i].productID === id) {
                virtualCart[i].count = Number(value)
            }
        }
        localStorage.setItem('cart', JSON.stringify(virtualCart))
        setCartItems(virtualCart)
        getTotal(virtualCart)
    }

    const getTotal = (arr) => {
        let virtualTotal = 0
        for (let i in arr) {
            virtualTotal += Number(arr[i].count) * Number(arr[i].productPrice)        }
        localStorage.setItem('total', JSON.stringify(virtualTotal))
        setTotal(virtualTotal)
    }

    return (
        <CartContext.Provider
            value={{
                cartItems: cartItems,
                addToCart: addToCart,
                wishListItems: wishListItems,
                addToWishList: addToWishList,
                clickedCart: clickedCart,
                removeFromCart: removeFromCart,
                plusCount: plusCount,
                minusCount: minusCount,
                removeFromWishList: removeFromWishList,
                updateCount: updateCount,
                total: total
            }}
        >
            {props.children}
        </CartContext.Provider>
    )
}

