import './App.css';
import {BrowserRouter as Router, Route} from "react-router-dom"
import Home from './pages/Home'
import Product from "./pages/Product";
import { CartProvider } from './contexts/Cart'
import { UserProvider } from './contexts/User'
import ProductDetail from './components/ProductDetail/ProductDetail';
function App() {
  return (
    <UserProvider>
    <CartProvider>
      <Router>
      <div className="App">
          <Route path="/" exact component={Home}></Route>
          <Route path="/home" exact component={Home}></Route>
          <Route path="/product" exact component={Product}></Route>
          <Route path="/products/:id" exact component={ProductDetail}></Route>
      </div>
      </Router>
    </CartProvider>
    </UserProvider>
  );
}

export default App;
