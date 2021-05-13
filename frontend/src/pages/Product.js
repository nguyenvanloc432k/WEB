
export default function Product(){
import Header from "../components/Header/Header";
import Banner from "../components/Banner/Banner";
import RecommendBanner from "../components/RecommendBanner/RecommendBanner";
import React, {useEffect, useState} from "react";
import axios from "axios";
import Newsletter from "../components/NewsLetter/NewsLetter";
import Footer from "../components/Footer/Footer";
import ProductFilter from "../components/Filter/ProductFilter";

export default function Product(){
    const [collection, setCollection] = useState([]);
    useEffect(() => {
        axios.get('http://localhost:4000/collection')
            .then(res => {
                setCollection(res.data)
            })
            .catch(function (err){
                console.log(err)
                // alert("Error connect to /collection")
            })
        window.scrollTo(0,0);
        document.body.style.overflow = 'unset'; // chua biet de lam gi
    }, [])

    var filterBrand = []
    fetch("http://localhost:4000/brand")
        .then(function (res){
            return res.json()
        })
        .then(function (brand){
                var filterBrandGet =  brand.map(function (br){
                    return {
                        id: br.brandID + 100,
                        name: br.brandName,
                        value: br.brandName
                    }
                })
                for(const b of filterBrandGet){
                    filterBrand.push(b)
                }
            }
        )
        .catch(function (err){
            alert("error occurred on call localhost:4000/brand")
        })
    return (
        <div>
            <Header/>
            <Banner collection={collection}/>
            <RecommendBanner/>
            <ProductFilter filterBrand = {filterBrand}/>
            {/*<Search/>*/}
            <Newsletter/>
            <Footer/>
        </div>
}