import React, {PureComponent} from "react";
import "./ProductFilter.css";
import HomeTabContent from "../HomeTab/HomeTabContent";
import ProductList from "./ProductList";

class ProductFilter extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
            filterBrandList : [],
            productList : [],
            activeFilter : []
        }
    }

    async componentDidMount(){
        await fetch("http://localhost:4000/brand")
            .then(res => res.json())
            .then((brand) =>{
                this.setState({filterBrandList:brand})
            })
            .catch(console.log)
        await fetch("http://localhost:4000/products")
            .then(res=>res.json())
            .then((products) => {
                this.setState({productList: products})
            })
            .catch(console.log)
    }

    onFilterBrandChange(filter) {
        const { filterBrandList, activeFilter } = this.state;
        if (filter === "ALL") {
            if (activeFilter.length === filterBrandList.length) {
                this.setState({ activeFilter: [] });
            } else {
                this.setState({ activeFilter: filterBrandList.map(filter => filter.brandID) });
            }
        } else {
            if (activeFilter.includes(filter)) {
                const filterIndex = activeFilter.indexOf(filter);
                const newFilter = [...activeFilter];
                newFilter.splice(filterIndex, 1);
                this.setState({ activeFilter: newFilter });
            } else {
                this.setState({ activeFilter: [...activeFilter, filter] });
            }
        }
    }

    render() {
        const { filterBrandList, activeFilter, productList } = this.state;
        let filteredList;
        if (
            activeFilter.length === 0 ||
            activeFilter.length === filterBrandList.length
        ) {
            filteredList = productList;
        } else {
            filteredList = productList.filter(item =>
                activeFilter.includes(item.brandID)
            );
        }
        let filterBrandflow = filterBrandList.filter(filter => (
            activeFilter.includes(filter.brandID)
        ))
        console.log(filterBrandflow)
        return (
            <div className="Product-Filter">
                <div className="col-3 p-0 p-r-30">
                    <div className="filter-title">Hãng sản xuất</div>
                    <div className="filter-list">
                        {filterBrandList.map(filter => (
                            <div className="filter-items">
                                <input
                                    className="input-filter"
                                    id={filter.brandID}
                                    type="checkbox"
                                    defaultChecked={activeFilter.includes(filter.brandID)}
                                    onClick={() => this.onFilterBrandChange(filter.brandID)}
                                />
                                <label htmlFor={filter.brandID} className="label-filer">{filter.brandName}</label>
                            </div>
                        ))}
                    </div>
                </div>
                <div className="col-9">
                    <div className="product-filter-header">
                        <div className="product-filter-header-title">
                            <div className="product-filter-header-setflex">
                                <h1 className="product-filter-header-title-setfont">Laptop</h1>
                                <span className="span-title">:   ({filteredList.length} sản phẩm) </span>
                            </div>
                        </div>

                        <div className="product-filter-header-tag">
                            <div className="product-filter-header-setflex">
                                <span className="span-title">Lọc theo:</span>
                                {
                                    filterBrandflow.map(filter => (
                                        <span className="span-title span-title-filterflow" key={filter.brandID}>
                                            {filter.brandName}
                                        </span>
                                    ))
                                }
                            </div>
                        </div>
                    </div>
                    <div className="product-filter-header">
                        <ProductList
                            products = {filteredList}
                        />
                    </div>
                </div>
            </div>
        );
    }
}
export default ProductFilter;