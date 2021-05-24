import React, { useContext, useEffect, useRef, useState } from 'react';
import '../../App.css'
import './ProductBody.css'
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faAngleRight, faCartPlus, faChevronLeft, faChevronRight, faHeart, faMinus, faPlus } from "@fortawesome/free-solid-svg-icons";
import { CartContext } from '../../contexts/Cart';

const ProductBody = (props) => {
    const {addToCart} = useContext(CartContext)
    const [countCart, setCountCart] = useState(1)

    let product = ""
    let price = ''
    let length = 0
    let img_list = []
    // console.log("product:" + props.product)
    if (props.product.length != 0) {
        product = props.product;
        img_list = props.product.productImg.split(',')
        length = img_list.length
        price = (product.productPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    }

    const [imgIndex, setImgIndex] = useState(0)

    const [loading, setLoading] = useState(0)

    const cartClick = () => { 
        setLoading(1)
        setTimeout(()=>{
            setLoading(0) 
            addToCart(product, countCart) 
        }, 500)
        setCountCart(1)
    }

    return (
        <div className='ProductBody'>

            {/* breadcrumb */}
            <div className="product-breadcrumb flex">
                <Link className="breadcrumb-item breadcrumb-link" to='/'>Home</Link>
                <FontAwesomeIcon icon={faAngleRight} className="breadcrumb-arrow" />
                <div className="breadcrumb-item breadcrumb-product">{product.productName}</div>
            </div>

            <div className='product-detail flex'>

                <div className="product-gallery flex">
                    {product.productImg && img_list.map((item, index) => {
                        return (
                            imgIndex===index && 
                            <div className='product-big'
                            >
                                <div className='product-big-item'>
                                    <img src={item} ></img>
                                </div>
                            </div>
                        )
                    })}
                    <div
                        className="change-product left"
                        onClick={() => {
                            if (imgIndex == 0) setImgIndex(length - 1)
                            else setImgIndex(imgIndex - 1)
                        }}
                    >
                        <FontAwesomeIcon icon={faChevronLeft}></FontAwesomeIcon>
                    </div>

                    <div className="change-product right"
                        onClick={() => {
                            if (imgIndex == length - 1 ) setImgIndex(0)
                            else setImgIndex(imgIndex+1)
                        }}
                    >
                        <FontAwesomeIcon icon={faChevronRight}></FontAwesomeIcon>
                    </div>






                </div>

                <div className="product-info-detail">

                    <div className="product-info-title">
                        {product.productName}
                    </div>

                    <div className="product-info-des">
                        {product.productDescription}
                    </div>

                    <div className="product-info-price">
                        {price} Đ
                    </div>

                    <div className="product-info-cart flex">
                        <div className="count-cart ">
                            <div className="count-cart-item left flex-center"
                                onClick={() => {
                                    if (countCart > 1) setCountCart(countCart - 1)
                                }}
                            >
                                <FontAwesomeIcon icon={faMinus} />
                            </div>
                            <div className="count-cart-item text flex-center">
                                <form>
                                    <input
                                        type="text"
                                        value={countCart}
                                        onChange={(e) => {
                                            setCountCart(Number(e.target.value.replace(/\D+/g, '')))
                                        }}
                                    />
                                </form>
                            </div>
                            <div
                                className="count-cart-item right flex-center"
                                onClick={() => { setCountCart(countCart + 1) }}
                            >
                                <FontAwesomeIcon icon={faPlus} />
                            </div>


                        </div>
                            {loading === 1 &&
                                <div className="product-info-addtocart flex-center " onClick={cartClick} >
                                    <div className="loading-icon"></div>
                                </div>
                            }
                            {loading !== 1 &&
                                <div className="product-info-addtocart flex-center  " onClick={cartClick} >
                                    <FontAwesomeIcon icon={faCartPlus} />
                                    <p>Add to cart</p>
                                </div>
                            }
                        
                    </div>
                        <div className="product-info-line"></div>


                </div>

            </div>
            <div className="product-info-line"></div>          

        </div>
    );
};





export default ProductBody;
