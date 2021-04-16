import React, { useState } from 'react';
export const UserContext = React.createContext(); //contextProvider

//create context được sử dụng để truyền dữ liệu giữa các component kế thừa nhau và sử dụng bằng ContextProvider and ContextConsumer
export function UserProvider(props) {// ES6 is UserProvider extends Component

    //Hoc ve Hook (useState): https://reactjs.org/docs/hooks-state.html
    //userInfo = null and setUserInfo 
    const [userInfo, setUserInfo] = useState(null);

    const setUserInfoFunc = (user) => {
        setUserInfo(Object.assign(user, userInfo)); //update userInfo to user
    }

    return (
        <UserContext.Provider
            value={{
                userInfo: userInfo,
                setUserInfoFunc: setUserInfoFunc
            }}
        >
            {props.children}
        </UserContext.Provider>
    )
}