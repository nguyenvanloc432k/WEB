import React, {useEffect, useState} from "react";
import Header from "../components/Header/Header";
import RecommendBanner from "../components/RecommendBanner/RecommendBanner";
import Footer from "../components/Footer/Footer";
import Newsletter from "../components/NewsLetter/NewsLetter";
import ProductFilter from "../components/Filter/ProductFilter";
import Banner from "../components/Banner/Banner";
export default function Product(){
    useEffect(() => {
        document.body.style.overflow = 'unset'; // chua biet de lam gi
    }, [])
    return (
        <div className="">
            <Header/>
            <Banner/>
            <RecommendBanner/>
            <ProductFilter/>
            <Newsletter/>
            <Footer/>
        </div>
    )
}