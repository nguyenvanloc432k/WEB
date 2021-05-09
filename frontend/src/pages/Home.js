import React, {useState, useEffect} from "react";
import "../App.css"
import axios from 'axios';
import Collection from "../components/Collection/Collection";
import HomeTab from "../components/HomeTab/HomeTab"
import Banner from "../components/Banner/Banner";
import RecommendBanner from "../components/RecommendBanner/RecommendBanner";
import FashionNews from "../components/FashionNews/FashionNews";
import Newsletter from "../components/NewsLetter/NewsLetter";
import Footer from "../components/Footer/Footer";
import Header from "../components/Header/Header";
import Header2 from "../components/Header/Header";

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
            <Header/>
            <Banner collection={collection}/>
            <RecommendBanner/>
            <HomeTab/>
            <Collection
                collection={collection}
            />
            {/*<FashionNews/>*/}
            <Newsletter/>
            <Footer/>
        </div>
    )
}