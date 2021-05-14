import React from "react";
import Header from "../components/Header/Header";
import RecommendBanner from "../components/RecommendBanner/RecommendBanner";
import ProductFilter from "../components/Filter/ProductFilter";
import Footer from "../components/Footer/Footer";
import Newsletter from "../components/NewsLetter/NewsLetter";
import HomeTab from "../components/HomeTab/HomeTab";
import HomeTabContent from "../components/HomeTab/HomeTabContent";
export default function Product(){

    return (
        <div>
            <Header/>
            <RecommendBanner/>
            {/*<HomeTab/>*/}
            {/*<HomeTabContent/>*/}
            <ProductFilter
            />
            <Newsletter/>
            <Footer/>
        </div>
    )
}