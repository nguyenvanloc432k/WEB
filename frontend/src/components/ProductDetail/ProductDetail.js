import axios from 'axios';
import React, { useEffect, useState } from 'react';
import Footer from '../Footer/Footer';
import Header from '../Header/Header';
import Newsletter from '../NewsLetter/NewsLetter';
import ProductBody from '../ProductBody/ProductBody';
import ProductRecommend from '../ProductRecommend/ProductRecommend';


function ProductDetail(props)    {

   const [products, setProducts] = useState();
   

   const handleClick = () => {
       
   }

   let id = props.id
    useEffect(() => {
        window.scrollTo(0, 0)
        document.body.style.overflow = 'unset'

        axios.get(`http://localhost:4000/products/`)
             .then(res => {
                 setProducts(res.data[parseInt(parseInt(id) - 1)])
                 console.log(products)
             })
    }, [])

    return (
        <div className="ProductDetail">

        
            <ProductBody
                product={products}
                scrollOnclick={handleClick}
            />
            <ProductRecommend product={products}/>
            

        </div>
    );
};





export default ProductDetail;
