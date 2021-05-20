import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHome, faMailBulk, faPhone } from '@fortawesome/free-solid-svg-icons';
import './Contact.css'
export default function Contact(){
    return(
        <div>
            <div className="ContactBody">
                <div className="contact-info">
                    <div className="contact-info-title">
                        Cảm ơn vì đã ghé thăm website của chúng tôi. Nếu có gì thắc mắc xin vui lòng liên hệ
                    </div>

                    <div className="contact-info-detail">
                        <div className="contact-info-item">
                            <FontAwesomeIcon icon={faHome} className="contact-icon"/>
                            <p className="contact-info-title2">ADDRESS</p>
                            <p>Số 1 Đại Cồ Việt, Đại học Bách Khoa Hà Nội</p>
                        </div>
                        <div className="contact-info-item">
                            <FontAwesomeIcon icon={faPhone} className="contact-icon"/>
                            <p className="contact-info-title2">phone</p>
                            <p>+84 123456789</p>
                        </div>
                        <div className="contact-info-item">
                            <FontAwesomeIcon icon={faMailBulk} className="contact-icon"/>
                            <p className="contact-info-title2">email</p>
                            <p>bachkhoa@gmail.com</p>
                        </div>
                    </div>
                </div>
            </div>

            <div className="get-in-touch flex">
                <div className="get-in-touch-container">
                    <form className="get-in-touch-form">
                        <label>Contact Us</label>
                        <input placeholder="Name" type="text"></input>
                        <input placeholder="Email"></input>
                        <input placeholder="Subject"></input>
                        <input placeholder="Message"></input>
                        <button className="btn">Send</button>
                    </form>
                </div>
            </div>
        </div>
    )
}