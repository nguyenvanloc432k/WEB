import React, {PureComponent} from "react";
import "./ProductFilter.css";
import HomeTabContent from "../HomeTab/HomeTabContent";
import ProductList from "./ProductList";

class ProductFilter extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
            filterRamList: [],
            filterBrandList : [],
            filterSsdList: [],
            filterCpuList: [],
            filterPriceList: [
                {
                    priceId: 1+100000,
                    priceName: "Dưới 10 triệu",
                    priceMinRange: 1,
                    priceMaxRange: 10000000
                },
                {
                    priceId: 2+100000, // day vao activefilter
                    priceName: "Từ 10 - 20 triệu",
                    priceMinRange: 10000000,
                    priceMaxRange: 20000000,
                },
                {
                    priceId: 3+100000,
                    priceName: "Từ 20 - 30 triệu",
                    priceMinRange: 20000000,
                    priceMaxRange: 30000000
                },
                {
                    priceId: 4 + 100000,
                    priceName: "Trên 30 triệu",
                    priceMinRange: 30000000,
                    priceMaxRange: 30000000*5
                }

            ],
            productList : [],
            activeFilter : []
        }
    }


    //chu ys:
    //0 < brandid < 100
    //100 < ramid < 1000
    //1000 < ssd id < 10000
    //10000 < cpu id < 10100
    //lấy dữ liệu bằng componentDidMount
    async componentDidMount(){
        //lay du lieu brand
        await fetch("http://localhost:4000/brand")
            .then(res => res.json())
            .then((brand) =>{
                this.setState({filterBrandList:brand})
            })
            .catch(console.log)
        //lay du lieu product
        await fetch("http://localhost:4000/products")
            .then(res=>res.json())
            .then((products) => {
                this.setState({productList: products})
            })
            .catch(console.log)
        //lay du lieu ram
        await fetch("http://localhost:4000/products/attr/RAM")
            .then(res => res.json())
            .then((ram) =>{
                let ramlist = ram.map(function(RAM){
                    return {
                        ramId: RAM + 100,
                        ramName: RAM + " GB"
                    }
                });
                this.setState({filterRamList: ramlist})
            })
//      lấy các loại ssd
        await fetch("http://localhost:4000/products/attr/SSD")
            .then(res => res.json())
            .then((ssd) =>{
                let ssdlist = ssd.map(function(SSD){
                    return {
                        ssdId: SSD + 1000,
                        ssdName: SSD + " GB"
                    }
                });
                let ssdTBindex = ssdlist.findIndex(ssd => ssd.ssdId == 1001)
                ssdlist[ssdTBindex].ssdName = 1+" TB"
                this.setState({filterSsdList: ssdlist})
            })
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
        const {filterPriceList, filterSsdList,filterRamList,filterBrandList, activeFilter, productList } = this.state;
        let filteredList = productList; //day la list da tim kiem hoan tat
        if(activeFilter.length > 0){ //neu co 1 filter trong active filter
            let activeBrandFilter = activeFilter.filter(i => (
                i > 0 && i < 100
            )) //cac id cua brandfilter

            let activeRamFilter = activeFilter.filter(i => (
                i > 100 && i < 1000
            )) //cac id cua ram filter

            let activeSsdFilter = activeFilter.filter(i => (
                i > 1000 && i < 10000
            )) //cac id cua ssd filter

            let activePriceFilter = activeFilter.filter(i => (
                i.priceId > 100000 && i.priceId < 1000000
            )) //cac id cua price filter

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
            if(activeSsdFilter.length > 0){
                filteredList = filteredList.filter(item =>
                    (
                        productList.filter(item => activeFilter.includes(item.productSSD + 1000))
                            .includes(item)
                    )
                )
            }
            if(activePriceFilter.length > 0){
                filteredList = filteredList.filter(item =>
                    (
                        productList.filter(
                            item => (
                                activePriceFilter.some(
                                    (price) => (
                                        price.priceMinRange < item.productPrice &&
                                            price.priceMaxRange > item.productPrice
                                    )
                                )
                            )
                        )
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
        ).concat(
            filterSsdList.filter(filterS => (
                    activeFilter.includes(filterS.ssdId)
                )
            )
        ).concat(
            filterPriceList.filter(filterP => (
                activeFilter.includes(filterP)
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
                                <label htmlFor={filter.brandID} className="label-filter">{filter.brandName}</label>
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
                                <label htmlFor={filter.ramId} className="label-filter">{filter.ramName}</label>
                            </div>
                        ))}
                    </div>
                    <br/>
                    <br/>
                    <div className="filter-title">Dung lượng SSD</div>
                    <div className="filter-list">
                        {filterSsdList.map(filter => (
                            <div className="filter-items">
                                <input
                                    className="input-filter"
                                    id={filter.ssdId}
                                    type="checkbox"
                                    defaultChecked={activeFilter.includes(filter.ssdId)}
                                    onClick={() => this.onFilterBrandChange(filter.ssdId)}
                                />
                                <label htmlFor={filter.ssdId} className="label-filter">{filter.ssdName}</label>
                            </div>
                        ))}
                    </div>
                    <br/>
                    <br/>
                    <div className="filter-title">Dung lượng RAM</div>
                    <div className="filter-list">
                        {filterPriceList.map(filter => (
                            <div className="filter-items">
                                <input
                                    className="input-filter"
                                    id={filter.priceId}
                                    type="checkbox"
                                    defaultChecked={activeFilter.includes(filter)}
                                    onClick={() => this.onFilterBrandChange(filter)}
                                />
                                <label htmlFor={filter.priceId} className="label-filter">{filter.priceName}</label>
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
                                            {filter.brandName}{filter.ramName}{filter.ssdName}{filter.priceName}
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