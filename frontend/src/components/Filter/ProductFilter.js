import React, {useState} from "react";
import "./ProductFilter.css";

class ProductFilter extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            filterList: this.props.filterBrand,
            searchLists: [],
            activeFilter: []
        }
        console.log(this.props.filterBrand)
        console.log(this.state.filterList)
    }

    onFilterChange(filter){
        const {activeFilter} = this.state;

        if(activeFilter.includes(filter)){ //neu active filter bao gom filter click
            const filterIndex = activeFilter.indexOf(filter);
            const newFilter = [...activeFilter];
            newFilter.splice(filterIndex,1);
            this.setState({activeFilter: newFilter});
            //tra ra activefilter da loai bo filter
        }
        else {
            this.setState({ activeFilter: [...activeFilter, filter] });
        }
    }
    render() {
        const {filterList, activeFilter} = this.state;
        let filteredList; // list sau khi filter tu activefilter

        if(activeFilter.length === 0 || activeFilter.length === filterList.length){
            filteredList = this.state.searchLists;
        }
        else {
            filteredList = this.state.searchLists.filter(item =>
                this.state.activeFilter.includes(item.brand)
            )
        }

        //ta co filteredList => hien thi
        return(
            <div>
                <form>
                    {this.state.filterList.map(filter => (
                        <React.Fragment>
                            <label htmlFor={filter.id}>{filter.name}</label>
                            <input
                                id={filter.id}
                                type="checkbox"
                                checked={activeFilter.includes(filter.value)}
                                onClick={() => this.onFilterChange(filter.value)}
                            />
                        </React.Fragment>
                    ))}
                </form>
                <ul style={{ marginLeft: "70px" }}>
                    {filteredList.map(item => (
                        <div key={item.id}>
                            <li>
                                {item.name} -- {item.brand}
                            </li>
                        </div>
                    ))}
                </ul>
            </div>
        )
    }
}

export default ProductFilter;