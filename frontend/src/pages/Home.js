import React, {useState, useEffect} from "react";
import "../App.css"
import axios from 'axios';
import Collection from "../components/Home/Collection/Collection";
import HomeTab from "../components/Home/HomeTab/HomeTab"
import Banner from "../components/Home/Banner/Banner";
import RecommendBanner from "../components/Home/RecommendBanner/RecommendBanner";
import FashionNews from "../components/Home/FashionNews/FashionNews";
import Newsletter from "../components/Home/NewsLetter/NewsLetter";
import Footer from "../components/Home/Footer/Footer";

export default function Home() {
    const [collection, setCollection] = useState([]);
    useEffect(() => {
        axios.get('http://localhost:4000/collection')
            .then(res => {
                setCollection(res.data)
            })
        window.scrollTo(0,0);
        document.body.style.overflow = 'unset'; // chua biet de lam gi
    }, [])
    
    return (
        <div className="Home">
            <Banner/>
            <RecommendBanner/>
            <HomeTab/>
            <Collection
                collection={collection}
            />
            <FashionNews/>
            <Newsletter/>
            <Footer/>
        </div>
    )
}