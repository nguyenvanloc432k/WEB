import React from 'react'
import { withRouter } from 'react-router-dom';
import "../../style/Collection.css"

function Collection(props) {

    const redirect = (e) => {
        window.scrollTo(0,0);
        props.history.push(`/collection/${e.target.id}`)
    }

    return(
        <div className="Collection">
            {
                props.collection.length > 0 &&
                <div className="collection-container">
                    <div className="collection-box">
                        <img src="https://demo.uix.store/sober/wp-content/uploads/sites/2/2016/09/woman.jpg" alt=""></img>
                        <div className="collection-overlay flex-center">
                            <div className="collection-title">
                                {props.collection[0].collectionName.toLowerCase()}
                            </div>
                            <div
                                id={props.collection[0]._id}
                                className="collection-link"
                                onClick={redirect}>
                                    Discover Now
                            </div>
                        </div>
                    </div>
                    <div className="collection-box">
                        <img src="https://demo.uix.store/sober/wp-content/uploads/sites/2/2016/09/woman.jpg" alt=""></img>
                        <div className="collection-overlay flex-center">
                            <div className="collection-title">
                                {props.collection[1].collectionName.toLowerCase()}
                            </div>
                            <div
                                id={props.collection[1]._id}
                                className="collection-link"
                                onClick={redirect}>
                                    Discover Now
                            </div>
                        </div>
                    </div>        
                </div>
            }
        </div>
    )
}
export default withRouter(Collection)