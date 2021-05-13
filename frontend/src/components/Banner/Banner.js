import React, { useEffect, useState } from 'react';
import classNames from 'classnames';
import { withRouter  } from 'react-router-dom';
import './Banner.css';
import '../../App.css'

// Banner.propTypes = {
//     collection: PropTypes.object,
// };

// Banner.defaultProps = {
//     collection: {}
// }

function Banner(props) {
    const [currentBanner, setCurrentBanner] = useState(1);
    const collection = props.collection;

    useEffect(() => {
        const slide = setInterval(() => {
            setCurrentBanner(currentBanner + 1);
        }, 3000)
        return () => {
            clearInterval(slide);
        };
    }, [currentBanner]); //cap nhat sau moi khi thay doi currentBanner

    if (currentBanner > 3) {
        setCurrentBanner(1);
    }
    // chưa chạy vì  có thể chưa xét path
    const redirect = (e) => {
        window.scrollTo(0, 0);
        props.history.push(`/collection/${e.target.id}`);
    }


    return (
        <div className="Banner flex-center div100vh">
            <div className="banner-container">
                {/* dooi sang currentBanner khac là ẩn cái cũ */}
                <div className={classNames('banner-first flex-center', {
                    hide: currentBanner !== 1
                })}>
                    <div>
                        <div className={currentBanner === 1 ? "banner-title fadeInDown" : "banner-title"}>
                            New Arrivals
                        </div>
                    </div>
                    {collection.length > 0 &&
                        <div className="flex-center">
                            
                                <div
                                    id={collection[7]._id}
                                    onClick={redirect}
                                    className={currentBanner === 1 ? "banner-link fadeInLeft" : "banner-link"}
                                >
                                    {collection[7].collectionName}
                            
                            </div>
                            
                                <div
                                    id={collection[0]._id}
                                    onClick={redirect}
                                    className={currentBanner === 1 ? "banner-link fadeInRight" : "banner-link"}>
                                    {collection[0].collectionName}
                                </div>
                            
                        </div>

                    }


                </div>

                <div className={classNames('banner-second flex-center flex-col', {
                    hide: currentBanner !== 2
                })} >
                    <div style={{ marginLeft: "-500px" }}>
                        {collection.length > 0 &&
                            <div>
                                <div className={currentBanner === 2 ? "banner-title fadeInDown" : "banner-title"} >
                                    {collection[1].collectionName}
                                </div>
                            </div>
                        }

                        {collection.length > 0 &&
                            <div>
                                
                                    <div
                                        id={collection[1]._id}
                                        onClick={redirect}
                                        className={currentBanner === 2 ? "banner-link fadeInUp" : "banner-link"} >
                                        Shop now
                                </div>
                                
                            </div>
                        }

                    </div>
                    {/* <div className={currentBanner === 2 ? "banner-title fadeInDown" : "banner-title"}>
                        New Arrivals
                    </div> */}



                </div>

                <div className={classNames('banner-third flex-center flex-col', {
                    hide: currentBanner !== 3
                })}>
                    {collection.length > 0 &&
                        <div>
                            <div className={currentBanner === 3 ? "banner-title fadeInDown" : "banner-title"}>
                                {collection[3].collectionName}
                            </div>
                        </div>
                    }
                    {collection.length > 0 &&
                        <div className="flex-center">
                            
                                <div
                                    id={collection[3]._id}
                                    onClick={redirect}
                                    className={currentBanner === 3 ? "banner-link fadeInUp" : "banner-link"}>
                                    Shop now
                                </div>
                            
                        </div>
                    }
                    {/* <div className={currentBanner === 3 ? "banner-title fadeInDown" : "banner-title"}>
                        New Arrivals
                    </div> */}



                </div>

            </div>

            {/* click chọn background */}
            <div className="choose-slide flex-center">
                <div
                    className={classNames('choose-line', {
                        choose_line_active: currentBanner === 1
                    })}
                    onClick={() => { setCurrentBanner(1) }}
                ></div>
                <div
                    className={classNames('choose-line', {
                        choose_line_active: currentBanner === 2
                    })}
                    onClick={() => { setCurrentBanner(2) }}
                ></div>
                <div
                    className={classNames('choose-line', {
                        choose_line_active: currentBanner === 3
                    })}
                    onClick={() => { setCurrentBanner(3) }}
                ></div>
            </div>

        </div>
    );
}

export default withRouter(Banner);