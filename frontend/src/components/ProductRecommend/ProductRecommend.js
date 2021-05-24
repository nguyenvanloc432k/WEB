import React, { useEffect, useState } from 'react';
import Product from '../Product/Product'
import './ProductRecommend.css'
import '../../App.css'
import { withRouter } from 'react-router';
const ProductRecommend = (props) => {
    const [products, setProducts] = useState([])
    let productInfo = []
    if (props.product != 0) {
        productInfo = props.product;
    }
     
    useEffect(() => {
        fetch(`http://localhost:4000/products`)
          .then(response => response.json())
          .then(data => setProducts(data));
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

    const limitProducts = products.slice(0, 5)

    return (
        <div className="ProductRecommend">
            
            <div className="newsletter-container flex-center">
                <div className="newsletter-title">Related products</div>
                <div className="RecommendProduct">
                    {limitProducts.map(function (item, index) {
                        return (
                            <Product
                                check={props.check}
                                key={index}
                                product={item}
                                index={index}
                            />
                        )
                    })}
                </div>
            </div>
            <div className="product-info-line"></div>
        </div>
    );
};




export default withRouter(ProductRecommend);
