// import logo from './logo.svg';
import './App.css';
import Header from './components/Header/Header';
import FashionNews from "./components/Home/FashionNews/FashionNews";
import Footer from "./components/Home/Footer/Footer";
import Newsletter from "./components/Home/NewsLetter/NewsLetter";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <p>
          <FashionNews/>
            <Newsletter/>
            <Footer/>
        </p>
      </header>
    </div>
  );
}

export default App;
