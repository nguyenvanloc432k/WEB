import React, { useEffect, useState } from 'react';
import { withRouter  } from 'react-router-dom';
import './Banner.css';
import '../../App.css'
import classNames from 'classnames';


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
    


    return (
        <div className="Banner flex-center div100vh">
            <div className="banner-container">
                {/* dooi sang currentBanner khac là ẩn cái cũ */}
                {currentBanner===1 && 
                    <div className='banner-first flex-center'>
                    <div>
                        <div className={currentBanner === 1 ? "banner-title fadeInDown" : "banner-title"}>
                           UY TÍN
                        </div>
                    </div>
                    


                </div>
                }

                {currentBanner===2 &&
                    <div className='banner-second flex-center flex-col'>
                    
                    <div className={currentBanner === 2 ? "banner-title fadeInDown" : "banner-title"}>
                           CHẤT LƯỢNG
                    </div>


                </div>

                }
                {currentBanner===3 &&
                    <div className='banner-third flex-center flex-col'>
                    
                    <div className={currentBanner === 3 ? "banner-title fadeInDown" : "banner-title"}>
                           GIÁ ƯU ĐÃI
                    </div>



                </div>

                }
                
                

                

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