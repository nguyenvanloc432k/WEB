import React, { useEffect, useState } from "react";
import "../../../App.css";
import "./HomeTab.css"
import HomeTabContent from "./HomeTabContent.js";
import axios from "axios";

// HINH NHU HEIGHT NO CODE SAI

export default function HomeTab() {
  const [currentTab, setCurrentTab] = useState(1); // luu state tab hien tai, khoi tao la tab 1 - best seller
  const [isActive, setIsActive] = useState(1); // hinh nhu la thua, vi isActive = currentTab
  const [products, setProducts] = useState([]); // mang chua danh sach san pham

  useEffect(() => {
    axios
      .get(`http://localhost:4000/products`) // lay ve danh sach san pham
      .then((res) => {
        setProducts(res.data); // set state cho products
      });
    return () => {
      // k can cleanup
    };
  }, []); // chay dung 1 lan sau khi duoc render lan dau

  //Get product sold
  let height = 550;
  if (products.length) {
    products.sort((a, b) => b.productSold - a.productSold);
    if (products.length <= 5) {
      height = 260; // chi 1 dong san pham
    }
  }

  //Get product by date
  const today = new Date();
  let dateProduct = [];
  if (products.length) {
      dateProduct = [...products]
      .sort((a, b) => new Date(b.productDate) - new Date(a.productDate)) 
      .filter((v) => {
        if ((today - new Date(v.productDate)) / (1000 * 3600 * 24) < 10) {
          // lay nhung san pham moi trong 10 ngay
          return true;
        } else {
          return false;
        }
      });
  }

  //Get product selling
  const sellingProduct = [];
  if (products.length) {
    for (let i = 0; i < products.length; i++) {
      if (Number(products[i].productSale) > 0) {
        sellingProduct.push(products[i]);
      }
    }
    if (sellingProduct.length <= 5) {
      height = 360;
    }
  }

  return (
    <div className="HomeTab">
      <div className="home-tab flex-center">
        <p
          onClick={() => {
            setCurrentTab(1);
            setIsActive(1);
          }}
          className={isActive === 1 ? "home-tab-active" : ""}
        >
          Best Sellers
        </p>
        <p
          onClick={() => {
            setCurrentTab(2);
            setIsActive(2);
          }}
          className={isActive === 2 ? "home-tab-active" : ""}
        >
          New Products
        </p>
        <p
          onClick={() => {
            setCurrentTab(3);
            setIsActive(3);
          }}
          className={isActive === 3 ? "home-tab-active" : ""}
        >
          Sales Products
        </p>
      </div>
      <div className="tab-content">
        {
          // best seller
          currentTab === 1 && (
            <HomeTabContent
              products={products} // truyen prop xuong HomeTabContent
              height={height}
            />
          )
        }
        {
          // new product
          currentTab === 2 && (
            <HomeTabContent products={dateProduct} height={height} />
          )
        }
        {
          // sale product
          currentTab === 3 && (
            <HomeTabContent products={sellingProduct} height={height} />
          )
        }
      </div>
    </div>
  );
}
