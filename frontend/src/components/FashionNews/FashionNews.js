import React, {useEffect, useState} from 'react';
import classNames from 'classnames'
import axios from 'axios'
import './FashionNew.css'
export default function FashionNews(props) {
    const [news, setNews] = useState([]); //khoi tao state new la rong va phuong thuc setNew
    const [currentPage, setCurrentPage] = useState(1); // khoi tao page hien tai la 1 va phuong thuc setPage
    const newsPerPage = 3; //hien thi 3 trang de lua chon

    useEffect(() => {
        axios.get(`http://pe.heromc.net:4000/news`) // truy cap API lay cac news ve va gan cho state new
            .then(res => {
                setNews(res.data)
            }
        )
    },[]) // useEffect voi []

    const choosePage = (event) => { // ham lay id tu event choosePage sau do set cho currentPage
        if (Number(event.target.id) === 0) {
            setCurrentPage(currentPage)
            //hien tai
        }
        else if (Number(event.target.id) === -1) {
            //lui
            // alert(Number(event.target.id))
            if (currentPage > 1) {
                setCurrentPage(currentPage - 1)
            } else {
                setCurrentPage(1);
            }
        }
        else if (Number(event.target.id) === 999) {
            //tien
            // alert(Number(event.target.id))
            setCurrentPage(currentPage + 1)
        }
        else {
            setCurrentPage(Number(event.target.id))
        }
    }

    const indexOfLastNews = currentPage * newsPerPage; // 1 trang thi co 3 new => vi tri new cuoi cua trang hien tai
    const indexOfFirstNews = indexOfLastNews - newsPerPage; // vi tri news dau cua trang hien tai
    const currentNews = news.slice(indexOfFirstNews, indexOfLastNews); // lay ra cac new de hien thi
    const pageNumbers = [];// so cac trang co the
    for (let i = 1; i <= Math.ceil(news.length / newsPerPage); i++) {
        pageNumbers.push(i);
    }

    const pages = [];

    if (currentPage === 2) {
        pages.push(currentPage - 1, currentPage, currentPage + 1); // push trang 1, 3 thanh  <- 1 2 3 ->
    } else {
        if (currentPage === 1) {
            pages.push(currentPage, currentPage + 1, currentPage + 2 );
        } else if (currentPage === 2) {
            pages.push(currentPage - 1, currentPage, currentPage + 1);
        } else if (currentPage > 2 && currentPage < pageNumbers.length - 1) {
            pages.push(currentPage -1, currentPage, currentPage + 1);
        } else if (currentPage === pageNumbers.length - 1){
            pages.push(currentPage - 1, currentPage, currentPage + 1);
        } else {
            pages.push(currentPage - 2, currentPage - 1, currentPage);
        }
    }

    return(
        <div className="FashionNews">
            <div className="news-container">
                <div className="news-title">Fashion News</div>
                <div className="news-box">
                    { currentNews.map(function(item, index) {
                        return (
                            <div>
                                This is News
                            </div>
                        )                        
                    })}
                </div>
                <div className="pagination-container flex-center">
                    <div className="pagnigation flex-center" onClick={choosePage}>
                        <div id="-1" className={classNames({
                            pagnigation_disable: currentPage === 1
                        })}>←</div>
                        { pages.map(function(number, index) { 
                            if (currentPage === number) {
                                return (
                                    <div key={number} id={number} className="pagnigation-active">
                                        {number}
                                    </div>
                                )
                            } else {
                                return (
                                <div 
                                    key={number}
                                    id={number}
                                    >
                                        {number}
                                </div>
                                )
                            } 
                        })}
                        <div id="999" className={classNames({
                            pagnigation_disable: currentPage === pageNumbers.length
                        })}>→</div>
                    </div>
                </div>
                <div className="news-line"></div>
            </div>
        </div>
    )
}