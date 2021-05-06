import './App.css';
import {BrowserRouter as Router, Route} from "react-router-dom"
import Home from './pages/Home'
function App() {
  return (
    <Router>
      <div className="App">
        <Route path="/" exact component={Home}></Route>
        <Route path="/home" exact component={Home}></Route>
      </div>
    </Router>
  );
}

export default App;
