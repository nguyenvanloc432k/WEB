import React, {useState} from 'react'
import '../../App.css'
import '../../style/Product.css'
import {withRouter} from 'react-router-dom'
import a from "../../images/e1e5625dfdf7a348d12bbabe915b842a"
import b from "../../images/75d77a60dd07209eb9a9128b54f40fa7"

function Product(props) {
    const [hover, setHover] = useState(false)   //để css
    const [view, setView] = useState(false) //
    const product = props.product

    const closeView = () => {
        document.body.style.overflow = 'unset'
        setView(false)
    }
    const openView = () => {
        setView(true)
    }
    if (view) {
        document.body.style.overflow = 'hidden' // disable scroll
    }

    const redirect = () => {    // sự kiện chuột, chuyển hướng trang đến /products/:id
        window.scrollTo(0,0)
        props.history.push(`/products/${product._id.$oid}`);
    }

    let productDate = new Date(product.productDate)
    let today = new Date()
    let productFinalPrice = product.productPrice * (100-product.productSale) / 100

    return (
        <div
            className="Product"
        >
            {/* <ProductQuickView
                view={view}
                closeView={closeView}
                product={product}
            /> */}
            <div
                className="product-img"

                onMouseOver={() => setHover(true)}
                onMouseOut={() => setHover(false)}
            >
                <div className="product-tag">
                    {
                        product.productSale > 0 && <div className="product-tag-item sale">
                            {product.productSale}%
                        </div>
                    }
                    {
                        product.productSold > 40 && <div className="product-tag-item hot">
                            HOT
                        </div>
                    }
                    {
                        (today - productDate)/(1000*3600*24) < 10 && <div className="product-tag-item new">
                            NEW
                        </div>
                    }
                </div>
                <div
                    className="product-img-bg"
                    onClick={redirect}
                >
                    <img
                        className=""
                        src={a} alt=""
                    ></img>
                    <img
                        className={hover === false ? "img-default hide" : "img-default"}
                        src={b} alt=""
                    ></img>

                </div>
                {/* <ProductOverlay
                    product={product}
                    openView={openView}
                /> */}
            </div>
            <div className="product-title">
                {product.productName}
            </div>
            {
                product.productSale > 0 &&
                <div className="product-price flex-center">
                    <p style={{textDecoration:'line-through',color:'#777',marginRight:'10px'}}>
                        {product.productPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,".")} Đ
                    </p>
                    <p>
                        {productFinalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,".")} Đ
                    </p>
                </div>
            }
            {
                product.productSale === 0 &&
                <div className='product-price'>
                    <p>
                        {productFinalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,".")} Đ
                    </p>
                </div>
            }
        </div>
    )

}
export default withRouter(Product)