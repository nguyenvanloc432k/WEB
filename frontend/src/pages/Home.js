import React, {useState, useEffect} from "react";
import "../App.css"
import HomeTab from "../components/HomeTab/HomeTab"
import Banner from "../components/Banner/Banner";
import RecommendBanner from "../components/RecommendBanner/RecommendBanner";
import Newsletter from "../components/NewsLetter/NewsLetter";
import Footer from "../components/Footer/Footer";
import Header from "../components/Header/Header";

export default function Home() {
    useEffect(() => {
        document.body.style.overflow = 'unset'; // chua biet de lam gi
    }, [])
    
    return (
        <div className="Home">
            <Header/>
            <Banner/>
            <RecommendBanner/>
            <HomeTab/>
            <Newsletter/>
            <Footer/>
        </div>
    )
}