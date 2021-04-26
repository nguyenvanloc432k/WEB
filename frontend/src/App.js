import logo from './logo.svg';
import './App.css';
import Header from './components/Header/Header';
import FashionNews from "./components/Home/FashionNews/FashionNews";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <p>
          <FashionNews/>
        </p>
      </header>
    </div>
  );
}

export default App;
