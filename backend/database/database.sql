create database laptop;

create table `laptop`.`Category` (
	`cateID` int(11) not null auto_increment,
    `cateName` nvarchar(255) default null,
	primary key(`cateID`)
);
INSERT INTO `laptop`.`Category`
(`cateID`, `cateName`)
VALUES
('1', 'Dưới 10 triệu'),
('2', '10-15 triệu'),
('3', '15-20 triệu'),
('4', '20-25 triệu'),
('5', 'Trên 25 triệu');

create table `laptop`.`Brand` (
	`brandID` int(11) not null auto_increment,
    `brandName` nvarchar(63) default null,
    primary key(`brandID`)
);
INSERT INTO `laptop`.`Brand`
(`brandID`, `brandName`)
VALUES
('1', 'Dell'),
('3', 'Asus'),
('4', 'HP'),
('5', 'Apple(Macbook'),
('6', 'Lenovo'),
('7', 'Acer');

create table `laptop`.`Customer` (
	`customerID` int(11) not null auto_increment,
    `customerName` nvarchar(63) not null,
    `address` nvarchar(63) default null,
    `city` nvarchar(31) default null,
    `country` nvarchar(15) default null,
    `phone` varchar(15) default null,
    `email` varchar(31) not null,
    `password` varchar(63) not null,
    constraint PK_Product primary key (`customerID`,`email`)
);

INSERT INTO `laptop`.`Customer`
(`customerID`, `customerName`, `address`, `city`, `country`, `phone`, `email`, `password`)
VALUES
(1, 'admin1', 'Tòa B1 - ĐHBKHN', 'Hà Nội', 'Việt Nam', '0985632684', 'admin1@gmail.com', 'admin1'),
(2, 'admin2', 'Tòa D3 - ĐHBKHN', 'Hà Nội', 'Việt Nam', '0854956238', 'admin2@gmail.com', 'admin2'),
(3, 'admin3', 'Nhà TC - ĐHBKHN', 'Hà Nội', 'Việt Nam', '0821365981', 'admin3@gmail.com', 'admin3'),
(4, 'admin4', 'Nhà D5 - ĐHBKHN', 'Hà Nội', 'Việt Nam', '0967845625', 'admin4@gmail.com', 'admin4'),
(5, 'admin5', 'Nhà C1 - ĐHBKHN', 'Hà Nội', 'Việt Nam', '0995846390', 'admin5@gmail.com', 'admin5');

create table `laptop`.`Cart` (
	`cartID` int(11) not null,
    `cartPrice` int default null,
    `customerID` int(11) not null,
    `number` int default null,
    constraint PK_Cart primary key (`cartID`,`customerID`),
    foreign key (`customerID`) references laptop.Customer(`customerID`)
);
INSERT INTO `laptop`.`Cart`
(`cartID`, `cartPrice`, `customerID`, `number`)
VALUES
(4, 44980000, 4, 2),
(5, 30990000, 5, 1);

create table `laptop`.`Product` (
	`productID` int(11) not null auto_increment,
	`cateID` int(11) not null,
    `productName` nvarchar(255) default null,
    `productPrice` int default null,
	`productQuantity` int default null,
    `productImg` varchar(127) default null,
	`productDescription` nvarchar(8191) default null,
    `brandID` int(11) not null,
	`productRAM` int default null,
    `productSSD` int default null,
    `productDisplay` varchar(127) default null,
	`productWeight` double default null,
    `productCPU` varchar(255) default null,
    constraint PK_Product primary key (`productID`,`brandID`),
    foreign key (`brandID`) references laptop.Brand(`brandID`),
    foreign key (`cateID`) references laptop.Category(`cateID`)
);


CREATE TABLE laptop.`Order` (
  `orderID` int NOT NULL,
  `dateOrder` date DEFAULT NULL,
  `orderStatus` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customerID` int NOT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `laptop`.`Order`
(`orderID`, `dateOrder`, `orderStatus`, `customerID`, `number`)
VALUES
(1, '2021-01-24', 'Đã thanh toán', 1, 2),
(2, '2021-02-02', 'Đã thanh toán', 2, 1),
(3, '2021-04-25', 'Đang giao hàng', 3, 1);


insert into `laptop`.`Product` values ('1', '5', 'MacBook Pro 16" 2019 Touch Bar', '69990000', '20', 'uploads/2020/11/16/636688207026676028_macbookair-1.jpg', 'Chiếc máy tính xách tay mạnh mẽ nhất, phá vỡ mọi giới hạn đã xuất hiện. MacBook Pro 16 Touch Bar với cấu hình siêu mạnh, bàn phím Magic mới và một màn hình lớn sẽ mang đến cho bạn sản phẩm “Pro” chưa từng thấy.
Mọi giới hạn sinh ra là để phá vỡ, MacBook Pro 16 Touch Bar đã nâng cấp kích thước màn hình lên 16 inch và trở thành chiếc MacBook có màn hình lớn nhất từ trước tới nay. Bạn sẽ được tận hưởng màn hình Retina tuyệt đẹp, độ sáng tối đa 500 nits và hiển thị màu đen với độ sâu hoàn hảo.

Màu sắc chính xác gần như tuyệt đối, gam màu rộng P3 giúp hình ảnh và video hiển thị chân thực, sống động. Một không gian làm việc lớn hơn, chuyên nghiệp hơn đang chờ đón bạn, đặc biệt là công việc đồ họa vốn đòi hỏi một màn hình chính xác.
MacBook Pro 16 Touch Bar sử dụng dòng card đồ họa AMD Radeon Pro 5000 M series, mang lại sức mạnh đồ họa chưa từng có trên dòng MacBook Pro. So với phiên bản tiêu chuẩn của thế hệ trước, MacBook Pro 16 có khả năng xử lý đồ họa mạnh gấp hai lần. Card đồ họa AMD Radeon Pro 5500M với 4GB VRAM DDR6, cho phép bạn chạy các video độ phân giải cực cao; chơi những game nặng như Fortnite hay Rise of the Tomb Raider với trải nghiệm đồ họa chân thực, sống động.
Để nâng cao hiệu suất công việc, bàn phím cũng là một yếu tố rất quan trọng. Bàn phím Magic Keyboard mới trên MacBook Pro 16 Touch Bar có cơ chế cắt kéo tinh tế với hành trình phím tối ưu 1mm, cho trải nghiệm gõ nhạy, thoải mái và yên tĩnh. Phím Esc nằm riêng biệt cạnh bên Touch Bar cho phép bạn chuyển đổi nhanh giữa các chế độ. Đồng thời các phím di chuyển cũng được thiết kế lại để bạn điều hướng nhanh hơn, nhất là khi làm việc cùng các bảng tính hay chơi game.', '5', '16', '1', '16.0", 3072 x 1920 Pixel, IPS LCD LED Backlit, True Tone', '2', 'Intel Core i9-9th-gen 2.30 GHz');

insert into `laptop`.`Product` values ('2', '2', 'Laptop HP 15s fq1107TU', '10990000', '50', 'uploads/2020/11/16/637103737260770893_hp-pavilion-15-xam-1.png', 'HP 15s fq1107TU là chiếc laptop màn hình 15,6 inch rất đáng mua trong tầm giá 10 triệu khi sở hữu bộ vi xử lý Intel thế hệ thứ 10 Ice Lake mới nhất, ổ cứng SSD tốc độ cao và một thiết kế gọn gàng thời trang.

Mỏng nhẹ và tinh tế
So với thế hệ trước, HP 15s fq1107TU đã có sự tinh giản đáng kể về thiết kế, để mang đến vẻ bề ngoài thanh thoát và hiện đại hơn. Cổng kết nối LAN truyền thống bị loại bỏ và các kết nối ở hai cạnh bên máy được bố trí lại, giúp laptop trở nên mỏng hơn với độ mỏng chỉ 1,79 cm. Tất nhiên không thể không nhắc tới trọng lượng siêu nhẹ 1,65 kg và kích thước tổng thể vô cùng nhỏ gọn, mang đến tính di động hơn bao giờ hết. Phiên bản màu bạc thời trang, không bao giờ lỗi thời để bạn thêm phần cảm hứng khi làm việc.

Vi xử lý Intel thế hệ thứ 10 Ice Lake, ổ cứng SSD tốc độ cao
HP 15s-fq1107TU sở hữu hiệu năng rất tốt nhờ bộ vi xử lý Intel thế hệ thứ 10 Ice Lake mới nhất. Laptop được trang bị bộ vi xử lý Intel Core i3 1005G1, con chip sản xuất trên tiến trình 10nm, xung nhịp tối đa 3.4 GHz, đủ để chạy tốt những ứng dụng văn phòng, học tập. Đi cùng với đó là 4GB RAM DDR4 và 256GB ổ cứng SSD. Ổ cứng SSD đóng vai trò quan trọng trong việc tăng tốc toàn diện máy tính, khi cả tốc độ khởi động, mở ứng dụng lẫn truyền dữ liệu đều nhanh vượt trội so với những laptop chỉ có ổ HDD. Bạn sẽ được tận hưởng sự mượt mà, nhanh chóng khi sử dụng HP 15s.

Kết nối tiên tiến hàng đầu
HP 15s fq1107TU tích hợp đầy đủ những cổng kết nối tiên tiến nhất hiện nay. Bạn sẽ có kết nối mạng Wi-Fi 802.11b/g/n/ac và Bluetooth 4.2 cho mạng không dây. Ngoài ra laptop còn sở hữu đầu đọc thẻ đa năng; 2 cổng USB 3.1 Gen 1 Type-A; cổng HDMI 1.4b; jack tai nghe tích hợp micro. Ấn tượng nhất là cổng kết nối USB Type-C tiên tiến, không chỉ cắm tiện lợi cả 2 đầu mà còn cho tốc độ truyền dữ liệu lên tới 5Gb/s. Bạn sẽ có thể kết nối dễ dàng với các thiết bị ngoại vi để phục vụ tối ưu cho công việc.

Hệ điều hành Windows 10 bản quyền
Nâng cao hiệu quả làm việc của bạn với hệ điều hành Windows 10 bản quyền được cài sẵn trên HP 15s fq1107TU. Với Windows 10, bạn sẽ có một giao diện hiện đại hơn, chạy ổn định và nhiều tính năng hơn. Hãy thử các cửa sổ đa tác vụ mới, trình bảo mật Windows Defender cùng nhiều tính năng khác nữa cho công việc của bạn.

Thoải mái làm việc ở bất cứ đâu
Vừa phục vụ công việc lại vừa đảm bảo tính di động, vì thế thời lượng pin là yếu tố rất được chú trọng trên HP 15s fq1107TU. Bạn sẽ có thể sử dụng trong khoảng 10 tiếng liên tục mà không cần đến nguồn sạc. Nhờ vậy, những cuộc họp quan trọng hay việc sử dụng laptop trong một chuyến bay dài đều sẽ được đáp ứng một cách hiệu quả.

Gõ phím nhanh hơn, bàn phím số đầy đủ
Dù có kích thước rất nhỏ gọn nhưng HP 15s du0059TU vẫn được trang bị bàn phím số đầy đủ chứ không cắt bỏ như nhiều laptop khác hiện nay. Nhờ khu vực bàn phím số Num Lock riêng biệt, bạn có thể nhập liệu nhanh hơn khi làm việc với các bảng tính. Bên cạnh đó, bàn phím của HP 15s cho cảm giác gõ phím nhanh, nhạy, thích hợp với sinh viên và những người làm công việc văn phòng.', '4', '4', '256', '15.6", 1366 x 768 Pixel, SVA, 60 Hz, 220 nits, Micro-edge WLED-backlit', '1.65', 'Intel Core i3-1005G1 1.20 GHz');

insert into `laptop`.`Product` values ('3', '2', 'Laptop HP 15s fq1109TU', '11990000', '50', 'uploads/2020/11/16/637183901496630621_hp-348-g7-bac-1.png', 'Trang bị vi xử lý Intel thế hệ thứ 10 mạnh mẽ, ổ cứng SSD dung lượng lên tới 512GB, HP 15s-fq1109TU là chiếc laptop lý tưởng cho sinh viên, nhân viên văn phòng, nhất là khi thiết kế mới giúp máy nhỏ gọn di động hơn bao giờ hết.

Tốc độ nhanh chóng, ổ cứng SSD dung lượng cao 512GB
HP 15s fq1109TU sở hữu hiệu năng rất tốt nhờ bộ vi xử lý Intel thế hệ thứ 10 Ice Lake mới nhất. Laptop được trang bị bộ vi xử lý Intel Core i3 1005G1, con chip sản xuất trên tiến trình 10nm tiên tiến, xung nhịp tối đa 3.4 GHz, đủ để chạy tốt những ứng dụng văn phòng, học tập. Đi cùng với đó là 4GB RAM DDR4 và 512GB ổ cứng SSD. Ổ cứng SSD đóng vai trò quan trọng trong việc tăng tốc toàn diện máy tính, khi cả tốc độ khởi động, mở ứng dụng lẫn truyền dữ liệu đều nhanh vượt trội so với những laptop chỉ có ổ HDD. Bạn sẽ được tận hưởng sự mượt mà, nhanh chóng khi sử dụng HP 15s.

Kiểu dáng hiện đại, màu bạc sang trọng
So với thế hệ trước, HP 15s fq1109TU đã có sự tinh giản đáng kể về thiết kế, để mang đến vẻ bề ngoài thanh thoát và hiện đại hơn. Cổng kết nối LAN truyền thống bị loại bỏ và các kết nối ở hai cạnh bên máy được bố trí lại, giúp laptop trở nên mỏng hơn với độ mỏng chỉ 1,79 cm. Tất nhiên không thể không nhắc tới trọng lượng siêu nhẹ 1,65 kg và kích thước tổng thể vô cùng nhỏ gọn, mang đến tính di động hơn bao giờ hết. Phiên bản màu bạc thời trang, không bao giờ lỗi thời để bạn thêm phần cảm hứng khi làm việc.

Dễ dàng kết nối với thiết bị ngoại vi
HP 15s-fq1109TU tích hợp đầy đủ những cổng kết nối tiên tiến nhất hiện nay. Bạn sẽ có kết nối mạng Wi-Fi 802.11b/g/n/ac và Bluetooth 4.2 cho mạng không dây. Ngoài ra laptop còn sở hữu đầu đọc thẻ đa năng; 2 cổng USB 3.1 Gen 1 Type-A; cổng HDMI 1.4b; jack tai nghe tích hợp micro. Ấn tượng nhất là cổng kết nối USB Type-C tiên tiến, không chỉ cắm tiện lợi cả 2 đầu mà còn cho tốc độ truyền dữ liệu lên tới 5Gb/s. Bạn sẽ có thể kết nối dễ dàng với các thiết bị ngoại vi để phục vụ tối ưu cho công việc.

Hoàn toàn yên tâm về phần mềm với Windows 10 bản quyền
Nâng cao hiệu quả làm việc của bạn với hệ điều hành Windows 10 bản quyền được cài sẵn trên HP 15s-fq1109TU. Với Windows 10, bạn sẽ có một giao diện hiện đại hơn, chạy ổn định và nhiều tính năng hơn. Hãy thử các cửa sổ đa tác vụ mới, trình bảo mật Windows Defender cùng nhiều tính năng khác nữa cho công việc của bạn.

Bàn phím số đầy đủ, nhập liệu nhanh chóng
Dù có kích thước rất nhỏ gọn nhưng HP 15s du0059TU vẫn được trang bị bàn phím số đầy đủ chứ không cắt bỏ như nhiều laptop khác hiện nay. Nhờ khu vực bàn phím số Num Lock riêng biệt, bạn có thể nhập liệu nhanh hơn khi làm việc với các bảng tính. Bên cạnh đó, bàn phím của HP 15s cho cảm giác gõ phím nhanh, nhạy, thích hợp với sinh viên và những người làm công việc văn phòng.

Thời lượng pin đáng kinh ngạc
Vừa phục vụ công việc lại vừa đảm bảo tính di động, vì thế thời lượng pin là yếu tố rất được chú trọng trên HP 15s fq1109TU. Bạn sẽ có thể sử dụng trong khoảng 10 tiếng liên tục mà không cần đến nguồn sạc. Nhờ vậy, những cuộc họp quan trọng hay việc sử dụng laptop trong một chuyến bay dài đều sẽ được đáp ứng một cách hiệu quả.', '4', '4', '512', '15.6", 1366 x 768 Pixel, SVA, 60 Hz, 220 nits, Micro-edge WLED-backlit', '1.65', 'Intel Core i3-1005G1 1.20 GHz');

insert into `laptop`.`Product` values ('4', '5', 'Laptop HP Pavilion 15', '27490000', '22', 'uploads/2020/11/16/637266923420476975_hp-15s-fq-bac-1.png', 'Hiệu năng dẫn đầu xu hướng với bộ vi xử lý Intel Core i7 thế hệ thứ 10 cực mạnh, HP Pavilion Gaming 15 dk1074TX là chiếc laptop chơi game nhỏ gọn mà các game thủ đang tìm kiếm.

Mạnh mẽ hàng đầu với bộ vi xử lý Intel Core i7 thế hệ thứ 10
HP Pavilion Gaming 15 dk1074TX trở nên mạnh mẽ đáng kinh ngạc khi mang trên mình bộ vi xử lý Intel Core i7 10750H, con chip thế hệ thứ 10 mới nhất mà game thủ nào cũng mong muốn. Sức mạnh của i7 10750H được thể hiện ở 6 nhân, 12 luồng, tốc độ 2.60 GHz Turbo Boost lên tối đa tới 5.00 GHz, bộ nhớ đệm 12MB, cho sức mạnh tuyệt vời và “cân” tốt hầu hết mọi tựa game. Bên cạnh đó là 8GB RAM DDR4 băng thông cao 2933MHz, tăng hiệu suất cho cả hoạt động đa nhiệm và chơi game.

Card rời GTX 1650, trải nghiệm đồ họa kiến trúc Turing
HP Pavilion Gaming 15 ec1054AX được trang bị card màn hình rời NVIDIA GeForce GTX 1650 4GB với kiến trúc Turing trứ danh, để bạn chơi tốt hầu hết những tựa game hiện nay. Đặc biệt ở những game eSports phổ biến, tốc độ khung hình cao và ổn định giúp bạn chơi game mượt mà, thao tác chính xác hơn.

Tải game nhanh hơn bằng ổ cứng 512GB PCIe NVMe M.2 SSD
HP Gaming 15 trang bị sẵn 512GB ổ cứng PCIe NVMe M.2 SSD siêu tốc, cho tốc độ khởi động máy, mở ứng dụng, tải game nhanh vượt trội. Bạn sẽ không cần phải chờ đợi ở bất cứ thao tác nào khi mọi thứ luôn diễn ra rất mượt mà. Hơn thế nữa, bạn cũng có thể nâng cấp thêm ổ cứng dễ dàng nếu có nhu cầu để lưu trữ nhiều game và dữ liệu hơn.

Chơi game mọi lúc mọi nơi
HP Pavilion Gaming 15 vẫn giữ phong cách thiết kế tối giản, nhưng giờ đây đã cá tính và phá cách hơn nhờ phần bản lề vát sâu vào trung tâm, đồng thời viền màn hình mỏng hơn đáng kể. Laptop hướng tới sự cơ động khi máy có thiết kế rất mỏng nhẹ, dễ dàng để bạn mang đi bất cứ đâu. HP Pavilion Gaming 15 dk1074TX có độ mỏng chỉ 2,34 cm và trọng lượng 2,23kg, gọn nhẹ hơn rất nhiều so với những laptop chơi game khác. Màn hình viền mỏng còn giúp kích thước tổng thể của HP Gaming 15 nhỏ gọn hơn nữa. Nhờ vậy, bạn có thể chơi game ở mọi nơi bạn muốn.

Đắm chìm trong thế giới trò chơi của riêng bạn
Những giờ phút chơi game của bạn sẽ thêm phần thú vị khi hình ảnh hiển thị tuyệt đẹp trên màn hình viền mỏng của HP Pavilion Gaming 15 dk1074TX. Màn hình có kích thước tiêu chuẩn 15,6 inch, độ phân giải Full HD sắc nét và viền cạnh siêu mỏng cho hình ảnh sống động, chân thực. Từng hình ảnh, nhân vật trong tựa game của bạn đều được mô phỏng chính xác và thể hiện ấn tượng hơn bao giờ hết, mang đến cảm hứng bất tận khi chơi game.

Sẵn sàng “try hard” trong thời gian dài
Thoải mái tận hưởng niềm vui chơi game của bạn trong thời gian dài mà không lo hiện tượng quá nhiệt. HP Pavilion Gaming 15 sở hữu giải pháp tản nhiệt tiên tiến với hệ thống quạt kép, tối đa hóa luồng không khí lưu thông. Nhờ vậy hiệu suất máy luôn được đảm bảo ổn định và ở mức tối ưu.

Sống động trong từng tựa game
HP Pavilion Gaming 15 dk1074TX có loa ngoài cực lớn nhờ dải loa kép được tùy chỉnh bởi B&O và công nghệ HP Audio Boost. Nhờ vậy âm lượng sẽ lớn hơn, đồng thời xử lý giảm thiểu hiện tượng méo tiếng, giúp âm thanh thêm phần sắc nét. Các tựa game sẽ thêm phần sinh động khi mọi tiếng động nhỏ trong game, kể cả những tiếng bước chân đều được tái hiện chân thực, cho bạn hoàn toàn nhập vai vào thế giới game.

Kết nối nhanh chóng
Trên HP Pavilion Gaming 15 dk1074TX có đầy đủ kết nối mà một game thủ cần. Đáng chú ý nhất là cổng USB Type-C siêu tốc 10Gbps đa chức năng như sạc, DisplayPort 1.4. Ngoài ra bạn còn có 3 cổng USB Type-A, trong đó 1 cổng có thể sạc điện ngay cả khi laptop trong trạng thái ngủ. Tất nhiên những cổng kết nối phổ biến như HDMI 2.0 hay cổng mạng RJ-45, jack tai nghe cũng không thể thiếu. Kết nối mạng không dây cũng đặc biệt được chú ý trên HP Gaming 15 khi máy sở hữu công nghệ Wi-Fi mới nhất để bạn thỏa sức chơi game trực tuyến với đường truyền Internet ổn định.', '4', '8', '512', '15.6", 1920 x 1080 Pixels, IPS, 60 Hz, 250 nits, IPS LCD', '2.23', 'Intel Core i7-10750H 2.6 GHz');

insert into `laptop`.`Product` values ('5', '5', 'MacBook Pro 13" 2020 Touch Bar', '34990000', '15', 'uploads/2020/11/17/mac2.png', 'Phiên bản tiêu chuẩn của MacBook Pro 13 2020 nay đã có bộ nhớ dung lượng tăng lên gấp đôi cùng bàn phím Magic Keyboard cơ chế cắt kéo mới, cho bạn trải nghiệm tuyệt vời trên chiếc MacBook di động, mạnh mẽ và thời trang.

Dung lượng ổ cứng tăng lên gấp đôi
Phiên bản MacBook Pro 13 2020 tiêu chuẩn giờ đây đã được nâng lên ổ cứng 256GB SSD, đủ cho nhu cầu lưu trữ cơ bản của người dùng. Ổ cứng SSD không chỉ siêu bền mà còn có tốc độ đọc/ghi đáng kinh ngạc, lên tới 3.0GB/s. Tất cả thao tác của bạn trên máy tính từ khởi động, mở ứng dụng cho đến cài đặt, sao chép dữ liệu đều nhanh hơn với ổ cứng SSD của MacBook Pro. Hơn nữa, với con chip bảo mật Apple T2 Security, toàn bộ dữ liệu đều được đảm bảo an toàn tuyệt đối.

Bàn phím Magic Keyboard thế hệ mới
MacBook Pro 13 2020 được chế tác để bạn làm mọi thứ nhanh chóng và hiệu quả hơn. Bàn phím Magic Keyboard mới là sự cải tiến vượt bậc với cơ chế cắt kéo tinh tế và hành trình phím tối ưu 1mm. Bạn sẽ có trải nghiệm gõ phím tốt nhất từ trước đến nay. Tốc độ đánh máy tăng, gõ êm tay và mượt mà, tất cả đều khiến bạn hài lòng trên bàn phím Magic mới. Phím Escape cũng được bố trí riêng biệt, cho phép bạn chuyển đổi nhanh giữa các chế độ. Các phím điều hướng chữ T giúp thao tác nhanh chóng hơn khi điều hướng hoặc chơi game. Bảng điều khiển TouchBar với rất nhiều phím tắt thông dụng cùng cảm biến vân tay Touch ID sẽ tạo nên điều khác biệt cho MacBook Pro.

Di động nhưng cũng rất mạnh mẽ
Dù rất nhỏ gọn, di động nhưng sức mạnh của MacBook Pro 13 2020 là điều mà tất cả đều phải kính nể. Bộ vi xử lý Intel thế hệ thứ 8 với 4 nhân, tốc độ 1.4GHz Turbo Boost lên tới 3.9GHz, 128MB eDRAM cho tốc độ cực nhanh. Chỉ cần ý tưởng vừa hiện ra trong đầu, MacBook Pro sẽ giúp bạn thực hiện ngay lập tức. Với 8GB RAM LPDDR3 2133MHz, laptop đủ sức đáp ứng tốt nhu cầu đa nhiệm. Làm nhiều việc, chạy nhiều chương trình cùng lúc, mở những tập tin nặng, tất cả đều không thành vấn đề trên MacBook Pro 13 2020.

Thunderbolt 3, một cho tất cả
Thunderbolt 3 là cổng kết nối có băng thông cực cao và tính linh hoạt tuyệt vời của chuẩn USB Type-C, giúp bạn có thể kết nối với mọi thứ ở tốc độ cao nhất. Với Thunderbolt 3, bạn có thể chuyển dữ liệu, sạc, đầu ra video trong một cổng kết nối duy nhất, tốc độ băng thông lên tới 40Gb/s. Ngoài ra với việc hỗ trợ kết nối với eGPU và xuất hình độ phân giải lên tới 5K, Thunderbolt 3 được xây dựng cho những kết nối mạnh mẽ nhất.

An toàn và bảo mật
Tất cả laptop thuộc dòng MacBook Pro thế hệ mới đều trang bị chip bảo mật Apple T2 – con chip bảo mật thế hệ thứ hai mang đến sự an toàn cho dữ liệu của bạn. Apple T2 bao gồm bộ đồng xử lý Secure Enclave cung cấp nền tảng lưu trữ mã hóa và khởi động an toàn. Toàn bộ trình quản lý hệ thống, âm thanh, ổ cứng SSD của bạn đều được hợp nhất và bảo mật, để không bị tin tặc xâm nhập.

Hoàn thành xuất sắc công việc
Những điều bạn có thể làm được trên MacBook Pro 13 2020 là không giới hạn. Bạn có thể chỉnh sửa ảnh độ phân giải cao với tốc độ nhanh chóng; lập trình, chạy nhiều máy ảo một cách mượt mà; biên tập, render video và mix các bản nhạc chuyên nghiệp hay thậm chí là chơi những tựa game như Dota 2 với đồ họa tuyệt đẹp. MacBook Pro, chỉ một thiết bị nhỏ gọn cho tất cả nhu cầu học tập, làm việc, giải trí của bạn.

Tận hưởng hình ảnh và âm thanh đáng kinh ngạc
Màn hình Retina luôn là một trong những tính năng mà người dùng yêu thích nhất trên MacBook Pro. Mọi thứ đều trở nên tuyệt đẹp với một màn hình sắc nét, độ phân giải siêu cao, đèn nền LED sáng mang đến màu đen sâu thẳm và màu trắng sáng rõ. Màn hình hỗ trợ dải màu rộng P3 cho màu xanh và đỏ rực rỡ hơn so với sRGB. Tính năng cân bằng trắng tự động sẽ điều chỉnh nhiệt độ màu dựa theo ánh sáng xung quanh bạn, để độ sáng và màu sắc của màn hình luôn tự nhiên, dễ chịu.

Không chỉ màn hình xuất sắc, MacBook Pro 13 2020 còn mang đến môi trường âm thanh sống động, với chất lượng loa lớn và chi tiết hơn nhiều, dù kích thước máy rất nhỏ gọn. Bạn sẽ được đắm chìm trong những bản nhạc, bộ phim yêu thích. Ngoài ra, 3 micro tích hợp cho khả năng thu âm tốt hơn, để giọng nói bạn luôn rõ ràng khi gọi FaceTime hay nói chuyện với Siri.

Slidecar là một giải pháp thông minh trong hệ sinh thái của Apple, khi cho phép bạn sử dụng iPad với vai trò là một màn hình thứ hai của MacBook Pro. Bạn vẫn sẽ có đầy đủ các chế độ chia màn hình khi kết nối với iPad như sử dụng hai màn hình cho cùng một ứng dụng hay phản chiếu màn hình. Tính năng này đưa độ tiện dụng và di động lên một tầm cao mới, khi chỉ với 2 thiết bị nằm gọn trong balo, bạn cũng có thể làm việc vô cùng chuyên nghiệp.', '5', '8', '256', '13.3", 2560 x 1600 Pixel, IPS, Đang cập nhật, Đang cập nhật, IPS LCD LED Backlit, True Tone', '1.4', 'Intel Core i5-8th-gen 1.40 GHz');

insert into `laptop`.`Product` values ('6', '5', 'MacBook Air 13" 2020', '34990000', '10', 'uploads/2020/11/17/636688207026676028_macbookair-1.jpg', 'Chiếc máy tính xách tay siêu mỏng nhẹ cơ động với màn hình Retina tuyệt đẹp, sức mạnh đáng kinh ngạc và bàn phím hoàn toàn mới, Macbook Air 13 2020 512GB chính là người bạn đồng hành luôn bên bạn cả khi làm việc cũng như giải trí.

Không chỉ là kiệt tác thiết kế
MacBook Air 2020 được sản xuất hoàn toàn từ hợp kim nhôm do chính Apple tạo ra với điểm mạnh là vẻ đẹp cao cấp, cứng cáp và độ bền hoàn hảo. Không chỉ đẹp sang trọng, điểm đặc biệt trong thiết kế MacBook Air 13 còn đến từ nguồn gốc của chất liệu.

Apple đã sử dụng 100% nhôm tái chế để tạo nên MacBook Air 2020, thay vì khai thác nguồn nhôm từ trái đất. Vật liệu tái chế được hoàn thiện ở mức nguyên tử, tạo nên một kiệt tác laptop, nhưng lại rất thân thiện với môi trường.

Hiệu năng đẳng cấp của một chiếc laptop siêu di động
Bên trong chiếc máy có trọng lượng chỉ 1,27kg là một sức mạnh đáng kinh ngạc. MacBook Air 13 2020 512GB mang trên mình bộ vi xử lý Intel Core i5 thế hệ thứ 10 với 4 nhân tốc độ 1,1GHz Turbo Boost lên tới 3,5GHz.

So với phiên bản cùng phân khúc đời trước, MacBook Air 13 2020 có hiệu năng CPU nhanh hơn gấp 2 lần và đồ họa nhanh hơn tới 80%. Từ duyệt web, chơi game cho đến chỉnh sửa video, mọi thứ đều diễn ra nhanh chóng. Phiên bản SSD 512GB mang đến nhiều không gian lưu trữ hơn, cho bạn không gian làm việc thoải mái hơn.

Tận hưởng hình ảnh sắc nét trên màn hình Retina
Với độ phân giải siêu cao 2560 x 1600 pixels, tương đương hơn 4 triệu điểm ảnh trên màn hình kích thước 13,3 inch, bạn sẽ được tận hưởng những hình ảnh vô cùng sắc nét. Chất lượng hình ảnh được nâng lên một tầm cao mới trong khi văn bản hiển thị cực kỳ rõ ràng.

Màn hình MacBook Air 2020 hỗ trợ công nghệ True Tone, tự động điều chỉnh màu để phù hợp với môi trường, giúp cho hình ảnh luôn luôn chân thực và tự nhiên. Hình ảnh tràn viền, màu sắc chính xác và độ nét đáng kinh ngạc, tất cả tạo nên một màn hình laptop ấn tượng bậc nhất hiện nay.

Gõ nhanh hơn, êm hơn trên bàn phím Magic Keyboard
MacBook Air 2020 sở hữu bàn phím Magic Keyboard hoàn toàn mới, tương tự như bàn phím của MacBook Pro 16 inch. Cơ chế cắt kéo tinh tế với hành trình phím chỉ 1mm, mang đến trải nghiệm gõ cực nhạy, tốc độ nhanh, phản hồi tốt và rất yên tĩnh. Phím điều hướng mũi tên dạng chữ T đảo ngược giúp bạn thao tác nhanh hơn trong các bảng tính hay chơi game. Tất nhiên bàn phím cũng hỗ trợ đèn nền và các cảm biến ánh sáng để bạn làm việc hiệu quả hơn trong điều kiện thiếu sáng.

Thao tác chuột cảm ứng chưa bao giờ dễ dàng đến thế
Bàn di chuột Force Touch của MacBook Air 2020 là một trong những bàn di chuột cảm ứng tốt nhất trên thế giới. Với khả năng cảm nhận lực tinh tế, bạn có thể tương tác với MacBook theo nhiều cách khác nhau.

Khả năng phản hồi tuyệt vời, thao tác linh hoạt của Force Touch giúp bạn thao tác thoải mái ở bất cứ vị trí nào trên phần bàn di chuột cảm ứng. Chưa hết, diện tích rộng hơn 20% mang đến cho bạn nhiều không gian hơn, thao tác nhanh và dễ dàng hơn.

Âm thanh sống động, webcam cực nét
Với những kỹ thuật tiên tiến hàng đầu, MacBook Air 13 2020 512GB mang đến trải nghiệm âm thanh tốt nhất từ trước đến nay. Loa ngoài Stereo mang đến dải âm trầm gấp đôi và âm lượng lớn hơn 25% cùng khả năng phát ra âm thanh nổi.

Những bản nhạc hay bộ phim bạn xem sẽ trở nên sống động hơn bao giờ hết. Trong khi đó camera HD giúp bạn gọi FaceTime cho một hay cả nhóm bạn ở độ nét cao. Việc trang bị tới 3 micro cũng giúp khả năng thu âm của MacBook Air chính xác hơn, nâng cao chất lượng cuộc gọi và khả năng trò chuyện với Siri.

Đăng nhập nhanh chóng, bảo mật an toàn bằng cảm biến vân tay Touch ID
Tính năng bảo mật cao cấp cảm biến vân tay Touch ID được tích hợp trên MacBook Air giúp cho bạn mở khóa nhanh hơn và bảo mật tốt hơn. Không chỉ là đăng nhập vào máy, Touch ID còn có thể bảo mật tài liệu, tập tin, cài đặt của bạn để tránh được những rủi ro thâm nhập.

Touch ID cũng đóng vai trò bảo mật khi mua sắm bằng Apple Pay. Mọi thông tin cá nhân của bạn đều trở nên an toàn, riêng tư và dễ dàng truy cập chỉ với riêng bạn nhờ Touch ID.

Bộ vi xử lý bảo mật Apple T2
Nền tảng bảo mật của MacBook Air 13 2020 trở nên an toàn hơn bao giờ hết nhờ bộ vi xử lý chuyên bảo mật Apple T2. Tất cả những thao tác liên quan đến bảo mật của bạn như Touch ID, thông tin thanh toán đều được mã hóa một cách tự động và an toàn ngay trên ổ cứng SSD.

Kết nối nhanh chóng và đa năng
Cổng kết nối Thunderbolt 3 trên MacBook Air 13 2020 kết hợp băng thông tốc độ cao và tính linh hoạt của tiêu chuẩn USB Type-C để tạo ra kết nối nhanh chóng, tiện lợi nhất. Với hai cổng Thunderbolt 3, MacBook Air 2020 có thể truyền dữ liệu, sạc, xuất video ra màn hình độ phân giải tới 6K và tương thích với nhiều loại cáp, bộ chuyển đổi.

Tốc độ băng thông lên tới 40Gb/s, gấp đôi Thunderbolt 2 cùng khả năng cắm được ở bất cứ chiều nào giúp Thunderbolt 3 đáp ứng hoàn hảo mọi nhu cầu của ban.', '5', '8', '512', '13.3", 2560 x 1600 Pixel, IPS, Đang cập nhật, Đang cập nhật, IPS LCD LED Backlit, True Tone', '1.29', 'Intel Core i5-10th-gen 1.10 GHz');

insert into `laptop`.`Product` values ('7', '3', 'MacBook Air 13" 2017', '19990000', '10', 'uploads/2020/11/17/636688207026676028_macbookair-1_Nu0WnLx.jpg', 'Macbook Air 13 128 GB MQD32SA/A (2017) với thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ, hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình.

 

Thiết kế siêu mỏng và nhẹ
 
Với thiết kế truyền thống của dòng MacBook Air, phiên bản 2017 này cũng không có thay đổi khi được trang bị lớp vỏ nhôm nguyên khối Unibody sang trọng, chỉ mỏng 1.7cm và trọng lượng là 1.35kg, rất tiện lợi và dễ dàng để bạn luôn mang theo bên mình. Logo quả táo Apple phát sáng tạo nên đặc trưng riêng khác biệt.

Kết nối nhanh 
Trên Macbook Air 13 128 GB MQD32SA/A (2017), cổng Thunderbolt thế hệ thứ hai cho tốc độ truyền tải dữ liệu cao hơn gấp đôi so với Thunderbolt 1, đồng thời còn có thể xuất hình ảnh độ phân giải cao ra màn hình 4K. Ngoài ra sản phẩm còn có 2 cổng USB 3.0, SD card, không có cổng LAN, HDMI và ổ đĩa quang.

Hiệu năng mượt mà

Macbook Air 13 2017 có bộ xử lý Intel core i5, hai nhân xung nhịp 1.8 GHz, so với phiên bản trước thì tốc độ CPU đã tăng lên nhẹ, card đồ họa tích hợp Intel HD Graphics 6000, bộ nhớ RAM 8 GB, cùng ổ cứng lưu trữ SSD 128 GB, có tốc độ đọc và ghi dữ liệu cao hơn 2 lần so với thế hệ trước. Cùng với hệ sinh thái khép kín của hệ điều hành Mac OS, sản phẩm chắc chắn mang lại cho người dùng những trải nghiệm đa nhiệm mượt mà nhất.

 

Màn hình độ phân giải khá

Macbook Air 13 2017 có màn hình rộng 13.3 inch, độ phân giải là 1440x900px. Có lẽ màn hình vẫn là một điểm còn hạn chế trên sản phẩm khi chưa được nâng cấp lên Retina như các dòng khác. Tuy nhiên, hình ảnh hiển thị khá chất lượng, tươi sáng.

Bàn rê cảm ứng mượt mà, bàn phím tối ưu sử dụng

Nếu dùng qua bàn rê cảm ứng trên MacBook, có thể bạn sẽ quên ngay đi con chuột truyền thống, bởi nó rất nhạy và mượt mà, tiện dụng. Bàn phím chiclet cho các phím bấm gọn gàng, tinh tế, các phím vừa tay, đèn nền backlit thêm thuận tiện khi làm việc trong điều kiện ánh sáng yếu.
 
Thời lượng pin lên đến 12 giờ sử dụng
Vấn đề pin luôn là một trăn trở khi dùng laptop, tuy nhiên với Macbook Air 13 2017, thời gian đến 12 giờ sử dụng sau một lần sạc đầy. Đồng thời ổ cứng SSD cực kỳ tiết kiệm năng lượng, cho phép chiếc laptop của bạn khả năng chờ lên đến một tháng mà không cần cắm sạc.', '5', '8', '128', '13.3", 1440 x 900 Pixel, Đang cập nhật, Đang cập nhật, Đang cập nhật, LED-backlit', '1.35', 'Intel Core i5-5th-gen 1.80 GHz');

insert into `laptop`.`Product` values ('8', '2', 'Laptop HP Pavilion 14 ce3015TU', '13690000', '5', 'uploads/2020/11/17/637320742814213728_hp-envy-13-ba0046tu-vang-1.png', 'HP Pavilion 14-ce3015TU là mẫu laptop phổ thông 14 inch mỏng nhẹ, phục vụ tốt cho công việc nhờ bộ vi xử lý thế hệ thứ 10 mới nhất, 512GB ổ cứng SSD cùng màn hình viền siêu mỏng đẹp mắt.

Kiểu dáng thời trang, vô cùng nhỏ gọn
Trước mắt bạn sẽ là chiếc laptop phiên bản màu vàng hết sức sang trọng, nhỏ gọn và thời trang. Bên cạnh màu sắc đẹp mắt, điểm nhấn ấn tượng nhất trong thiết kế HP Pavilion 14-ce3015TU chính là màn hình viền mỏng. Xu hướng thiết kế mới này giúp laptop có thể đặt màn hình 14 inch vào trong một bộ khung 13 inch, nhỏ gọn hơn bao giờ hết. Bạn có thể dễ dàng cho HP Pavilion 14 vào cặp xách hay balo, cầm trên tay nhẹ nhàng để di chuyển bất cứ nơi đâu. Trọng lượng chưa đến 1,6kg giúp HP 14 thực sự rất nhẹ.

Trải nghiệm màn hình Full HD sắc nét viền siêu mỏng
Màn hình HP Pavilion 14-ce3015TU không chỉ có viền mỏng thanh thoát mà còn sở hữu độ phân giải Full HD vô cùng sắc nét. Bạn sẽ có một màn hình 14 inch, độ phân giải 1920 x 1080 pixels, hiển thị chân thực đến từng chi tiết, màu sắc chính xác và độ nét tuyệt vời. Những nội dung trong công việc cũng như giải trí đều được tái hiện rõ nét.

Tận hưởng âm thanh cao cấp
Nếu bạn là một người thích nghe nhạc, xem phim thì HP Pavilion 14-ce3015TU sẽ đáp ứng rất tốt bằng âm thanh cực chất. Hãy trải nghiệm chiều sâu âm nhạc mới đầy sống động và chân thực với loa kép, công nghệ khuếch âm Audio Boost cùng âm thanh tinh chỉnh bởi các chuyên gia B&O Play. Những âm thanh chi tiết, chất lượng cao cho bạn tận hưởng cuộc sống tuyệt vời hơn.

Dẫn đầu xu hướng bằng bộ vi xử lý thế hệ thứ 10
HP Pavilion 14-ce3015TU sở hữu sức mạnh dẫn đầu xu hướng khi là một trong những laptop đầu tiên trên thị trường được trang bị bộ vi xử lý thế hệ thứ 10 Ice Lake mới nhất. Con chip Intel Core i3-1005G1 với 2 lõi 4 luồng, sản xuất trên tiến trình 10nm tiên tiến, tốc độ xung nhịp 1.20 GHz Turbo Boost 3.40GHz, không chỉ cho bạn tốc độ nhanh, mượt mà ở mọi tác vụ mà còn vô cùng tiết kiệm điện năng.

Tăng tốc mạnh mẽ nhờ 512GB ổ cứng SSD
Laptop HP 14 ce3015TU có sẵn 4GB RAM DDR4, cho phép mở nhiều ứng dụng, duyệt web nhiều tab cùng lúc. HP Pavilion 14 sở hữu 512GB ổ cứng thể rắn SSD, không chỉ mang đến không gian lưu trữ lớn mà còn tăng tốc toàn diện máy tính với tốc độ khởi động, mở ứng dụng, truyền dữ liệu nhanh vượt trội so với ổ cứng HDD truyền thống. Cấu hình tốt giúp HP Pavilion 14 trở thành phương tiện hoàn hảo cho công việc và học tập của bạn.

Bản lề nâng tiện lợi
Bên cạnh kiểu dáng thanh lịch ấn tượng, HP Pavilion 14-ce3015TU còn có thiết kế bản lề nâng độc đáo. Khi bạn mở máy, một phần bản lề sẽ nâng nhẹ thân máy lên, giúp gõ phím tự nhiên hơn và tản nhiệt tốt hơn. Đồng thời một phần viền màn hình cạnh dưới cũng được giấu đi, mang tới trải nghiệm hình ảnh tuyệt vời.', '4', '4', '512', '14.0", 1920 x 1080 Pixel, Đang cập nhật, 60 Hz, Đang cập nhật, LED-backlit', '1.53', 'Intel Core i3-1005G1 1.20 GHz');

insert into `laptop`.`Product` values ('9', '4', 'Laptop HP ENVY 13 ba0046TU', '23190000', '20', 'uploads/2020/11/17/637320742814213728_hp-envy-13-ba0046tu-vang-1_DeM88Zc.png', 'Chiếc máy tính xách tay siêu di động, cao cấp và mang trên mình sức mạnh đáng nể, HP ENVY 13 ba0046TU cho phép bạn thỏa sức sáng tạo mọi lúc mọi nơi.

Vẻ đẹp sang trọng, thu hút mọi ánh nhìn
HP Envy 13 nhanh chóng mê hoặc người dùng chỉ sau cái nhìn đầu tiên. Màn hình không viền tinh tế, thân máy mỏng cứng cáp, trọng lượng siêu nhẹ chỉ chưa đến 1,3 kg tạo nên một chiếc máy tính xách tay đẹp tuyệt mỹ, vô cùng năng động khi bạn dễ dàng mang đi như một cuốn sách. HP Envy 13 ba0046TU không đơn thuần là một phương tiện phục vụ công việc, nó còn là một kiệt tác thời trang hấp dẫn.

Chăm chút đến từng chi tiết nhỏ
Không chỉ có kiểu dáng và độ hoàn thiện xuất sắc, HP Envy 13-ba0046TU còn chăm chút đến từng chi tiết nhỏ, giúp người dùng có thêm cảm hứng trong công việc. Thiết kế bản lề nâng khéo léo cho bạn cảm giác gõ phím thoải mái hơn, đồng thời tối ưu hệ thống làm mát để máy luôn đảm bảo hiệu năng ổn định. Logo Envy tinh tế đặt lên phần bản lề nổi bật tạo nên sự cá tính, sang trọng ở mọi góc nhìn cho HP Envy 13.

Đủ sức mạnh để hiện thực hóa ý tưởng của bạn
HP Envy 13-ba0046TU sẽ nhanh chóng hiện thực hóa mỗi ý tưởng của bạn với cấu hình vô cùng mạnh mẽ. Laptop sở hữu bộ vi xử lý Intel Core i5 1035G4 thế hệ thứ 10 mới nhất, sản xuất trên tiến trình 10nm tiên tiến, cho tốc độ đa nhân nhanh và ổn định. Tất nhiên không thể không nhắc đến 8GB RAM DDR4 và ổ cứng SSD dung lượng cao 512GB. Với cấu hình này, HP ENVY 13 ba0046TU chạy mượt ở mọi tác vụ, mang đến cho bạn hiệu suất làm việc nhanh chóng. Di động, nhỏ gọn và sức mạnh đáng kinh ngạc, đó là những gì HP Envy 13 mang lại.

Khả năng bảo mật hàng đầu
Những tính năng bảo mật cao cấp sẽ giúp bạn yên tâm hơn trên laptop HP Envy 13 mới. Màn hình có khả năng chống nhìn trộm HP Sure View, khi kích hoạt sẽ giúp bạn tránh khỏi những ánh mắt tò mò. Ngoài ra bạn còn có các nút tắt camera và tắt micro để không bị tin tặc thâm nhập. Bên cạnh đó một đầu đọc vân tay được tích hợp ở vị trí cạnh các phím điều hướng trên bàn phím, cho phép bạn sử dụng nó để thay thế mật khẩu khi đăng nhập vào HP Envy 13 một cách đơn giản nhưng cũng rất bảo mật.

Thời lượng pin lên tới 18 tiếng
Sức mạnh nằm gọn trong tay bạn khi HP Envy 13-ba0046TU có thời lượng pin lên tới 18 tiếng. Thoải mái làm việc hoặc “cày” những bộ phim bạn yêu thích ở bất cứ đâu mà không cần quan tâm đến nguồn sạc. Hơn nữa, HP Envy 13 còn có cả công nghệ sạc nhanh, đảm bảo bạn sẽ có thời lượng pin cần dùng trong thời gian cấp bách. Luôn sẵn sàng cho ngày dài năng động.

Màu sắc sống động trên màn hình viền mỏng 4 cạnh
Cơ chế bản lề nâng mới giúp HP Envy 13 khéo léo “giấu đi” một phần nhỏ cạnh dưới màn hình, mang tới cho bạn trải nghiệm trên màn hình viền mỏng đều cả 4 cạnh vô cùng tuyệt vời. Màn hình tràn viền của HP Envy 13 sẽ hiển thị mọi nội dung một cách tuyệt đẹp, từ văn bản sắc nét, các phần mềm tương thích cho đến những đoạn phim sống động. Chất lượng chuẩn Full HD, góc nhìn rộng 178 độ và đặc biệt màu sắc hết sức chân thực tạo nên hình ảnh xuất sắc. Hãy cùng đắm chìm trong thế giới giải trí đỉnh cao của HP Envy 13 ba0046TU.

Âm thanh lớn, chi tiết và hấp dẫn chưa từng thấy
Hãy nhìn vào dải loa “hoành tráng” trên HP Envy 13-ba0046TU, dù chỉ là một chiếc laptop nhỏ gọn nhưng Envy 13 vẫn mang đến trải nghiệm âm nhạc có chiều sâu và chân thực. Với bốn đơn vị loa, âm thanh tinh chỉnh bởi các chuyên gia của Bang & Olufsen cùng công nghệ khuếch âm HP Audio Boost, âm thanh phát ra trên HP Envy 13 không chỉ lớn, mà còn mang sắc âm phong phú, dải âm trầm ấm sâu lắng.

Kết nối nhanh như chớp
Dù có kích thước siêu mỏng, nhưng HP Envy 13-ba0046TU vẫn có đầy đủ các cổng kết nối tiên tiến hàng đầu hiện nay. Bạn sẽ có cổng USB-C Thunderbolt 3 cho tốc độ truyền dữ liệu nhanh như chớp và đầu ra video 5K siêu nét; 2 cổng USB 3.1 Gen 1 Type-A, giắc cắm âm thanh và đầu đọc thẻ nhớ micro-SD. Không chỉ kết nối có dây, kết nối không dây cũng được nâng cấp với Wi-Fi 6 và Bluetooth 5.0 cho khả năng kết nối siêu nhanh.', '4', '8', '512', '13.3", 1920 x 1080 Pixel, IPS, 60 Hz, 300 nits, Micro-edge WLED-backlit', '1.3', 'Intel Core i5-1035G4 1.10 GHz');

insert into `laptop`.`Product` values ('10', '5', 'MacBook Pro 13" 2020', '47990000', '5', 'uploads/2020/11/17/mac3.png', 'MacBook Pro 13 2020 mới với bộ vi xử lý Intel thế hệ thứ 10 mạnh mẽ, bàn phím Magic Keyboard mới bền vững hơn, sẽ đưa bạn đến trải nghiệm của sự chuyên nghiệp, tốc độ và tính tiện lợi trong công việc.

Sức mạnh không ngờ của một chiếc laptop di động
MacBook Pro 13 2020 nâng tầm hiệu suất của laptop di động lên một đẳng cấp hoàn toàn khác biệt. Bộ vi xử lý Intel thế hệ thứ 10 mới với 4 nhân, tốc độ 2.0GHz Turbo Boost lên tới 3.8GHz, 6MB bộ nhớ đệm L3 cho tốc độ nhanh như ý tưởng của bạn. Chỉ cần ý tưởng vừa hiện ra trong đầu, MacBook Pro sẽ giúp bạn thực hiện ngay lập tức. Hơn nữa, 16GB RAM LPDDR4X 3733MHz giúp máy có khả năng đa nhiệm tốt hơn bao giờ hết. Làm nhiều việc, chạy nhiều chương trình cùng lúc, mở những tập tin nặng, tất cả đều không thành vấn đề trên MacBook Pro 13 2020.

Làm việc, giải trí đẳng cấp Pro
Những điều bạn có thể làm được trên MacBook Pro 13 2020 là không giới hạn. Bạn có thể chỉnh sửa ảnh độ phân giải cao với tốc độ nhanh chóng; lập trình, chạy nhiều máy ảo một cách mượt mà; biên tập, render video và mix các bản nhạc chuyên nghiệp hay thậm chí là chơi những tựa game như Dota 2 với đồ họa tuyệt đẹp. MacBook Pro, chỉ một thiết bị nhỏ gọn cho tất cả nhu cầu học tập, làm việc, giải trí của bạn.

Nâng cao hiệu suất đồ họa
Việc trang bị bộ vi xử lý Intel thế hệ thứ 10 cũng đồng nghĩa với việc MacBook Pro 13 2020 sẽ sở hữu GPU đồ họa Iris Plus mới, cho hiệu suất đồ họa tốt hơn tới 80% so với thế hệ trước. Bạn sẽ có thể chỉnh sửa video dễ dàng, dựng mô hình 3D nhanh hơn và chơi game mượt mà hơn.

Ổ cứng SSD, lưu trữ nhiều hơn, tốc độ nhanh hơn
Phiên bản MacBook Pro 13 2020 trong bài viết có ổ cứng SSD dung lượng 512GB, thoải mái để bạn cài đặt ứng dụng, lưu trữ dữ liệu. Ổ cứng SSD không chỉ siêu bền mà còn có tốc độ đọc/ghi đáng kinh ngạc, lên tới 3.0GB/s. Tất cả thao tác của bạn trên máy tính từ khởi động, mở ứng dụng cho đến cài đặt, sao chép dữ liệu đều nhanh hơn với ổ cứng SSD của MacBook Pro. Hơn nữa, với con chip bảo mật Apple T2 Security, toàn bộ dữ liệu đều được đảm bảo an toàn tuyệt đối.

Bàn phím Magic Keyboard mới, cho trải nghiệm đánh máy thoải mái nhất
MacBook Pro 13 2020 được chế tác để bạn làm mọi thứ nhanh chóng và hiệu quả hơn. Bàn phím Magic Keyboard mới là sự cải tiến vượt bậc với cơ chế cắt kéo tinh tế và hành trình phím tối ưu 1mm. Bạn sẽ có trải nghiệm gõ phím tốt nhất từ trước đến nay. Tốc độ đánh máy tăng, gõ êm tay và mượt mà, tất cả đều khiến bạn hài lòng trên bàn phím Magic mới.

Phím Escape cũng được bố trí riêng biệt, cho phép bạn chuyển đổi nhanh giữa các chế độ. Các phím điều hướng chữ T giúp thao tác nhanh chóng hơn khi điều hướng hoặc chơi game. Bảng điều khiển TouchBar với rất nhiều phím tắt thông dụng cùng cảm biến vân tay Touch ID sẽ tạo nên điều khác biệt cho MacBook Pro.

Yên tâm về bảo mật
Tất cả laptop thuộc dòng MacBook Pro 13 thế hệ mới đều trang bị chip bảo mật Apple T2 – con chip bảo mật thế hệ thứ hai mang đến sự an toàn cho dữ liệu của bạn. Apple T2 bao gồm bộ đồng xử lý Secure Enclave cung cấp nền tảng lưu trữ mã hóa và khởi động an toàn. Toàn bộ trình quản lý hệ thống, âm thanh, ổ cứng SSD của bạn đều được hợp nhất và bảo mật, để không bị tin tặc xâm nhập.

Màn hình Retina đẹp xuất sắc, âm thanh đắm chìm
Màn hình Retina luôn là một trong những tính năng mà người dùng thích nhất trên MacBook Pro. Mọi thứ đều trở nên tuyệt đẹp với một màn hình sắc nét, độ phân giải siêu cao, đèn nền LED sáng mang đến màu đen sâu thẳm và màu trắng sáng rõ. Màn hình hỗ trợ dải màu rộng P3 cho màu xanh và đỏ rực rỡ hơn so với sRGB. Tính năng cân bằng trắng tự động sẽ điều chỉnh nhiệt độ màu dựa theo ánh sáng xung quanh bạn, để độ sáng và màu sắc của màn hình luôn tự nhiên, dễ chịu.

Không chỉ màn hình xuất sắc, MacBook Pro 13 2020 còn mang đến môi trường âm thanh sống động, với chất lượng loa lớn và chi tiết hơn nhiều, dù kích thước máy rất nhỏ gọn. Bạn sẽ được đắm chìm trong những bản nhạc, bộ phim yêu thích. Ngoài ra, 3 micro tích hợp cho khả năng thu âm tốt hơn, để giọng nói bạn luôn rõ ràng khi gọi FaceTime hay nói chuyện với Siri.

Thunderbolt 3, cổng kết nối mạnh mẽ và linh hoạt nhất từ trước đến nay
Thunderbolt 3 là cổng kết nối có băng thông cực cao và tính linh hoạt tuyệt vời của chuẩn USB Type-C, giúp bạn có thể kết nối với mọi thứ ở tốc độ cao nhất. Với Thunderbolt 3, bạn có thể chuyển dữ liệu, sạc, đầu ra video trong một cổng kết nối duy nhất, tốc độ băng thông lên tới 40Gb/s. Hơn nữa, trên MacBook Pro 13 2020 phiên bản chạy chip Intel thế hệ thứ 10 có tới 4 cổng Thunderbolt 3, để bạn sử dụng kết nối linh hoạt hơn nữa. Hỗ trợ kết nối với eGPU và xuất hình độ phân giải lên tới 6K, Thunderbolt 3 được xây dựng cho những kết nối mạnh mẽ nhất.

Slidecar, mở rộng không gian với iPad
Slidecar là một giải pháp thông minh trong hệ sinh thái của Apple, khi cho phép bạn sử dụng iPad với vai trò là một màn hình thứ hai của MacBook Pro. Bạn vẫn sẽ có đầy đủ các chế độ chia màn hình khi kết nối với iPad như sử dụng hai màn hình cho cùng một ứng dụng hay phản chiếu màn hình. Tính năng này đưa độ tiện dụng và di động lên một tầm cao mới, khi chỉ với 2 thiết bị nằm gọn trong balo, bạn cũng có thể làm việc vô cùng chuyên nghiệp.', '5', '16', '512', '13.3", 2560 x 1600 Pixel, IPS, Đang cập nhật, Đang cập nhật, IPS LCD LED Backlit, True Tone', '1.4', 'Intel Core i5-10th-gen 2.00 GHz');

insert into `laptop`.`Product` values ('11', '2', 'Laptop Asus Vivobook X409JA-EK237T', '10590000', '20', 'uploads/2020/11/18/637078805561950338_asus-zenbook-ux434fac-bac-1.png', 'Asus Vivobook X409JA EK237T là chiếc laptop ngon – bổ - rẻ đích thực khi sở hữu cấu hình mạnh mẽ từ bộ vi xử lý thế hệ thứ 10 Ice Lake mới nhất, màn hình Full HD sắc nét, ổ cứng SSD siêu tốc và đặc biệt được bán với mức giá chỉ chưa tới 10 triệu đồng.

Thiết kế nhỏ gọn và sang trọng
Asus Vivobook X409JA EK237T ngay lập tức mang đến sự thu hút nhờ kiểu dáng nhỏ gọn và màu bạc thời trang. Đồng thời laptop còn được làm màn hình viền mỏng, thêm phần thu gọn kích thước tổng thể, để máy chỉ gọn như một cuốn sách. Asus Vivobook X409JA có trọng lượng vỏn vẹn 1,6kg, cực kỳ di động để theo kịp lối sống năng động của bạn. Đồng thời những đường nét sắc sảo, thiết kế vuông vắn 

Hình ảnh tuyệt đẹp trên màn hình Full HD viền mỏng
Công nghệ màn hình viền mỏng NanoEdge trên Asus X409 mang đến không gian hiển thị lớn hơn, hiệu ứng tràn viền hấp dẫn hơn, cho trải nghiệm xem tuyệt vời, phục vụ tốt cho cả công việc và giải trí. Độ phân giải Full HD là ưu điểm nổi bật của Asus Vivobook X409JA so với các đối thủ trong tầm giá, hiển thị sắc nét mọi nội dung trước mắt bạn. Đồng thời, màn hình Asus Vivobook X409JA EK237T còn phủ lớp chống chói để bạn sử dụng tốt dưới những nguồn ánh sáng quá mạnh và góc nhìn rộng hơn. Hãy cùng tập trung vào công việc hoặc đắm chìm vào những giờ phút giải trí thư giãn trên Asus Vivobook.

Xử lý công việc mượt mà
Asus Vivobook X409JA EK237T có cấu hình mạnh mẽ, nâng cấp vượt bậc so với dòng VivoBook thế hệ trước nhờ con chip mới thế hệ thứ 10 Ice Lake. Laptop được trang bị bộ vi xử lý Intel Core i3 1005G1, con chip sản xuất trên tiến trình 10nm tiên tiến, không chỉ mạnh mà còn tiết kiệm điện năng hơn. Mọi công việc văn phòng, học tập hay giải trí đều được đáp ứng tuyệt vời trên Vivobook X409. Hoạt động đa nhiệm cũng trở nên tốt hơn nhờ 4GB RAM DDR4. Đặc biệt, Asus Vivobook X409JA EK237T có sẵn ổ cứng 256GB SSD, tăng tốc toàn bộ hệ thống, từ khởi động, mở ứng dụng cho đến sao chép dữ liệu, để bạn có được trải nghiệm mượt mà hơn bao giờ hết.

Tận hưởng âm thanh sống động
Tận hưởng âm thanh sống động với công nghệ Asus SonicMaster. Đây là giải pháp toàn diện khi kết hợp giữa phần cứng, phần mềm và khả năng tinh chỉnh âm thanh để mang đến trải nghiệm âm thanh tốt nhất. Bộ mã codec giải mã âm thanh cao cấp, đồng thời các bộ khuếch đại sẽ tăng cường công suất loa, để âm thanh vừa lớn lại vừa sắc nét hơn. Hiện tượng méo tiếng cũng bị giảm thiểu sau quá trình tinh chỉnh. Kết quả là với Asus Vivobook X409JA EK237T, bạn sẽ được nghe những âm thanh tuyệt vời hơn bao giờ hết.

Bàn phím nhạy, đánh văn bản nhanh chóng
Bàn phím của Vivobook X409JA được thiết kế cấu trúc liền khối cứng cáp, mũ phím lõm công thái học để gõ bám tay hơn; hành trình phím tối ưu 1,4mm cho trải nghiệm gõ phím thoải mái nhất. Bạn có thể thao tác nhạy bén, soạn thảo văn bản nhanh hơn trên bàn phím này.

Cảm biến vân tay tiện lợi
Một cảm biến vân tay được đặt trên khu vực bàn di chuột Touch Pad sẽ giúp bạn nhanh chóng đăng nhập vào Windows chỉ bằng một cú chạm. Không cần phải mất công nhập mật khẩu nữa khi mật khẩu nằm ngay trên đầu ngón tay của bạn.

Kết nối với tất cả thiết bị ngoại vi phổ biến
ASUS Laptop X409 được trang bị cổng USB Type-C™ 3.1 cho phép kết nối hai chiều, hỗ trợ thiết kế hai mặt khiến cho việc kết nối các thiết bị trở nên dễ dàng nhất có thể. USB-C còn đem đến tốc độ truyền dữ liệu nhanh hơn đến 10 lần so với các chuẩn kết nối USB 2.0 trước đây. Ngoài ra còn có cổng USB 3.0 và USB 2.0, đầu ra HDMI và đầu đọc thẻ MicroSD – cho phép bạn kết nối dễ dàng với tất cả các thiết bị ngoại vi hiện tại, màn hình và máy chiếu hết sức nhanh chóng.', '3', '4', '256', '14.0", 1920 x 1080 Pixel, TN, 60 Hz, 220 nits, Nano Edge', '1.6', 'Intel Core i3-1005G1 1.20 GHz');

insert into `laptop`.`Product` values ('12', '4', 'Laptop Asus TUF FX506LI HN039T', '23990000', '10', 'uploads/2020/11/18/637011994198410418_asus-vivobook-a412-1.png', 'Hướng đến trải nghiệm chơi game và độ bền, Asus TUF FX506LI HN039T thuộc thế hệ TUF Gaming F15 từ Asus với cấu hình kết hợp của Intel và NVIDIA cùng màn hình 144Hz siêu mượt sẽ mang đến sản phẩm laptop chơi game mạnh mẽ trong một thiết kế nhỏ gọn, độ bền chuẩn quân đội.

Sức mạnh đỉnh cao cho mọi tác vụ
Asus TUF FX506LI HN039T mang trên mình sức mạnh của bộ vi xử lý Intel thế hệ thứ 10. Con chip Intel Core i5 10300H với 4 lõi 8 luồng và tốc độ tối đa lên tới 4.50GHz cho hiệu năng đáng tin cậy, dù là bạn chơi game, phát trực tiếp hay làm việc. Đi kèm với đó là 512GB SSD NVMe PCIe, 8GB RAM DDR4 và khả năng nâng cấp dễ dàng, để bạn có được hiệu năng đúng như ý muốn

Card rời GTX 1650 Ti, kiến trúc Turing đột phá
Card đồ họa Asus TUF FX506LI HN039T sử dụng là NVIDIA GeForce GTX 1650 Ti. Đây là card đồ họa với kiến trúc Turing danh tiếng, giúp bạn có thể chơi tốt mọi game eSports và sẵn sàng cho các tựa game bom tấn AAA. Công nghệ dò tia theo thời gian thực trong game, trí tuệ nhân tạo AI sẽ mang đến cho bạn trải nghiệm game cực đỉnh.

Phiên bản Fortress Gray thanh thoát ấn tượng
Thiết kế của Asus TUF FX506LI HN039T nhìn qua có vẻ đơn giản nhưng lại đậm cá tính và ẩn chứa nhiều điều bất ngờ. Bạn sẽ có một chiếc laptop gaming gọn gàng với viền màn hình mỏng và trọng lượng chỉ 2.3 kg. Toàn thân máy là những đường nét tinh tế như họa tiết tổ ong ở khung máy độc đáo, góp phần tản nhiệt tốt hơn; các đường kẻ sọc đối lập đầy thanh thoát và đặc biệt là thiết kế Fortress Gray với màu xám cực sang trọng trên mặt lưng, cùng logo TUF gaming đẳng cấp. Tất cả tạo nên một chiếc laptop chuẩn game thủ, cá tính và đẳng cấp.

Màn hình 144Hz viền mỏng siêu mượt
Màn hình Asus TUF FX506LI HN039T được chế tác viền mỏng tối đa, mang đến những hình ảnh tuyệt đẹp trên tấm nền 15,6 inch, độ phân giải Full HD. Đặc biệt, đây còn là màn hình có tốc độ khung hình vượt trội 144Hz. Các tựa game sẽ được tái hiện một cách mượt mà, tốc độ khung hình nhanh và giảm thiểu hiện tượng xé hình. Hơn thế nữa, bạn còn có thể kết nối với hai màn hình bên ngoài cùng lúc, bao gồm một màn hình để làm việc qua cổng USB 3.2 gen 2 Type-C hỗ trợ DisplayPort 1.4 và một màn hình lớn để chơi game, xem phim 4K qua cổng HDMI 2.0b.

Bàn phím dành riêng cho game thủ
Asus TUF FX506LI HN039T trang bị bàn phím tương tự máy tính để bàn, tốt nhất cho hoạt động chơi game. Tất nhiên bạn sẽ có đèn nền RGB đồng bộ và nhiều chế độ khác nhau để tha hồ thể hiện kỹ năng một cách “cool ngầu” hơn. Công nghệ Overstroke kích hoạt vị trí nhận lệnh cao hơn trên phím bấm, mang tới tốc độ phản hồi nhanh hơn. Tất nhiên không thể không nhắc đến độ bền của một sản phẩm TUF khi bàn phím Asus TUF Gaming F15 có tuổi thọ tới 20 triệu lần nhấn.

Âm thanh lớn và sống động
Với việc sở hữu hai loa nâng cấp và 4 âm thanh đầu ra, Asus TUF FX506LI HN039T cho âm lượng lớn gấp 1,8 lần và âm bass trầm hơn 2,7 lần so với thế hệ trước. Bạn sẽ được trải nghiệm âm thanh vòm ảo 7.1 nhờ công nghệ DTS:X, mang đến chất lượng âm thanh chuẩn phòng thu khi sử dụng tai nghe Stereo. Trong những trận chiến game hiện đại, âm thanh cũng đóng vai trò quan trọng, vì thế âm thanh chất lượng của Asus TUF FX506LI HN039T cũng là một vũ khí dành cho riêng bạn. Trên laptop còn có 8 chế độ âm thanh khác nhau để bạn có được trải nghiệm nghe đúng như ý thích với mỗi hoạt động nghe nhạc, xem phim hay chơi game.

Tản nhiệt thông minh
Hệ thống tản nhiệt cao cấp bao gồm nhiều ống tản nhiệt và 3 ống dẫn nhiệt giúp Asus TUF FX506LI-HN039T có khả năng tản nhiệt nhanh chóng. Thiết kế làm mát tự làm sạch thông minh đảm bảo hệ thống tản nhiệt hoạt động hiệu quả và lâu dài. Nhờ vậy bạn luôn có được hiệu năng ổn định trên Asus TUF FX506LI HN039T để tự tin giải trí với những trận chiến Game hấp dẫn.

Bền bỉ đạt chuẩn quân đội
Những chiếc laptop TUF Gaming luôn nổi tiếng với độ bền xuất sắc. Asus TUF FX506LI-HN039T đã vượt qua bài thử nghiệm độ bền chuẩn quân đội MIL-STD-810H. Các thử nghiệm như thả rơi, chống rung, nhiệt độ cao, nhiệt độ thấp hay độ ẩm đều đã được vượt qua trên chiếc TUF Gaming F15, để khi đến tay người tiêu dùng, đó sẽ là một chiếc laptop gaming vô cùng bền vững.', '3', '8', '512', '15.6", 1920 x 1080 Pixel, IPS, 144 Hz, 250 nits, LED Backlit', '2.3', 'Intel Core i5-10300H 2.50 GHz');

insert into `laptop`.`Product` values ('13', '4', 'Laptop Asus Strix G531GT HN553T', '25000000', '15', 'uploads/2020/11/18/637234211788755681_asus-tuf-fx505gt-xam-1.png', 'Sở hữu thiết kế tối giản nhưng không kém phần cá tính nhờ dải đèn LED cạnh dưới, Asus Strix G531GT HN553T cho bạn trải nghiệm chơi game hấp dẫn với cấu hình mạnh mẽ và màn hình 144Hz vô cùng mượt mà.

Sức mạnh của bộ vi xử lý Intel thế hệ thứ 9 và card rời GTX 1650
Asus Strix G531GT-HN553T được trang bị bộ vi xử lý Intel Core i5 9300H mạnh mẽ. Đây là con chip với 4 lõi 8 luồng, tốc độ tối đa 4.10GHz và bộ nhớ đệm 8MB. Bộ vi xử lý này kết hợp với card đồ họa rời NVIDIA GeForce GTX 1650 sử dụng kiến trúc Turing trứ danh mang tới khả năng “chiến” tốt mọi tựa game eSports và cả một số game AAA. Asus Strix G531GT HN553T có sẵn 8GB RAM DDR4-2666 MHz và ổ cứng SSD dung lượng lên tới 512GB, cho phép thoải mái cài đặt và chạy game với tốc độ nhanh chóng.


Mượt mà hơn bao giờ hết với màn hình 144Hz
Laptop sở hữu màn hình 15,6 inch độ phân giải Full HD có tần số quét vượt trội 144Hz, Asus Strix G531GT-HN553T mang đến sự khác biệt trong những trận chiến game của bạn. Tần số quét cao sẽ khai thác tối đa sức mạnh CPU, giải phóng tiềm năng để mang đến đồ họa siêu mượt mà ở mức FPS cực cao. Hơn thế nữa, bạn sẽ được tận hưởng những hình ảnh game hoành tráng trên màn hình viền siêu mỏng, chất lượng và sắc nét, bắt trọn mọi chuyển động.

Tăng cường hiệu quả tản nhiệt
Với thiết kế chăm chút tỉ mỉ cho việc làm mát, Asus Strix G531GT HN553T được đảm bảo luôn thông thoáng bằng mô-đun tản nhiệt tự làm sạch, đẩy bụi bẩy ra bên ngoài, kéo dài tuổi thọ các linh kiện. Những quạt kép cánh chữ N sẽ giúp tăng cường lưu thông không khí, đồng thời các lá tản nhiệt siêu mỏng giúp mở rộng diện tích bề mặt thoát nhiệt.


Sẽ có một phần mềm thông minh mang tên ROG Armoury Crate quản lý, đặc trưng của dòng laptop Asus ROG và chuyển đổi các chế độ vận hành để bạn có được hiệu năng cũng như độ ồn tối ưu nhất.

Âm thanh hấp dẫn, tăng cường trải nghiệm chơi game
Âm thanh sống động từ các loa side-firing của Asus Strix G531GT HN553T cho bạn đắm chìm vào từng trận chiến trong game. Công nghệ khuếch đại thông minh sẽ điều chỉnh công suất âm theo thời gian thực để âm thanh không chỉ sống động mà còn bền vững, tránh hư hại và vỡ tiếng sau thời gian dài sử dụng. Những âm bass dày khỏe, dải động âm cao sẽ tạo ra hiệu ứng tuyệt vời ở từng tiếng động trong game.


Hệ thống đèn LED đậm chất game thủ
Bàn phím của Asus Strix G nổi bật trong đêm tối với dải đèn màu sắc tùy chọn và cụm phím WASD trong suốt đầy phong cách. Hệ thống đèn Aura Sync còn có thể kết nối với các tựa game để tạo hiệu ứng chân thực và thú vị hơn bao giờ hết. Ngoài ra laptop còn có dải đèn LED mới nằm trên 3 cạnh máy. Hãy tắt đèn và thử tận hưởng không gian chơi game của riêng bạn.

Bàn phím bền vững, tối ưu cho chơi game
Được xây dựng dành riêng cho game thủ, bàn phím Asus Strix G531GT HN553T có các phím chức năng cùng độ giãn cách hợp lý giúp bạn có thể dễ dàng thao tác một cách trực quan và chính xác. Với độ bền tới hơn 20 triệu lần nhấn, Strix G luôn duy trì độ chính xác trong điều kiện chơi game cường độ cao.

Mạng Wi-Fi nhanh và ổn định hơn
Trên Asus Strix G531GT HN553T có công nghệ ROG RangeBoost, đảm bảo tín hiệu Wi-Fi ổn định nhất có thể. Kết hợp với Intel® 802.11ac (2x2) Gigabit Wi-Fi mới nhất với băng tần không dây tối đa lên tới 1,7Gbps, bạn có thể kết nối và chơi game tốc độ cao hầu như ở mọi nơi.


Thiết kế tối giản nhưng vẫn tỏa sáng
Asus Strix G531GT HN553T mang trên mình ngôn ngữ thiết kế hoàn toàn mới, với tiêu chí hình thức phục vụ chức năng, nghĩa là tất cả đều hướng đến mục đích chơi game. Bạn sẽ có vùng lưu thông khí 3D trong thiết kế, tạo nên hệ thống làm mát hiện đại nhất.

Những đường khoét tinh tế trên mặt lưng đảm bảo luồng khí lưu thông không giới hạn. Tất nhiên máy cũng không hề thiếu đi độ thẩm mỹ với vẻ đẹp hiện đại bằng các đường nét chạm khắc khéo léo, đèn LED ấn tượng và viền màn hình siêu mỏng.', '3', '8', '512', '15.6", 1920 x 1080 Pixel, IPS, 144 Hz, 250 nits, Anti-glare LED-backlit', '2.42', 'Intel Core i5-9300H 2.40 GHz');

insert into `laptop`.`Product` values ('14', '5', 'Laptop ASUS Expertbook B9450FA BM0616R', '49990000', '10', 'uploads/2020/11/18/637352469339459214_asus-zephyrus-ga401-xam-1.png', 'ASUS Expertbook B9450FA BM0616R thể hiện đẳng cấp đích thực của chiếc laptop doanh nhân 14 inch mỏng nhẹ và mạnh mẽ hàng đầu. Thiết kế tinh xảo, sức mạnh đáng kinh ngạc và thời lượng pin lên tới 24 tiếng tạo nên sản phẩm lý tưởng phục vụ công việc.

Hình ảnh tràn viền hấp dẫn chưa từng thấy
Màn hình của ASUS Expertbook B9450FA BM0616R đích thực là một tuyệt tác. Bạn sẽ được tận hưởng những hình ảnh tuyệt đẹp trên chiếc laptop viền mỏng bậc nhất hiện nay. Cả 4 phần viền siêu mỏng chỉ 4mm, cho tỉ lệ màn hình chiếm tới 94% diện tích máy, tấm nền chống lóa 14 inch độ phân giải Full HD sắc nét, hiển thị tuyệt hảo mọi hình ảnh một cách đầy sống động. Dù là làm việc hay giải trí, với màn hình quá đẹp, bạn sẽ có thêm rất nhiều niềm cảm hứng và sáng tạo.

Công nghệ âm thanh Harman Kardon sống động
Chất lượng âm thanh của ASUS Expertbook B9450FA BM0616R rất đáng nể nhờ sự tinh chỉnh của các chuyên gia đến từ hãng Harman Kardon danh tiếng. Công nghệ khuếch đại thông minh và loa lớn tạo nên hiệu ứng âm thanh vòm như những gì bạn thấy ở các rạp chiếu phim. Khả năng thu âm cũng rất được đầu tư với microphone trên viền màn hình, thu âm rõ và lọc ồn thông minh. Các cuộc họp trực tuyến sẽ luôn diễn ra với chất lượng âm thanh ổn định.

Kiệt tác của dòng laptop đương đại
Là một chiếc laptop có màn hình 14 inch nhưng trọng lượng của ASUS Expertbook B9450FA BM0616R chỉ chưa đến 1kg, mỏng nhẹ đến khó tin. Có được trọng lượng ấn tượng này là nhờ bộ khung làm từ những kim loại nhẹ lithium-magiê, cho trọng lượng nhẹ hơn nhưng lại cứng cáp hơn rất nhiều. ASUS Expertbook B9 trải qua 21 giai đoạn hoàn thiện, phay CNC độ chính xác cao và những đường nét tinh tế, để tạo nên một kiệt tác laptop đích thực, gây ấn tượng mạnh ngay từ cái nhìn đầu tiên.

Bền bỉ qua thời gian
ASUS Expertbook B9450FA BM0616R không chỉ là mẫu laptop thời trang mà nó còn hết sức bền bỉ và thậm chí còn đạt chuẩn quân đội Mỹ MIL-STD 810G. Laptop đã vượt qua rất nhiều bài kiểm tra nghiêm ngặt về độ bền bản lề, cổng kết nối, bàn phím, khả năng chịu lực của màn hình, va đập, thả rơi, rung lắc, độ ẩm, nhiệt độ, độ cao, … để đến tay người dùng là một sản phẩm hết sức bền vững, đáng tin cậy.

Sức mạnh đáng kinh ngạc ẩn chứa bên trong
Trong công việc, tốc độ luôn đóng vai trò rất quan trọng. ASUS Expertbook B9450FA BM0616R giúp bạn luôn đi trước đối thủ nhờ bộ vi xử lý Intel Core i7 10510U thế hệ thứ 10 mạnh mẽ và đặc biệt là ổ cứng 1TB SSD PCIe 3.0 siêu nhanh. Với tốc độ đọc lên tới 3500 MB/s, nhanh gấp 6,73 lần SSD Sata 3 thông thường, ASUS Expertbook B9450FA BM0616R có thể khởi động máy tính, mở ứng dụng trong chớp mắt, hoàn thành xuất sắc công việc của bạn.

Sử dụng tới 24 tiếng sau một lần sạc
ASUS Expertbook B9450FA BM0616R là chiếc laptop có thời lượng pin lâu bậc nhất hiện nay. Nhờ công nghệ Tự làm mới tấm nền tiết kiệm năng lượng, ASUS Expertbook B9450FA BM0616R có thể sử dụng liên tục trong tới 24 giờ chỉ sau một lần sạc. Laptop sẽ cùng bạn trong những cuộc họp kéo dài căng thẳng, những đêm thức khuya làm việc hay những chuyến bay dài. Hơn nữa, công nghệ sạc nhanh còn cho phép sạc được 60% pin chỉ sau 39 phút, để máy tính luôn sẵn sàng năng lượng.

Đầy đủ những kết nối hàng đầu
Dù có thiết kế siêu mỏng nhẹ nhưng bạn không hề phải đánh đổi cổng kết nối trên ASUS Expertbook B9450FA BM0616R. Trái lại, laptop vẫn có đầy đủ những cổng kết nối tiên tiến nhất hiện nay. Hai cổng Thunderbolt 3 USB-C siêu mạnh mẽ, cho khả năng truyền dữ liệu cực nhanh và kết nối đa năng; cổng HDMI; cổng USB 3.1 thế hệ thứ 2; jack tai nghe 3.5mm; khe khóa Kensington và thậm chí là cổng mạng RJ45 qua micro HDMI; tất cả tạo nên kết nối toàn diện với mọi thiết bị bạn cần.

Kết nối không dây siêu tốc
Không chỉ kết nối có dây mà kết nối không dây của ASUS Expertbook B9450FA BM0616R cũng rất cao cấp với chuẩn Wi-Fi 6 băng tần kép tiên tiến (802.11ax), nhanh gấp 3 lần Wi-Fi 5 (802.11ac) hiện nay. Bạn sẽ được tận hưởng kết nối Wi-Fi nhanh hơn, ổn định hơn và ở khoảng cách xa hơn. Chuẩn Bluetooth cũng được nâng lên 5.0 mới nhất, kết nối với nhiều thiết bị mà không tốn pin. Khả năng kết nối di động tuyệt vời giúp ASUS Expertbook B9450FA BM0616R trở nên cơ động hơn trong công việc.

Bàn phím chưa bao giờ thú vị đến thế
Để người dùng có được trải nghiệm tốt nhất, từng chi tiết nhỏ trên laptop ASUS Expertbook B9450FA-BM0616R đều được tối ưu hoàn hảo. Bàn phím thiết kế tinh tế, có đèn nền cho cảm giác gõ nhẹ nhàng, làm việc được cả trong đêm tối; phím số Numpad sẽ xuất hiện đầy thông minh trên khu vực Touchpad, giúp bạn nhập liệu nhanh chóng khi cần tính toán. Hơn nữa, ASUS Expertbook B9450FA BM0616R cũng được chế tác dạng bản lề ErgoLift thông minh, tự động nâng laptop lên một góc nghiêng nhỏ để cảm giác gõ thoải mái nhất.', '3', '16', '512', '14.0", 1920 x 1080 Pixels, IPS FHD', '0.996', 'i7 10510U 1.8GHz');

insert into `laptop`.`Product` values ('15', '5', 'Laptop Asus ZenBook Duo UX481FL BM048T', '30990000', '15', 'uploads/2020/11/18/637234211788755681_asus-tuf-fx505gt-xam-1_zyYojZW.png', 'Asus ZenBook Duo UX481FL là chiếc laptop có thiết kế đặc biệt mà bạn chưa từng nhìn thấy trước đây. Với hai màn hình độc đáo trên một thân máy cao cấp, ZenBook Duo UX481FL dường như là chiếc máy tính xách tay đến từ tương lai.

Định nghĩa lại phong cách thiết kế
Ngay từ màu sắc, Asus ZenBook Duo UX481FL dường như đã định nghĩa lại về một phong cách thiết kế hoàn toàn mới. Laptop có màu Lam vũ trụ đặc biệt, bóng bẩy sang trọng và mang đến một vẻ đẹp rất lạ. Trên thân máy được trang trí bởi các đường vân kim loại đồng tâm đặc trưng của dòng ZenBook. Các cạnh viền đều được cắt kim cương sắc sảo, tạo nên cảm giác cao cấp ở mọi vị trí. Tuy nhiên sự độc đáo và khác biệt nhất phải nói đến ở đây là bạn sẽ được chiêm ngưỡng chiếc laptop hai màn hình với kiểu dáng ngỡ như đến từ tương lai.

Màn hình phụ ScreenPad Plus, làm việc hiệu suất tối đa
Bên cạnh màn hình chính như mọi chiếc laptop thông thường khác, bạn còn có thêm một màn hình phụ Asus ScreenPad Plus ở khu vực ngay phía trên bàn phím. Đây là một màn hình cảm ứng có kích thước 12,6 inch, góc rộng 178 độ sẽ giúp bạn tăng năng suất làm việc tối đa bằng sự trực quan và những thao tác chưa từng có trước đây. Với mỗi hoạt động khác nhau, màn hình phụ ScreenPad Plus này sẽ được tùy biến để bạn có thể nắm bắt được nhiều nội dung và thao tác nhanh nhất có thể. Ví dụ bạn có thể kéo thả ứng dụng hoặc các thanh công cụ trên ScreenPad Plus để có nhiều không gian làm việc trên màn hình chính hơn. Không chỉ có ý nghĩa về mặt thiết kế, màn hình phụ còn cho chúng ta trải nghiệm làm việc tuyệt vời và sự sáng tạo vô tận.

Hoàn hảo cho mọi công việc chuyên nghiệp
Asus ZenBook Duo UX481FL được tối ưu hoàn hảo cho mọi công việc, đặc biệt là những tác vụ lập trình hay đồ họa. Hãy thử tưởng tượng về việc bạn đang chỉnh sửa ảnh, các công cụ nằm ở màn hình phụ và ảnh đang chỉnh sửa nằm ở màn hình chính; hoặc ảnh gốc nằm ở màn hình chính và ảnh chỉnh sửa nằm ở màn hình phụ; mọi thứ sẽ trở nên trực quan hơn rất nhiều. Công việc lập trình cũng tương tự, bạn sẽ quan sát được những dòng Code dài hơn nhờ sự bổ sung của màn hình thứ hai. Thậm chí khi bạn là một Game thủ chuyên stream game, một hình ảnh riêng biệt của webcam trên màn hình phụ sẽ giúp bạn tập trung chơi game hơn rất nhiều.

Tương thích với bút stylus cảm ứng
Công việc đồ họa, ghi chú, sáng tạo của bạn sẽ chưa bao giờ dễ dàng đến thế khi màn hình phụ của Asus ZenBook Duo UX481FL tương thích với bút cảm ứng stylus. Việc màn hình phụ đặt nằm ngang giúp bạn có một bàn vẽ thuận tiện và ổn định. Hãy ghi chú, phác họa ý tưởng hoặc thực hiện chỉnh sửa đồ họa một cách chính xác chưa từng thấy. Ngoài ra bạn còn có thêm một phần kê tay để những trải nghiệm gõ phím, viết, vẽ đều thoải mái hơn.

Sức mạnh hiệu năng đỉnh cao
Là chiếc laptop đến từ thế giới tương lai, Asus ZenBook Duo UX481FL cần phải đảm bảo hiệu năng dẫn đầu xu thế. Đây là một trong những máy tính đầu tiên trên thị trường trang bị bộ vi xử lý Intel Core i5 10210U thế hệ thứ 10 mới nhất. Đi kèm với con chip mạnh mẽ này, bạn còn có 512GB ổ cứng SSD cao cấp, card đồ họa rời NVIDIA GeForce MX250 và 8GB RAM. Sức mạnh này đủ để bạn hoàn thành tốt công việc, đặc biệt là những tác vụ về đồ họa; biên tập ảnh hay video; kể cả những tựa game nặng cũng đều chơi được trên Asus ZenBook Duo UX481FL.

Màn hình viền siêu mỏng
Không chỉ màn hình phụ mà bản thân màn hình chính của Asus ZenBook Duo UX481FL đã rất hấp dẫn với thiết kế viền siêu mỏng NanoEdge. Phần viền màn hình chỉ 3,5mm, giúp màn hình chiếm tới 90% thân máy, cho bạn trải nghiệm xem ấn tượng. Màn hình này có độ phân giải Full HD sắc nét, kích thước tiêu chuẩn 14 inch và công nghệ chỉnh màu chuyên nghiệp PANTONE Validated, mang đến màu sắc sống động khó quên.

Camera hồng ngoại, nhận diện khuôn mặt thông minh
Trên Asus ZenBook Duo UX481FL có tích hợp camera hồng ngoại, để bạn có thể đăng nhập dễ dàng qua phương thức bảo mật nhận diện khuôn mặt. Nhờ camera hồng ngoại, máy tính sẽ nhanh chóng nhận diện được bạn, dù là trong bóng tối để mở khóa máy ngay lập tức mà không cần phải thêm bất cứ thao tác nào.

Kết nối siêu tốc độ
Dù là một chiếc ultrabook mỏng nhẹ di động thuộc dòng Asus Zenbook, nhưng ZenBook Duo vẫn có đầy đủ các kết nối thông dụng để phục vụ tốt cho công việc. Bạn sẽ có đầu đọc thẻ microSD; jack Audio; 2 cổng USB 3.1 type-A cơ bản; cổng HDMI và đặc biệt là cổng USB Type-C 3.1 Gen 2 tiên tiến. Ngoài ra, kết nối không dây cũng ấn tượng không kém khi chuẩn Intel Wi-Fi 6 mới nhất với Gig+ (802.11ax) cho bạn tốc độ mạng lên một tầm cao mới mượt mà, siêu tốc độ.

Âm thanh Harman Kardon cao cấp
Âm thanh trên Asus ZenBook Duo được phát triển bởi đội ngũ Asus Golden Ear và các chuyên gia của Harman Kardon, mang đến chất lượng âm thanh cao cấp. Sự kết hợp tùy chỉnh giữa phần cứng – trong đó có công nghệ bộ khuếch đại thông minh cho âm lượng lớn hơn mà không bị méo tiếng – và phần mềm được thiết kế khéo léo để bạn có được trải nghiệm âm thanh hàng đầu.

Độ bền chuẩn quân đội
Dù mỏng manh và thời trang nhưng Asus ZenBook Duo UX481FL lại là một chiếc laptop vô cùng chắc chắn. Máy tính đã vượt qua chuẩn quân đội MIL-STD-810G, có độ bền đủ để hoạt động được trong những môi trường khắc nghiệt, bao gồm độ cao, nhiệt độ và độ ẩm. Hãy yên tâm về chất lượng chiếc máy tính xách tay ZenBook Duo của bạn.', '3', '8', '512', '14.0", 1920 x 1080 Pixel, IPS, 60 Hz, Đang cập nhật, LED-backlit', '2.15', 'Intel Core i5-10210U 1.60 GHz');

insert into `laptop`.`Product` values ('16', '2', 'Laptop Dell Vostro V3490', '10990000', '15', 'uploads/2020/11/18/dell1.png', 'Chiếc laptop Vostro mới nay đã mỏng nhẹ và cơ động hơn. Với màn hình Full HD sắc nét, cấu hình xuất sắc và khả năng bảo mật tuyệt vời, Dell Vostro V3490 sẽ giúp công việc của bạn trở nên thực sự dễ dàng.

Mỏng nhẹ và di động
Dell Vostro V3490 vẫn giữ ngôn ngữ thiết kế đặc trưng của dòng Vostro là sự đơn giản, hiện đại và đề cao độ bền. Tuy nhiên điểm nổi bật ở đây là máy đã mỏng nhẹ di động hơn rất nhiều. Với độ mỏng chưa đến 2cm và trọng lượng chỉ khoảng 1,7kg, Dell Vostro V3490 rất dễ dàng để bạn mang đi bất cứ đâu. Toàn thân máy có màu đen tuyền, các cạnh khá mỏng và phần chân đế kê máy lên cao hơn một chút so với mặt bàn. Chi tiết nhỏ này giúp cho laptop không trực tiếp chạm vào mặt bàn, chống xước máy đồng thời tản nhiệt hiệu quả hơn.

Độ bền chuẩn Dell
Vật liệu chính làm nên Dell Vostro V3490 là nhựa tổng hợp vô cùng bền vững, kết cấu chắc chắn và giảm thiểu rủi ro khi va đập. Dell Vostro V3490 đã vượt qua những bài kiểm tra về độ bền trước khi đến tay người dùng, chính vì thế bạn hoàn toàn có thể yên tâm sử dụng.

Nền tảng bảo mật hàng đầu
Với một cảm biến vân tay tích hợp ngay trên phím nguồn, bạn có thể đăng nhập nhanh chóng và an toàn chỉ với một cú chạm. Hơn nữa Dell Vostro V3490 còn mang trên mình nền tảng bảo mật Trusted Platform Module 2.0, tính năng bảo mật dựa trên phần cứng để tạo và quản lý khóa mã hóa do máy tính tạo ra. Nhờ vậy bạn có thể bảo mật và mã hóa mật khẩu, dấu vân tay và những thông tin quan trọng khác. Việc bảo mật bằng TPM giúp kể cả bạn có bị đánh cắp ổ cứng, những dữ liệu cũng không thể bị xâm nhập, hết sức an toàn.

Sức mạnh từ bộ vi xử lý Intel thế hệ thứ 10
Dell Vostro V3490 được trang bị bộ vi xử lý Intel Core i3 10110U, con chip thuộc thế hệ thứ 10 Comet Lake. Với 2 nhân 4 luồng và tốc độ xung nhịp tối đa 4.10 GHz, Intel Core i3 10110U đảm bảo để Dell V3490 có thể chạy tốt những tác vụ công việc bạn cần, đặc biệt là công việc văn phòng. Ngoài ra bạn còn có 4GB RAM DDR4, dễ dàng nâng cấp với 2 khe cắm RAM. Tốc độ của máy tính cũng được nâng cao toàn diện nhờ việc sử dụng ổ cứng SSD 256GB. Dell Vostro V3490 đủ mạnh mẽ để đáp ứng tốt nhu cầu làm việc của người dùng.

Loạt kết nối phục vụ công việc
Với mục đích chính là phục vụ cho công việc, Dell Vostro V3490 có rất nhiều cổng kết nối. Bạn sẽ có 3 cổng USB type-A cơ bản bao gồm 2 cổng USB 2.1 Gen 1 và 1 cổng USB 2.0. Ngoài ra còn có cổng mạng, đầu đọc thẻ micro SD, cổng HDMI và cả cổng VGA vốn hiếm thấy trên laptop hiện nay. Nhờ kết nối đầy đủ, bạn có thể kết nối với hầu hết thiết bị ngoại vi một cách tiện lợi.

Dell Mobile Connect, kết nối với smartphone
Dell Mobile Connect sẽ kết nối laptop Dell Vostro V3490 của bạn với smartphone dù chạy nền tảng iOS hay Android. Nhờ vậy, bạn có thể nhận thông báo cuộc gọi, tin nhắn hay các ứng dụng khác từ điện thoại và hiển thị ngay trên màn hình máy tính. Công việc sẽ diễn ra trôi chảy hơn khi bạn chỉ tập trung vào một màn hình, không bị phân tâm mà vẫn không bỏ qua những thông báo quan trọng.

Màn hình Full HD, hiển thị sắc nét
So với các đối thủ trong tầm giá, Dell Vostro V3490 nổi bật với màn hình 14 inch độ phân giải Full HD sắc nét, giúp cho công việc cũng như giải trí của bạn trở nên trực quan hơn. Độ phân giải cao vượt trội cũng mang đến không gian màn hình hiển thị rộng lớn hơn, theo dõi nội dung và thao tác dễ dàng hơn, từ đó bạn sẽ hoàn thành công việc một cách hiệu quả.', '1', '4', '256', '14.0", 1920 x 1080 Pixel, Đang cập nhật, 60 Hz, Đang cập nhật, Anti-glare LED-backlit', '1.72', 'Intel Core i3-10110U 2.10 GHz');

insert into `laptop`.`Product` values ('17', '3', 'Laptop Dell Inspiron N3593', '16190000', '10', 'uploads/2020/11/18/dell2.png', 'Sức mạnh đáng tin cậy từ bộ vi xử lý Intel Core i5 thế hệ thứ 10 mới nhất cùng card đồ họa rời giúp Dell Inspiron N3593 trở thành phương tiện làm việc lý tưởng, đáp ứng mọi nhu cầu của bạn.

Thiết kế đơn giản, đề cao độ bền
Dell Inspiron N3593 có thiết kế đậm chất máy Dell với ưu điểm là bền đẹp và cứng cáp. Toàn thân máy đều được làm từ màu đen tuyền, đơn giản nhưng sang trọng và không bao giờ bị lỗi thời. Độ bền là điều không phải bàn cãi trên Dell Inspiron N3593 khi mỗi chiếc máy đến tay người dùng đều đã trải qua những bài kiểm tra khắc nghiệt về nhiệt độ, bản lề, bàn phím và cả các linh kiện bên trong. Chính vì thế máy có khả năng chống sốc, hạn chế rủi ro khi va đập và độ bền theo năm tháng.

Chất lượng hình ảnh chuẩn Dell
Chất lượng từ một màn hình Full HD sẽ giúp bạn dễ dàng hơn trong công việc. Màn hình lớn 15,6 inch, hiển thị sắc nét, màu sắc chính xác khiến mọi nội dung đều trở nên rõ ràng, sống động ngay trước mắt. Dễ dàng theo dõi và không bỏ sót bất cứ thông tin nào trên Dell Inspiron N3593. Hơn nữa, việc sở hữu một màn hình đẹp cũng giúp bạn giải trí tốt hơn khi xem phim hay chơi game.

Hiệu năng tuyệt vời, làm việc hiệu quả
Cấu hình của Dell Inspiron N3593 không chỉ mạnh mà còn là mới nhất khi đặt cạnh các đối thủ trong tầm giá. Dell Inspiron 3593 trang bị bộ vi xử lý Intel Core i5 1035G1 thuộc thế hệ thứ 10 Ice Lake. Con chip này có 4 nhân 8 luồng, xung nhịp tối đa 3,60 GHz, mạnh mẽ và tiết kiệm điện năng. Bên cạnh đó bạn còn có 4 GB RAM DDR4 và ổ cứng thể rắn SSD 256GB cao cấp. Nhờ bộ vi xử lý mạnh mẽ cùng ổ cứng SSD siêu tốc, Dell Inspiron N3593 luôn chạy rất nhanh, từ việc khởi động cho đến mở các ứng dụng cũng như hoạt động đa nhiệm, đảm bảo công việc của bạn diễn ra thông suốt.

Card rời NVIDIA MX230, xử lý đồ họa chuyên nghiệp
Dell Inspiron N3593 trang bị card đồ họa rời NVIDIA GeForce MX230 2GB, giúp máy thêm phần mạnh mẽ, đặc biệt trong các ứng dụng đồ họa. Việc có card rời giúp cho Dell Inspiron N3593 chạy những phần mềm đồ họa, chỉnh sửa ảnh và video nhanh chóng, mượt mà hơn. Đồng thời khi bạn muốn giải trí với những tựa game, hiệu năng của Dell N3593 cũng sẽ vượt trội so với những laptop chỉ có card màn hình on board.

Đồng bộ hoàn hảo cùng smartphone
Trên Dell Inspiron N3593, bạn có thể kết nối liền mạch với điện thoại thông minh qua giải pháp mang tên Dell Mobile Connect. Dell Mobile Connect cho phép ghép nối smartphone iOS hoặc Android với laptop, giúp bạn có thể nhận cuộc gọi, tin nhắn, thông báo và các ứng dụng khác ngay trên màn hình máy tính. Nhờ vậy, bạn sẽ tập trung vào công việc hơn mà vẫn không bị bỏ lỡ những thông báo quan trọng. Kết nối này cũng được Dell đảm bảo sự an toàn, để dữ liệu của bạn hoàn toàn được bảo vệ, không bị tin tặc xâm hại.

Cổng kết nối tiên tiến
Nhằm phục vụ tối ưu cho công việc, Dell Inspiron N3593 có đầy đủ mọi kết nối phổ biến hiện nay. Bạn có thể kết nối với TV hoặc màn hình lớn qua cổng HDMI; tải ảnh nhanh chóng qua khe cắm thẻ SD hay tận hưởng tốc độ truyền dữ liệu nhanh qua hai cổng USB 3.1 Gen 1. Thậm chí Dell Inspiron N3593 còn tích hợp cả cổng kết nối USB Type-C tiên tiến nhất hiện nay, cho khả năng kết nối vượt trội và tốc độ nhanh hơn bao giờ hết.', '1', '4', '256', '15.6", 1920 x 1080 Pixel, Đang cập nhật, 60 Hz, Đang cập nhật, LED-backlit', '1.75', 'Intel Core i5-1035G1 1.00 GHz');

insert into `laptop`.`Product` values ('18', '5', 'Laptop Dell Inspiron G7 N7591', '25490000', '15', 'uploads/2020/11/18/dell3.png', 'Nằm ở phân khúc laptop cao cấp, Dell Inspiron N7591 là phương tiện làm việc lý tưởng của những doanh nhân thành đạt khi sở hữu thiết kế cơ động, màn hình lớn và hiệu năng cực đỉnh.

Thiết kế sang trọng lịch lãm, siêu gọn nhẹ
Dell Inspiron N7591 được chế tác như một tác phẩm nghệ thuật khi sở hữu ngoại hình rất thanh lịch, mỏng nhẹ đến không ngờ. Toàn thân laptop có màu trắng bạc thời trang, hoàn thiện chắc chắn và vát mỏng đều ở các góc cạnh. Trọng lượng máy chỉ chưa đến 2kg, rất nhẹ đối với một chiếc máy tính màn hình 15,6 inch hiệu năng cao. Bạn có thể dễ dàng mang Dell N7591 đi bất cứ đâu nhờ tính siêu di động của máy.

Màn hình lớn 15,6 inch tràn viền hoàn hảo
Là một chiếc laptop cao cấp, Dell Inspiron N7591 sở hữu màn hình rất ấn tượng. Màn hình này có kích thước 15,6 inch độ phân giải Full HD sắc nét, viền mỏng đều ở tất cả các cạnh bên. Khi bạn xem video, hình ảnh sống động như thế giới thực, màu sắc phong phú và rực rỡ, cho bạn đắm chìm vào những bộ phim yêu thích. Bên cạnh màn hình xuất sắc, hệ thống âm thanh Waves MaxxAudio Pro cho chất lượng âm thanh lớn, rõ ràng, sắc nét như trải nghiệm phòng thu. Tất cả sẽ mang đến trải nghiệm giải trí hoàn hảo.

Ấn tượng với bộ vi xử lý Intel thế hệ thứ 9
Dell Inspiron N7591 một trong những laptop đầu tiên được trang bị bộ vi xử lý Intel Core i5 thế hệ thứ 9. Con chip 9300H trên Dell N7591 có 4 nhân 8 luồng, bộ nhớ đệm 8MB SmartCache và tốc độ CPU 2.4GHz – 4.1GHz. Với bộ vi xử lý này, Dell Inspiron N7591 có khả năng xử lý mượt mà, nhanh chóng mọi tác vụ. Đi cùng với con chip mạnh mẽ, laptop có sẵn 8GB RAM DDR4 và 2 khe cắm RAM, xử lý đa nhiệm hoàn hảo, dễ dàng nâng cấp.

Card rời mạnh mẽ, đồ họa và chơi game hiệu quả
Là chiếc laptop phục vụ cho công việc, Dell Inspiron N7591 đủ sức để giải quyết những tác vụ phức tạp như xử lý đồ họa. Có sẵn card rời NVIDIA GeForce GTX 1050 vô cùng mạnh mẽ, Dell N7591 không chỉ chạy tốt những phần mềm đồ họa chuyên sâu mà còn chơi được những tựa game đòi hỏi cấu hình cao trên máy tính. Dù là bất cứ tác vụ nào, Dell Inspiron 7591 cũng hoàn thành xuất sắc nhờ hiệu năng lý tưởng.

Sự khác biệt từ ổ cứng SSD thế hệ mới
Dell Inspiron N7591 sử dụng ổ cứng thể rắn SSD cao cấp, cho tốc độ truyền dữ liệu nhanh hơn, vận hành êm ái và độ bền vượt trội so với ổ cứng HDD thông thường. Bên cạnh 256GB SSD sẵn có, bạn còn có thể nâng cấp dễ dàng bằng cách lắp thêm ổ cứng để tăng cường không gian lưu trữ.


Tản nhiệt thông minh
Với một chiếc laptop thiết kế mỏng cấu hình cao thì tản nhiệt luôn là vấn đề nan giải. Tuy nhiên bạn không cần phải lo lắng về tản nhiệt trên Dell Inspiron N7591. Nhờ hai ống tản nhiệt thông minh chạy xung quanh các linh kiện quan trọng và hệ thống quạt kép, laptop luôn luôn mát mẻ, đảm bảo hiệu suất ổn định dù sử dụng trong thời gian dài. Ngoài ra, thiết kế bản lề tinh tế của Dell N7591 nâng nhẹ laptop lên một chút so với mặt bàn, tăng cường khả năng lưu thông không khí, mang đến khả năng tản nhiệt hiệu quả hơn.
Cổng kết nối Thunderbolt 3 tiên tiến
Cổng USB Type-C hỗ trợ Thunderbolt 3 trên Dell N7591 là cổng kết nối ưu việt bậc nhất hiện nay. Bạn có thể sạc laptop, kết nối nhiều thiết bị với tốc độ truyền dữ liệu lên tới 40Gbps, gấp 8 lần so với USB 3.1 Gen 1. Ngoài ra, Dell Inspiron 7591 vẫn có đầy đủ các cổng kết nối hỗ trợ công việc như USB 3.1 Gen 1, 

Người bạn đồng hành đáng tin cậy
Dell Inspiron 7591 được thiết kế để làm người đồng hành luôn luôn hiểu bạn muốn gì. Hệ thống cảm biến sẽ nhận diện bạn đang cầm laptop trong tay, để trên đùi hay trên bàn. Khi bạn đặt máy trên đùi, laptop sẽ giảm nhiệt độ, không làm bạn khó chịu vì máy nóng. Còn khi bạn để máy tính trên bàn, toàn bộ sức mạnh sẽ được giải phóng để bạn có được hiệu suất làm việc tối đa.


Mở khóa nhanh chóng sau một chạm
Một đầu đọc vân tay được tích hợp ngay trên phím nguồn của Dell N7591, cho phép bạn mở khóa và đăng nhập chỉ sau một lần chạm. Không cần nhập mật khẩu và đảm bảo an toàn, Dell Inspiron 7591 luôn khiến bạn yên tâm về bảo mật.', '1', '8', '256', '15.6", 1920 x 1080 Pixel, Đang cập nhật, Đang cập nhật, Đang cập nhật, LED-backlit', '2', 'Intel Core i5-9300H 2.40 GHz');

insert into `laptop`.`Product` values ('19', '3', 'Laptop Lenovo IdeaPad Flex 5 14ARE05', '18990000', '15', 'uploads/2020/11/18/l1.png', 'Không chỉ là chiếc laptop 2 trong 1 tiện lợi với khả năng sử dụng như một máy tính bảng, Lenovo IdeaPad Flex 5 còn sở hữu sức mạnh vượt trội trong tầm giá nhờ bộ vi xử lý AMD Ryzen 7 4000 series siêu mạnh mẽ.

Lenovo IdeaPad Flex 5

Mạnh mẽ đến khó tin
Dù là một chiếc laptop di động 2-in-1 nhưng cấu hình của Lenovo IdeaPad Flex 5 quả là rất đáng kinh ngạc. Phiên bản trong bài trang bị bộ vi xử lý AMD Ryzen 7 4700U, con chip mới nhất từ nhà AMD với 8 lõi 8 luồng, tốc độ tối đa lên tới 4.1GHz và đặc biệt là sản xuất trên tiến trình 7nm. Nhờ tiến trình mới, Lenovo IdeaPad Flex 5 có hiệu năng đa nhân mạnh mẽ và rất tiết kiệm điện. Bên cạnh đó laptop còn sở hữu 8GB RAM DDR4 3200MHz, 512GB ổ cứng SSD cho tốc độ siêu nhanh, khả năng hoạt động mượt mà ổn định.

cấu hình Lenovo IdeaPad Flex 5

Kiểu dáng nhỏ gọn, hiện đại
Không cần phải quá cầu kỳ, Lenovo IdeaPad Flex 5 đi theo ngôn ngữ thiết kế phẳng đơn giản, hiện đại. Toàn thân laptop là những đường vát tinh tế, mặt lưng hoàn toàn phẳng, bản lề cứng cáp và màn hình viền mỏng hấp dẫn. Máy có màu xám đen thanh lịch, siêu mỏng nhẹ với trọng lượng 1,55kg và độ mỏng 1,79cm, sẵn sàng đồng hành cùng bạn trên mọi nẻo đường.

thiết kế Lenovo IdeaPad Flex 5

Laptop, máy tính bảng và hơn thế nữa trong một thiết bị duy nhất
Với khả năng xoay lật 360 độ và màn hình cảm ứng, Lenovo IdeaPad Flex 5 vừa là laptop, vừa có thể “hô biến” thành một chiếc máy tính bảng khi cần. Thậm chí bạn có thể để máy dưới dạng “lều” hay dạng trình chiếu một cách linh hoạt. Tha hồ sáng tạo theo cách riêng, Lenovo IdeaPad Flex 5 sẽ mang đến sự tiện dụng nhất cho nhu cầu của bạn.

máy tính bảng Lenovo IdeaPad Flex 5

Màn hình cảm ứng cực nhạy, hỗ trợ bút cảm ứng
Lenovo IdeaPad Flex 5 sở hữu màn hình 14 inch độ phân giải Full HD viền mỏng tuyệt đẹp, hiển thị sắc nét và sống động ở mọi góc độ. Không chỉ vậy, màn hình này còn tích hợp tính năng cảm ứng đa điểm cực nhạy, cho bạn thao tác trực tiếp lên màn hình để sử dụng như một chiếc máy tính bảng cỡ lớn. Chưa hết, Lenovo còn tặng kèm bút cảm ứng Lenovo Active Pen để bạn ghi chú, viết vẽ dễ dàng và chân thực hơn. Biết đâu đây chính là nơi khởi nguồn ý tưởng cho thành công tương lai của bạn.

màn hình Lenovo IdeaPad Flex 5

Nâng tầm giải trí nhờ âm thanh Dolby Audio
Chất lượng giải trí trên Lenovo IdeaPad Flex 5 được nâng tầm nhờ hệ thống âm thanh Dolby Audio ấn tượng. Với hai loa ngoài nằm ngay bên cạnh bàn phím, âm thanh sẽ trực tiếp hướng vào phía trước bạn, kết hợp thêm chất âm chi tiết và mạnh mẽ từ Dolby Audio, những bài hát, bộ phim sẽ trở nên hấp dẫn hơn bao giờ hết.

giải trí Lenovo IdeaPad Flex 5

Sử dụng suốt cả ngày
Lenovo IdeaPad Flex 5 có thời lượng pin rất đáng nể, xứng đáng là chiếc laptop siêu di động. Bạn có thể sử dụng trong khoảng 12 tiếng với hoạt động văn phòng; hoặc xem video Full HD 1080p liên tục trong tới 13 tiếng. Hơn nữa, laptop còn tích hợp công nghệ sạc nhanh Rapid Charge, chỉ mất 15 phút sạc để có thêm 2 giờ sử dụng.

pin Lenovo IdeaPad Flex 5

Đăng nhập máy chỉ sau một cú chạm
Nhanh chóng đăng nhập không cần mật khẩu với cảm biến vân tay trên Lenovo IdeaPad Flex 5. Chỉ cần một cú chạm, máy sẽ tự động đăng nhập ngay lập tức mà không phải mất công nhập mật khẩu.', '6', '8', '256', '14", 1920 x 1080 Pixels , 60Hz, TN, 60 Hz, 220 nits, FHD Touch', '1.55', 'AMD Ryzen 7-4700H 2.00 GHz');

insert into `laptop`.`Product` values ('20', '5', 'Lenovo IdeaPad Gaming 3 15ARH05', '25990000', '17', 'uploads/2020/11/18/l4.png', 'Sở hữu sức mạnh tuyệt đỉnh của bộ vi xử lý AMD Ryzen 7 4000 series, Lenovo IdeaPad Gaming 3 tự tin mang đến cho game thủ những trải nghiệm đáng nhớ.


Kiểu dáng đơn giản, bền bỉ và gọn nhẹ
Lenovo IdeaPad Gaming 3 15ARH05 có kiểu dáng không quá “hầm hố” như những mẫu laptop gaming khác, thay vào đó máy đi theo xu hướng thanh lịch và đề cao tính di động. Phần viền màn hình được làm mỏng giúp thu gọn kích thước laptop đáng kể, đồng thời trọng lượng chỉ 2,2kg cho phép bạn có thể dễ dàng mang theo chiếc laptop gaming của mình đi bất cứ đâu. Phiên bản trong bài viết có màu xanh trẻ trung, bên cạnh đó sự cứng cáp và độ bền đáng kinh ngạc giúp Lenovo IdeaPad Gaming 3 15ARH05 luôn bền vững qua năm tháng.


Màn hình viền mỏng hấp dẫn
Màn hình Lenovo IdeaPad Gaming 3 15ARH05 có viền cạnh siêu mỏng, tạo hiệu ứng thị giác hấp dẫn khi hình ảnh dường như nổi lên khỏi màn hình. Hãy thử tưởng tượng các nhân vật trong game của bạn xuất hiện một cách hoành tráng, sinh động trên màn hình 15,6 inch Full HD viền mỏng tuyệt đẹp của Lenovo IdeaPad Gaming 3, bạn sẽ có những giờ phút chơi game thú vị hơn bao giờ hết.

Mạnh mẽ dẫn đầu cuộc đua
Những bộ vi xử lý mạnh mẽ từ AMD đang được các game thủ săn đón, nhất là những con chip thuộc thế hệ Ryzen 4000 series mới nhất. Lenovo IdeaPad Gaming 3 15ARH05 trang bị AMD Ryzen 7 4800H, bộ vi xử lý siêu mạnh mẽ với 8 lõi 16 luồng, tốc độ 2.9 – 4.2GHz và đặc biệt là sản xuất trên tiến trình 7nm vô cùng tiên tiến. Sở hữu nhiều nhân và tiến trình 7nm giúp hiệu năng đa luồng của Ideapad Gaming 3 cực mạnh, không chỉ giúp chơi game tốt mà khả năng đồ họa, dựng video cũng rất đỉnh.

cấu hình Lenovo IdeaPad Gaming 3

Hiệu suất đồ họa đột phá
Card đồ họa rời có mặt trên Lenovo IdeaPad Gaming 3 15ARH05 là NVIDIA GeForce GTX 1650 4GB. Đây là card đồ họa được xây dựng trên kiến trúc NVIDIA Turing đột phá, cho trải nghiệm chơi game nhanh chóng, hiệu ứng đồ họa đẹp mắt. Tha hồ chơi game mượt mà trên chiếc laptop gaming yêu thích, đặc biệt là những tựa game eSports phổ biến hiện nay.


Bộ nhớ RAM và SSD siêu tốc hiệu năng cao
Lenovo IdeaPad Gaming 3 15ARH05 được xây dựng để mọi thứ hoạt động với hiệu suất và tốc độ nhanh chóng nhất. Với 8GB RAM DDR4 3200MHz hiệu năng cao và 512GB ổ cứng SSD PCIe, Lenovo IdeaPad Gaming 3 15ARH05 khởi động, chạy ứng dụng, tải game cực nhanh. Bạn cũng có thể nâng cấp thêm RAM và bộ nhớ dễ dàng nếu có nhu cầu.

Công nghệ sạc nhanh tiện lợi
Nhờ công nghệ sạc nhanh Rapid Charge, bạn có thể nhanh chóng nạp đầy năng lượng Lenovo IdeaPad Gaming 3 15ARH05 để chơi game bất cứ đâu mà không cần nguồn sạc. Chỉ sau 1 giờ, dung lượng pin sẽ tăng từ 0 lên 80%, đủ cho bạn thoải mái “chiến game”.

Bàn phím laptop hoàn hảo cho game thủ
Những chiếc laptop Lenovo luôn nổi tiếng về độ nhạy và cảm giác thoải mái trên bàn phím. Lenovo IdeaPad Gaming 3 15ARH05 sở hữu bàn phím đầy đủ với các phím bấm lớn, thiết kế mũ lõm công thái học, hành trình phím 1,5mm tối ưu cho game thủ để bạn có thể thao tác nhanh và chính xác nhất, có được lợi thế trong những trận “chiến game” căng thẳng. Đèn nền màu xanh đầy phong cách sẽ giúp bạn chơi game tốt ngay cả khi trong phòng không có chút ánh sáng.', '6', '8', '512', '15.6", 1920 x 1080 Pixel, IPS, 60 Hz, 250 nits, Đang cập nhật', '1.5', 'AMD Ryzen 7-4800H 2.90 GHz');

insert into `laptop`.`Product` values ('21', '5', 'Laptop Lenovo ThinkPad X1 Carbon 8', '45000000', '10', 'uploads/2020/11/18/l5.png', 'CPU	Intel Core i5-10210U 1.60 GHz
RAM	16 GB LPDDR3 2133 MHz
Màn hình	14.0", 2560 x 1440 Pixel, WVA, 60 Hz, 300 nits, WVA Anti-glare LED Backlit Narrow Border
Card đồ họa	Intel UHD Graphics
Ổ cứng	Đang cập nhật
Hệ điều hành	Windows 10
Trọng lượng (kg)	1.1
Kích thước (WxDxH)	323 x 216 x 14.9
Xuất xứ	Trung Quốc
Năm ra mắt	2020', '6', '16', '1', '14.0", 2560 x 1440 Pixel, WVA, 60 Hz, 300 nits, WVA Anti-glare LED Backlit Narrow Border', '1.2', 'Intel Core i5-10210U 1.60 GHz');

insert into `laptop`.`Product` values ('22', '4', 'Lenovo Legion 5 15IMH05', '23490000', '20', 'uploads/2020/11/18/l3.png', 'Hiệu suất mạnh mẽ trong một vẻ ngoài gọn gàng, thiết kế tối giản, Lenovo Legion 5 15IMH05 sẵn sàng cùng bạn chinh phục mọi trận chiến, thao tác chính xác trên bàn phím chơi game tối ưu.

Lenovo Legion 5 15IMH05

Hiệu năng mạnh mẽ, tốc độ dẫn đầu
Trang bị bộ vi xử lý Intel Core i5 10300H thuộc thế hệ thứ 10, Lenovo Legion 5 15IMH05 mang đến tốc độ cực nhanh, dù là khi bạn làm việc hay chơi game. Con chip với 4 lõi 8 luồng, tốc độ 2.50 – 4.50 GHz đủ sức mạnh cho mọi cuộc đua đường dài. Bạn có thể giải trí với những tựa game eSports mượt mà, hoặc chơi game bom tấn AAA ở thiết lập đồ họa trung bình. Công việc cũng được đáp ứng hiệu quả với sức mạnh của Lenovo Legion 5 15IMH05.

cấu hình Lenovo Legion 5 15IMH05

Card đồ họa rời GTX 1650
Khả năng chơi game của Lenovo Legion 5-15ARH05 được nâng tầm mạnh mẽ khi trang bị GPU NVIDIA GeForce GTX 1650. Nhờ kiến trúc NVIDIA Turing danh tiếng, GTX 1650 tạo nên hiệu ứng đổ bóng chân thực, tăng cường hiệu suất xử lý, hoạt động mát và êm hơn trong từng tựa game.

card rời Lenovo Legion 5 15IMH05

Trải nghiệm mượt mà trên màn hình 120Hz
Một thế giới game chân thực với những hình ảnh đẹp sống động sẽ hiện lên ngay trước mắt bạn qua màn hình 15,6 inch Full HD viền siêu mỏng. Chất lượng hiển thị chi tiết, hình ảnh sắc nét và hiệu ứng màn hình tràn viền giúp mọi thứ trở nên hấp dẫn hơn bao giờ hết. Hơn nữa, màn hình Lenovo Legion 5 15IMH05 còn có tần số quét 120Hz, cho hình ảnh game mượt mà hơn rất nhiều. Bạn có thể cảm nhận được sự khác biệt và dành lợi thế trong từng trận game.

màn hình Lenovo Legion 5 15IMH05

Sống động tới từng chất âm
Cảm nhận âm thanh mạnh mẽ qua hệ thống loa Harman Kardon 2W của Lenovo Legion 5-15ARH05. Từng âm thanh đều được phát ra lớn, âm sắc chi tiết, giúp trận chiến game của bạn thêm phần sống động. Nếu bạn cắm tai nghe, âm thanh vòm 3D của Dolby Atmos còn làm mọi thứ trở nên ấn tượng hơn nữa. Bạn sẽ nghe rõ cả tiếng bước chân hay thậm chí là tiếng hơi thở của kẻ thù để nhanh chóng đưa ra quyết định chính xác.

âm thanh Lenovo Legion 5 15IMH05

Đơn giản, di động và bền vững
Bạn có thể cảm nhận được vẻ đẹp của sự hiện đại và đầy tính công nghệ trên Lenovo Legion 5 15ARH05. Thiết kế của máy là sự kết hợp hoàn hảo giữa tính thực tế, độ chính xác, hiệu suất và thời trang. Từng chi tiết như bản lề, logo, kiểu dáng, chất liệu phủ polymer bền vững tạo nên chiếc laptop vuông vắn, tuyệt đẹp và thể hiện cá tính mạnh mẽ.

thiết kế Lenovo Legion 5 15IMH05

Nhanh chóng tản nhiệt
Là một chiếc laptop chơi game di động, bạn có thể chơi game ở bất cứ đâu mà Legion 5 vẫn đảm bảo hiệu năng tốt nhờ hệ thống tản nhiệt Legion Coldfront 2.0 tiên tiến. Thông qua cơ chế tản nhiệt kép, bao gồm 67 cánh quạt được phủ polymer tinh thể lỏng và ống dẫn nhiệt bằng đồng chuyên dụng, Lenovo Legion 5-15ARH05 nhanh chóng tản nhiệt để laptop luôn có được hiệu suất tốt nhất. Trên máy tính bạn cũng có thể lựa chọn các chế độ hiệu năng khác nhau dựa theo tác vụ đang sử dụng để Legion 5 luôn hoạt động hiệu quả, êm ái và mạnh mẽ.

tản nhiệt Lenovo Legion 5 15IMH05

Bàn phím chuẩn gaming
Trong mỗi trận chiến, đôi khi thắng bại chỉ được quyết định trong một phần nghìn giây. Lenovo Legion 5-15ARH05 luôn thấu hiểu bạn với bàn phím Legion TrueStrike có hành trình phím tối ưu 1,5mm, phím bấm sâu, nhạy, độ này cao, giúp bạn thao tác hoàn toàn như ý muốn. Hơn nữa, bàn phím TrueStrike có bố cục thông minh với vị trí phím mũi tên hợp lý, bàn phím số đầy đủ và đèn nền, giúp bạn thao tác chính xác dù là trong đêm tối.

bàn phím Lenovo Legion 5 15IMH05

Tiết kiệm pin hơn, hỗ trợ sạc nhanh
Là chiếc laptop gaming nhưng vẫn đảm bảo yếu tố di động, Lenovo Legion 5-15ARH05 có thời lượng pin dài và hệ thống quản lý năng lượng thông minh để bạn luôn tràn đầy năng lượng ở bất cứ đâu. Tốc độ sạc nhanh cho phép laptop có thể sạc từ 0 – 50% chỉ sau 30 phút. Ngoài ra, chế độ vô hiệu hóa card rời, giảm điện áp CPU khi bạn chạy những tác vụ nhẹ còn giúp tuổi thọ pin được kéo dài hơn nữa.', '6', '8', '512', '15.6", 1920 x 1080 Pixel, IPS, 120 Hz, 250 nits, LED-backlit', '2.3', 'Intel Core i5-10300H 2.50 GHz');

create table `laptop`.`CartProduct` (
	`cartID` int(11) not null,
    `productID` int(11) not null,
    foreign key (`cartID`) references laptop.Cart(`cartID`),
    foreign key (`productID`) references laptop.Product(`productID`)
);
INSERT INTO `laptop`.`CartProduct`
(`cartID`, `productID`)
VALUES
(4, 19),	
(4, 20), 
(5, 15);

create table `laptop`.`OrderProduct` (
	`orderID` int(11) not null,
    `productID` int(11) not null,
    foreign key (`productID`) references laptop.Product(`productID`),
    foreign key (`orderID`) references laptop.Order(`orderID`)
);
INSERT INTO `laptop`.`OrderProduct`
(`orderID`, `productID`)
VALUES
(1, 1),
(1, 2),
(2, 5),
(3, 11);

create table laptop.`Wishlist` (
    `customerID` int(11) not null,
    `productID` int(11) not null,
    constraint PK_Wishlist primary key (`customerID`,`productID`),
	foreign key (`customerID`) references laptop.Customer(`customerID`),
    foreign key (`productID`) references laptop.Product(`productID`)
);
INSERT INTO `laptop`.`Wishlist`
(`customerID`, `productID`)
VALUES
(1, 5),
(1, 9),
(1, 2),
(2, 18);
