import logo from './logo.svg';
import './App.css';
// import Header from './components/Header/Header';
// import FashionNews from "./components/Home/FashionNews/FashionNews";
// import Footer from "./components/Home/Footer/Footer";
import Newsletter from "./components/Home/NewsLetter/NewsLetter";
import Banner from './components/Home/Banner/Banner';
import { useEffect, useState } from 'react';
import axios from 'axios';
import RecommendBanner from './components/Home/RecommendBanner/RecommendBanner';

function App() {
  const [collection, setCollection] = useState([]);
  useEffect(() => {
    axios.get(`http://localhost:4000/collection`)
         .then(res => {
           setCollection(res.data)
         })
    window.scrollTo(0, 0);
    document.body.style.overflow = 'unset';
    
  }, []);

  return (
    <div className="App">
      {/* <header className="App-header"> */}
        {/* <p> */}
          
          {/* <FashionNews/> */}
            {/* <Newsletter/> */}
            {/* <Footer/> */}
          <Banner collection={collection}/>
          <RecommendBanner/>
          {/* <Recom */}
        {/* </p> */}
      {/* </header> */}
    </div>
  );
}

export default App;
