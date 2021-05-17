import React, { useEffect, useRef, useState } from 'react';
import '../../App.css'
import './ProductBody.css'
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faAngleRight, faCartPlus, faChevronLeft, faChevronRight, faHeart, faMinus, faPlus } from "@fortawesome/free-solid-svg-icons";
import classNames from 'classnames';
// import ReactStars from "react-rating-stars-component";

const ProductBody = (props) => {


    function slugify(str) {
        str = str.replace(/^\s+|\s+$/g, ''); // trim
        str = str.toLowerCase(); // doi chu hoa thanh chu thuong

        // doi ki tu co dau thanh k dau
        var from = "ãàáäâẽèéëêìíïîõòóöôùúüûñç·/_,:;";
        var to = "aaaaaeeeeeiiiiooooouuuunc------";
        for (var i = 0, l = from.length; i < l; i++) {
            str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
        }

        str = str.replace(/[^a-z0-9 -]/g, '') //  bo cac ki tu k hop le
            .replace(/\s+/g, '-') //  bo khoang trang thay bang dau -
            .replace(/-+/g, '-'); // thu gon dau -

        return str;    // Trim - from end of text
    }

    const [countCart, setCountCart] = useState(1)

    const productSmall = useRef(null)
    const sliderWidth = useRef(null)


    let slugSex = ''
    let product = ""
    let link = ''
    let price = ''
    let length = 0
    if (props.product) {
        product = props.product;
        slugSex = "/" + slugify(product.productSex === 'Woman' ? 'Women' : 'Men');
        link = product.productSex
        length = props.product.productImg.length
        price = (product.productPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    }





    const [imgIndex, setImgIndex] = useState(0)

    // useEffect(() => {
    //     const slide = setInterval(() => {
    //         setImgIndex(imgIndex + 1);
    //     }, 3000)
    //     return () => {
    //         clearInterval(slide)
    //     }
    // }, [imgIndex])

    if (imgIndex >= 4) {
        setImgIndex(0)
    }
    const [loading, setLoading] = useState(0)

    const cartClick = () => { 
        setLoading(1)
        setTimeout(()=>{
            setLoading(0) 
            // addToCart(product, countCart) 
        }, 500)
        setCountCart(1)
    }


    return (
        <div className='ProductBody'>

            {/* breadcrumb */}
            <div className="product-breadcrumb flex">
                <Link className="breadcrumb-item breadcrumb-link" to='/'>Home</Link>
                <FontAwesomeIcon icon={faAngleRight} className="breadcrumb-arrow" />
                <Link to={slugSex} className="breadcrumb-item breadcrumb-link" >{link} </Link>
                <FontAwesomeIcon icon={faAngleRight} className="breadcrumb-arrow" />
                <div className="breadcrumb-item breadcrumb-product">{product.productName}</div>
            </div>

            <div className='product-detail flex'>

                <div className="product-gallery flex">


                    {product.productImg && product.productImg.map((item, index) => {
                        return (
                            <div className={classNames('product-big', {
                                hide: imgIndex !== index
                            })}
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
                            if (imgIndex == 0) setImgIndex(3)
                        }}
                    >
                        <FontAwesomeIcon icon={faChevronLeft}></FontAwesomeIcon>
                    </div>

                    <div className="change-product right"
                        onClick={() => {
                            if (imgIndex < product.productImg.length && product.productImg.length) setImgIndex(imgIndex + 1)
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
                        {product.productDes}
                    </div>

                    <div className="product-info-price">
                        {price} Đ
                    </div>

                    <div className="product-info-cart flex">
                        <div className="count-cart noselect">
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
                                <div className="product-info-addtocart flex-center btn" onClick={cartClick} >
                                    <div className="loading-icon"></div>
                                </div>
                            }
                            {loading !== 1 &&
                                <div className="product-info-addtocart flex-center btn" onClick={cartClick} >
                                    <FontAwesomeIcon icon={faCartPlus} />
                                    <p>Add to cart</p>
                                </div>
                            }
                        {/* <div className="product-info-line"></div>
                        <div className="product-info-cate flex">
                            <p>Category:</p>
                            <p>{product.productCate}</p>
                        </div>
                        <div className="product-info-line"></div> */}
                    </div>
                        <div className="product-info-line"></div>


                </div>

            </div>
            <div className="product-info-line"></div>            

        </div>
    );
};





export default ProductBody;
