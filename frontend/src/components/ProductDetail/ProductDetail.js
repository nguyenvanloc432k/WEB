import axios from 'axios';
import React, { useEffect, useState } from 'react';
import Footer from '../Footer/Footer';
import Header from '../Header/Header';
import Newsletter from '../NewsLetter/NewsLetter';
import ProductBody from '../ProductBody/ProductBody';


function ProductDetail(props)    {

   const [products, setProducts] = useState();
   
   const [tabId, settabId] = useState(0);

   const handleClick = () => {
       
   }


    useEffect(() => {
        window.scrollTo(0, 0)
        document.body.style.overflow = 'unset'

        axios.get(`http://localhost:4000/products/`)
             .then(res => {
                 setProducts(res.data[parseInt(parseInt(props.match.params.id) - 1)])
                 console.log(products)
             })
    }, [props.match.params.id])

    return (
        <div className="ProductDetail">
            <Header />
            
            <ProductBody
                product={products}
                scrollOnclick={handleClick}
            />
            <Newsletter />           
            <Footer />

        </div>
    );
};





export default ProductDetail;
