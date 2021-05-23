import React, { useEffect, useState } from 'react';
import axios from 'axios'
import Product from '../Product/Product'
import './ProductRecommend.css'
import '../../App.css'
const ProductRecommend = (props) => {
    const [products, setProducts] = useState([])
    let productInfo = []
    if (props.product != 0) {
        productInfo = props.product;
    }
    useEffect(() => {
        axios.get(`http://localhost:4000/products`)
            .then(res => {
                setProducts(res.data)
            }
            )
    }, [])

    const recommendProducts = [];

    products.filter((item) => {
        if (item.productID !== productInfo.productID) {
            if (Math.abs(item.productPrice -  productInfo.productPrice) < 2000000) {
                recommendProducts.push(item)
            }
        }
        return null;
    })

    //push cho du 5 phan tu
    if (recommendProducts.length < 6){
        products.filter((item) => {
            if (recommendProducts.length < 6){
                recommendProducts.push(item)
            }
            else return
        })
    }

    console.log("length: "+recommendProducts.length)

    return (
        <div className="ProductRecommend">
            
            <div className="newsletter-container flex-center">
                <div className="newsletter-title">Related products</div>
                <div className="RecommendProduct">
                    {recommendProducts.slice(0, 5).map(function (item) {
                        return (
                            <Product
                                product={item}
                            />
                        )
                    })}
                </div>
            </div>
            <div className="product-info-line"></div>
        </div>
    );
};




export default ProductRecommend;
