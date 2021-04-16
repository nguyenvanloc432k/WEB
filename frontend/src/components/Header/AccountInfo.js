import React, { useContext, useEffect, useState } from 'react'
import '../../App.css';
import '../../style/Account.css';
import { UserContext } from '../context/User'
import axios from 'axios'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCheckCircle } from '@fortawesome/free-solid-svg-icons';

function AccountInfo(props) {

    //khởi tạo giá trị và phương thức set
    const [tinh, setTinh] = useState([]) //tỉnh 
    const [huyen, setHuyen] = useState([])//huyện
    const {
        userInfo,
        setUserInfoFunc
    } = useContext(UserContext);

    const [tabId, setTabId] = useState(1);
    const [userName, setUserName] = useState("")
    const [userEmail, setUserEmail] = useState("")
    const [userPassword, setUserPassword] = useState("")
    const [userPhone, setUserPhone] = useState("")
    const [userAvt, setUserAvt] = useState("")
    const [file, setFile] = useState("")
    const [provinceId, setProvinceId] = useState("")
    const [userTinh, setUserTinh] = useState(null)
    const [userHuyen, setUserHuyen] = useState(null)
    const [userAddress, setUserAddress] = useState(null)
    const [toast, setToast] = useState(false)
    const [orderList, setOrderList] = useState([])

    //useEffect dùng để quản lí vòng đời của một component trong funtion component thay vì các lefecycle
    //Học về ReactHook trong React để biết thêm useEffect, useState

    useEffect(() => {
        if (userInfo) {
            // set attribute
            setUserName(userInfo.userName)
            setUserEmail(userInfo.userEmail)
            setUserPhone(userInfo.userPhone)
            setUserAvt(userInfo.userAvt)
            setUserAddress(userInfo.userAddress)

            //set tinh va huyen 
            //neu info.tinh ton tai thi set tinh , neu khong ton tai => lay tinh cu
            //tuong tu voi huyen
            if (userInfo.userTinh !== "") {
                axios.get(`http://pe.heromc.net:4000/vietnam`)
                    //thuc hien request den duong dan va dung phuong thuc GET
                    //response tra ve dung de set du lieu
                    .then(res => {
                        setTinh(res.data[0].tinh)
                        setHuyen(res.data[0].huyen)
                        res.data[0].tinh.filter((item) => {
                            if (userInfo.userTinh === item.name) {
                                setProvinceId(item.id)
                            }
                            return null
                        })
                    }
                    )
                setUserTinh(userInfo.userTinh)
            } else {
                axios.get(`http://pe.heromc.net:4000/vietnam`)
                    .then(res => {
                        setTinh(res.data[0].tinh)
                        setHuyen(res.data[0].huyen)
                    }
                    )
            }
            if (userInfo.userHuyen !== "") {
                setUserHuyen(userInfo.userHuyen)
            }
            axios.get(`http://pe.heromc.net:4000/order`)
                .then(res => {
                    const orderList2 = []
                    for (let i in res.data) {
                        if (res.data[i].orderEmail === userInfo.userEmail) {
                            orderList2.push(res.data[i])
                        }
                    }
                    setOrderList(orderList2)
                }
                )
        }
    }, [userInfo])
    //thuc hien cap nhat khi userInfo thay doi 


    const submitInfo = (event) => {
        event.preventDefault() // chuyen ve event default
        const config = {
            headers: {
                'content-type': 'multipart/form-data'
            }
        }
        const formData = new FormData();
        const imageArr = Array.from(file);
        imageArr.forEach(image => {
            formData.append('userAvt', image);
        })

        //set userInfo
        formData.append("userName", userName);
        formData.append("userEmail", userEmail);
        formData.append("userPassword", userPassword);
        formData.append("userPhone", userPhone);
        formData.append("userTinh", userTinh);
        formData.append("userHuyen", userHuyen);
        formData.append("userAddress", userAddress);
        localStorage.removeItem('token')
        //post userInfo
        axios.post(`http://pe.heromc.net:4000/users/update/${userInfo._id}`, formData, config)
            .then(res => {
                setUserInfoFunc(res.data.user);
                localStorage.setItem('token', res.data.token);
            })
            .catch(err => {
                console.log(err.response.data);
            })

        setToast(true)
        setTimeout(() => {
            setToast(false)
        }, 2000)
    }

    //ben tren la 2 funtion de update userInfo va post userInfo
    return (
        <div className='AccountInfo'>
            <div className="accountinfo-container flex">

                <div className={toast ? "toast toast-show" : "toast"} style={{ top: '20px' }}> {/*toast true is toast-show */}
                    <FontAwesomeIcon icon={faCheckCircle} className="icon" /> {/* lay bieu tuong checkCircle */}
                    Change account infomation success!
                 </div>
                <div className="accountinfo-menu"> {/*
                min-width: 250px;
                height: 100%;
                padding-right: 20px;*/}
                    <div className="accountinfo-avt flex"> {/*accountinfo - Account.css ; flex - App.css*/}
                        {/* div de hien thi ava va username */}
                        <img
                            style={{ borderRadius: '50%' }}
                            className="accountinfo-avt-img"
                            src={userInfo.userAvt}
                            alt=""
                            width="48px"
                            height="48px"
                        ></img>
                        <div className="accountinfo-avt-name">
                            {userInfo.userName}
                        </div>
                    </div>
                    <div className="accountinfo-menu-list">
                        {/*tab 1 hien thi account info 
                            tab 2 hien thi order 
                            tab 3 log out
                            */}
                        <div
                            className={tabId === 1 ? "accountinfo-active accountinfo-menu-item flex" : "accountinfo-menu-item flex"}
                            onClick={() => setTabId(1)}>My account</div>
                        <div
                            className={tabId === 2 ? "accountinfo-active accountinfo-menu-item flex" : "accountinfo-menu-item flex"}
                            onClick={() => setTabId(2)}>Orders</div>
                        <div
                            className={tabId === 3 ? "accountinfo-active accountinfo-menu-item flex" : "accountinfo-menu-item flex"}
                            onClick={() => {
                                localStorage.removeItem('user-id')
                                localStorage.removeItem('token');
                                sessionStorage.removeItem('chat-id')
                                window.location.reload(false);
                                localStorage.removeItem('total')
                                localStorage.removeItem('cart')
                            }}
                        >Log out</div>
                    </div>
                </div>
                {
                    tabId === 1 &&
                    <div className="accountinfo-main">
                        <div className="accountinfo-title">
                            <p>Account Infomation</p>
                            <p>Manage account information for account security</p>
                        </div>
                        <div className="accountinfo-body flex">
                            <form onSubmit={submitInfo} encType="multipart/form-data" > {/* enctype dung de encode khi post*/}
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">Name</div>
                                    <div className="dashboard-right create-box-right">
                                        <input
                                            type="text" name="title"
                                            value={userName}
                                            onChange={(event) => {
                                                setUserName(event.target.value)
                                            }}
                                        ></input>
                                    </div>
                                </div>
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">Images </div>
                                    <div className="dashboard-right create-box-right">
                                        <input
                                            onChange={(event) => {
                                                const files = event.target.files;
                                                setUserAvt(URL.createObjectURL(files[0]))
                                                const fileArr = Array.prototype.slice.call(files)
                                                fileArr.forEach(item => {
                                                    setFile(file => [...file, item])
                                                })
                                            }}
                                            type="file"
                                            name="newsImg"
                                            className="noborder"
                                            multiple="multiple"
                                            style={{ height: '30px' }}
                                        ></input>
                                        <div className="flex" style={{ overflowY: 'hidden', flexWrap: 'wrap' }}>
                                            <img
                                                className="accountinfo-editavt-img"
                                                src={userAvt}
                                                alt=""
                                                width="80px"
                                                height="80px"
                                            ></img>
                                        </div>
                                    </div>
                                </div>
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">Email</div>
                                    <div className="dashboard-right create-box-right">
                                        <input
                                            type="text"
                                            value={userEmail}
                                            onChange={(event) => {
                                                setUserEmail(event.target.value)
                                            }}
                                        ></input>
                                    </div>
                                </div>
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">Phone number</div>
                                    <div className="dashboard-right create-box-right">
                                        <input
                                            type="text"
                                            value={userPhone}
                                            onChange={(event) => {
                                                setUserPhone(event.target.value)
                                            }}
                                        ></input>
                                    </div>
                                </div>
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">Province</div>
                                    <div className="dashboard-right create-box-right">
                                        <select
                                            className="input"
                                            value={userTinh || ''}
                                            onChange={(event) => {
                                                setProvinceId(event.target.selectedIndex)
                                                setUserTinh(event.target.value)
                                            }}
                                        >
                                            <option defaultValue disabled>select a province</option>
                                            {tinh.map((item, index) => {
                                                return (
                                                    <option
                                                        key={index}
                                                        value={item.name}
                                                    >{item.name}</option>
                                                )
                                            })}
                                        </select>
                                    </div>
                                </div>
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">District</div>
                                    <div className="dashboard-right create-box-right">
                                        <select
                                            className="input"
                                            value={userHuyen || ''}
                                            onChange={(event) => {
                                                setUserHuyen(event.target.value)
                                            }}
                                        >
                                            <option defaultValue disabled>select a district</option>
                                            {huyen.map((item, index) => {
                                                if (item.tinh_id === provinceId) {
                                                    return (
                                                        <option
                                                            key={index}
                                                            value={item.name}
                                                        >{item.name}</option>
                                                    )
                                                }
                                                return null
                                            })}
                                        </select>
                                    </div>
                                </div>
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">Address</div>
                                    <div className="dashboard-right create-box-right">
                                        <input
                                            type="text"
                                            className="input"
                                            name="phone"
                                            value={userAddress || ''}
                                            onChange={(event) => {
                                                setUserAddress(event.target.value)
                                            }}
                                        ></input>
                                    </div>
                                </div>
                                <div className="create-box-row account-box-row flex">
                                    <div className="dashboard-left create-box-left flex">New password</div>
                                    <div className="dashboard-right create-box-right">
                                        <input
                                            type="password"
                                            className="input"
                                            name="email"
                                            value={userPassword}
                                            onChange={(event) => {
                                                setUserPassword(event.target.value)
                                            }}
                                        ></input>
                                    </div>
                                </div>
                                <div className="accountinfo-btn-row">
                                    <button className="accountinfo-btn btn">Update infomation</button>
                                </div>
                            </form>
                        </div>
                    </div>
                }
                {
                    tabId === 2 &&
                    <div className="accountinfo-main">
                        <div className="accountinfo-title">
                            <p>Orders infomation</p>
                            <p>List of your orders</p>
                        </div>
                        <div className="dashboard-table-orderlist">
                            <table className="dashboard-table" style={{ tableLayout: 'fixed' }}>
                                <tbody>
                                    <tr className="dashboard-order">
                                        <th className="table-new-title table-order-title">
                                            Shipping info
                                   </th>
                                        <th className="table-new-title table-order-title">
                                            Date
                                   </th>
                                        <th className="table-new-title table-order-title">
                                            Payment Method
                                   </th>
                                        <th className="table-new-title table-order-title">
                                            Items
                                   </th>
                                        <th className="table-new-title table-order-title">
                                            Total money
                                   </th>
                                    </tr>
                                    {
                                        orderList.reverse().map((item, index) => {
                                            const date = new Date(item.orderDate)
                                            const day = date.getDate()
                                            const month = date.getMonth() + 1
                                            const year = date.getFullYear()
                                            var totalItem = 0;
                                            for (let i in item.orderList) {
                                                totalItem += item.orderList[i].amount
                                            }
                                            return (
                                                <tr key={index} className="mobile-table">
                                                    <td>
                                                        <div className="flex" style={{ alignItems: 'center', margin: '10px 0' }}>
                                                            <p
                                                                style={{ wordWrap: 'break-word', WebkitLineClamp: '3' }}
                                                            >{item.orderAddress}, {item.orderHuyen}, {item.orderTinh}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>{day}-{month}-{year}</p>
                                                    </td>
                                                    <td>
                                                        <p style={{ textTransform: 'capitalize' }}>{item.orderPaymentMethod}</p>
                                                    </td>
                                                    <td>
                                                        {typeof (totalItem) === 'number' &&
                                                            <div key={index} className="flex" style={{ justifyContent: 'space-between' }}>
                                                                {/* <p style={{margin: '10px 0', width: '100%', WebkitLineClamp: '2'}}>{virtualArr.productName}</p> */}
                                                                <p style={{ margin: '10px 0', width: '50px', marginLeft: '20px' }}>{totalItem}</p>
                                                            </div>
                                                        }
                                                    </td>
                                                    <td>
                                                        <p>{item.orderTotal} đ</p>
                                                    </td>
                                                </tr>
                                            )
                                        })
                                    }
                                </tbody>
                            </table>
                        </div>
                    </div>
                }
            </div>
        </div>
    )
}

export default AccountInfo;
