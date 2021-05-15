import React, {PureComponent} from "react";
import "./ProductFilter.css";
import HomeTabContent from "../HomeTab/HomeTabContent";
import ProductList from "./ProductList";

class ProductFilter extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
            filterRamList: [
                {
                    ramId: 4+100,
                    ramName: "4 GB",
                },
                {
                    ramId: 8+100,
                    ramName: "8 GB"
                }
            ],
            filterBrandList : [],
            productList : [],
            activeFilter : []
        }
    }


    //chu ys:
    //0 < brandid < 100
    //100 < ramid < 1000
    //1000 < ssd id < 10000
    //10000 < cpu id < 10100
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
        const {activeFilter } = this.state;
        if (activeFilter.includes(filter)) {
            const filterIndex = activeFilter.indexOf(filter);
            const newFilter = [...activeFilter];
            newFilter.splice(filterIndex, 1);
            this.setState({ activeFilter: newFilter });
        } else {
            this.setState({ activeFilter: [...activeFilter, filter] });
        }
    }

    render() {
        const { filterRamList,filterBrandList, activeFilter, productList } = this.state;
        let filteredList = productList; //day la list da tim kiem hoan tat
        if(activeFilter.length > 0){ //neu co 1 filter trong active filter
            let activeBrandFilter = activeFilter.filter(i => (
                i > 0 && i < 100
            )) //cac id cua brandfilter

            let activeRamFilter = activeFilter.filter(i => (
                i > 100 && i < 1000
            )) //cac id cua ram filter

            if(activeBrandFilter.length > 0){ // neu co >= 1 filter brand thi se loc; neu khong co coi nhu loc tat ca brand
                filteredList = filteredList.filter(item =>
                    (
                        productList.filter(item => activeFilter.includes(item.brandID))
                            .includes(item)
                    )
                )
            }
            if(activeRamFilter.length > 0){
                filteredList = filteredList.filter(item =>
                    (
                        productList.filter(item => activeFilter.includes(item.productRAM + 100))
                            .includes(item)
                    )
                )
            }
        }

        let filterflow = filterBrandList.filter(filter => (
                activeFilter.includes(filter.brandID)
            )
        ).concat(
            filterRamList.filter(filterR => (
                    activeFilter.includes(filterR.ramId)
                )
            )
        )
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
                    <br/>
                    <br/>
                    <div className="filter-title">Dung lượng RAM</div>
                    <div className="filter-list">
                        {filterRamList.map(filter => (
                            <div className="filter-items">
                                <input
                                    className="input-filter"
                                    id={filter.ramId}
                                    type="checkbox"
                                    defaultChecked={activeFilter.includes(filter.ramId)}
                                    onClick={() => this.onFilterBrandChange(filter.ramId)}
                                />
                                <label htmlFor={filter.ramId} className="label-filer">{filter.ramName}</label>
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
                                    filterflow.map((filter,index) => (
                                        <span className="span-title span-title-filterflow" key={index}>
                                            {filter.brandName}{filter.ramName}
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