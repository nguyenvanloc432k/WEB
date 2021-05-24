import React, {useState, useEffect} from "react";
import "../App.css"
import Newsletter from "../components/NewsLetter/NewsLetter";
import Footer from "../components/Footer/Footer";
import Header from "../components/Header/Header";
import Banner from "../components/Banner/Banner";
import ProductRecommend from "../components/ProductRecommend/ProductRecommend";
import ProductBody from "../components/ProductBody/ProductBody";

function Detail(props) {
    const [id, setId] = useState(1);

    const [ product, setProduct ] = useState([])

    useEffect(() => {
        document.body.style.overflow = 'unset'; // giup scroll
    })
    
    // lay dư lieu
    useEffect(() => {
        fetch('http://localhost:4000/products')
            .then(response => response.json())
             .then(data => {
                //  console.log(data)
                 setProduct(data[parseInt(parseInt(props.match.params.id) - 1)])
                 console.log(product)
             })
    },[])

    console.log(product)
    
    
    return (
        <div className="ProductDetail">
            <Header/>
            <Banner/>
            <ProductBody product={product}/>
            <ProductRecommend product={product}/>
            <Newsletter/>
            <Footer/>
        </div>
    )
}

export default Detail