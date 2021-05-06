import React, {useState, useEffect} from "react";
import "../App.css"
import axios from 'axios';
import Collection from "../components/Home/Collection/Collection";
import HomeTab from "../components/Home/HomeTab/HomeTab"

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
            <HomeTab/>
            <Collection
                collection={collection}
            />
        </div>
    )
}