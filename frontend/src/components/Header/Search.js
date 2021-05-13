import React, {useContext, useEffect, useState} from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import axios from 'axios'
import { faCartPlus, faCheckCircle, faSearch, faTimes } from '@fortawesome/free-solid-svg-icons';
import './Search.css'
import '../../App.css'


export default function Search(props) {
    const [products, setProducts] = useState([])
    const [searchInput, setSearchInput] = useState("")

    useEffect(() => {
        axios.get(`http://localhost:4000/products`)
            .then(res => {
                setProducts(res.data)
            })
    }, [])

    const search = (event) => {
        const value = event.target.value
        setSearchInput(value)
        const search = []
        for (let i in products) {
            if ((products[i].productName).toLowerCase().includes(searchInput)) {
                search.push(products[i])
            }
        }
        setProducts(search)
    }

    return (
        <div class={props.searchOpen === true ? 'Search' : 'Search displayNone'}>
           
            <div className="search-header">
                <div className="search-title">Search</div>
                <div
                    className="search-close"
                    onClick={props.clickToClose}
                >
                    <FontAwesomeIcon icon ={faTimes} className="icon"/>
                </div>
            </div>

            <div>
                <div className={props.searchOpen === false ? '' : 'fadeIn'}>
                    <div className="search-form">
                        <form className="flex">
                            <FontAwesomeIcon icon={faSearch} className="icon"/>
                            <input
                                placeholder="Search"
                                onChange={search}
                                value={searchInput}
                            />
                        </form>
                    </div>

                    {
                        (products.length > 0 && searchInput !== "") &&
                        products.map((item, index) => {
                            return (
                                                        
                            )
                        })
                    }
                </div>
            </div>
        </div>
    )
}