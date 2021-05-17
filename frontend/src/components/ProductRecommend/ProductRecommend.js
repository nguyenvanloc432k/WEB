import React, { useEffect, useState } from 'react';
import axios from 'axios'
import Product from '../Product/Product'
import './ProductRecommend.css'
import '../../App.css'
const ProductRecommend = (props) => {
    const [products, setProducts] = useState([])
    let productInfo = []
    if (props.product) {
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
        if (item.id !== productInfo.id) {
            if (item.productSex === productInfo.productSex) {
                if (item.productCate === productInfo.productCate &&
                    item.productGroupCate === productInfo.productGroupCate) {
                    recommendProducts.push(item)
                } else if (item.productGroupCate === productInfo.productGroupCate) {
                    recommendProducts.push(item)
                } else {
                    recommendProducts.push(item)
                }
            }
        }
        return null;
    })

    let recommendProducts2 = recommendProducts.filter(function (elem, index, self) {
        return index === self.indexOf(elem);
    })

    return (
        <div className="ProductRecommend">
            <div className="newsletter-container flex-center">
                <div className="newsletter-title">Related products</div>
                <div className="RecommendProduct">
                    {recommendProducts2.slice(0, 5).map(function (item, index) {
                        return (
                            <Product
                                key={index}
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
