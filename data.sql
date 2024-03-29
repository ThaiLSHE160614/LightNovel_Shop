USE [Project_DEMO]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/19/2022 2:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 7/19/2022 2:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[product_id] [int] NULL,
	[category_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/19/2022 2:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[ue] [nvarchar](50) NOT NULL,
	[total_money] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 7/19/2022 2:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/19/2022 2:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[title] [nvarchar](300) NULL,
	[price] [int] NULL,
	[discount] [int] NULL,
	[author] [nvarchar](20) NULL,
	[publisher] [nvarchar](50) NULL,
	[form] [nvarchar](20) NULL,
	[size] [varchar](20) NULL,
	[discribe] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](100) NULL,
	[public_year] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/19/2022 2:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](20) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[role_id] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Trinh thám- Kinh dị')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Fantasy')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Rom-com')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Boxset')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Manga-Comic')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Truyện nguyên bộ')
GO
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (1, 2)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (2, 3)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (3, 3)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (4, 3)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (5, 2)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (6, 3)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (7, 3)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (8, 2)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (9, 2)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (10, 2)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (11, 3)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (12, 3)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (13, 1)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (14, 1)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (15, 6)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (16, 4)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (17, 4)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (18, 5)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (19, 5)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (20, 5)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (21, 5)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (22, 5)
INSERT [dbo].[Genre] ([product_id], [category_id]) VALUES (23, 5)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [ue], [total_money]) VALUES (1, CAST(N'2022-07-10' AS Date), N'gamer.otaku.1710@gmail.com', 0)
INSERT [dbo].[Order] ([id], [date], [ue], [total_money]) VALUES (2, CAST(N'2022-07-14' AS Date), N'gamer.otaku.1710@gmail.com', 127000)
INSERT [dbo].[Order] ([id], [date], [ue], [total_money]) VALUES (3, CAST(N'2022-07-14' AS Date), N'gamer.otaku.1710@gmail.com', 109000)
INSERT [dbo].[Order] ([id], [date], [ue], [total_money]) VALUES (4, CAST(N'2022-07-14' AS Date), N'user@gmail.com', 574000)
INSERT [dbo].[Order] ([id], [date], [ue], [total_money]) VALUES (5, CAST(N'2022-07-14' AS Date), N'otomemod@gmail.com', 3980000)
INSERT [dbo].[Order] ([id], [date], [ue], [total_money]) VALUES (6, CAST(N'2022-07-14' AS Date), N'otomemod@gmail.com', 675000)
INSERT [dbo].[Order] ([id], [date], [ue], [total_money]) VALUES (7, CAST(N'2022-07-14' AS Date), N'gamer.otaku.1710@gmail.com', 170000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (2, 1, 1, 127000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (3, 11, 1, 109000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (4, 1, 1, 127000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (4, 2, 1, 85000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (4, 3, 1, 96000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (4, 4, 1, 96000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (4, 5, 1, 170000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (5, 15, 4, 995000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (6, 8, 1, 125000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (6, 10, 5, 110000)
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (7, 2, 2, 85000)
GO
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (1, N'Thế Giới Otomegame Thật Khắc Nghiệt Với Nhân Vật Quần Chúng - Tập 5', 159000, 127000, N'Mishima Yomu', N'Tsuki Light Novel', N'Bìa mềm', N'18 x 13 cm', N'Nếu huy hiệu mà cũng hiện ra trên bàn tay của Leon thì… chúng tớ tâm đầu ý hợp nhỉ?”

Noelle, người luôn thầm nghĩ về Leon, đang tỏ ra rất hạnh phúc khi huy hiệu của Vu Nữ đang hiện trên tay mình. Tuy nhiên, niềm hy vọng ấy nhanh chóng sụp đổ khi cô nhìn thấy hôn thê của Leon – Angie và Livia, những con người đang có mối quan hệ rất thân thiết. Trái tim tan vỡ, Noelle trở nên suy sụp. Và rồi, khi Leon tạm thời trở về Vương quốc, mọi chuyện bắt đầu trở nên nguy cấp. Lợi dụng tình thế đó, tên bám đuôi Loic đã đe dọa Noelle và bắt cóc cô. Sau khi trở lại nước Cộng hòa và nghe thông báo về điều đó, Leon nhanh chóng lên kế hoạch giải cứu Noelle.', 98, N'images\otome5.jpg', N'2022-05-27')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (2, N'Thiên sứ nhà bên- Tập 3', 95000, 85000, N'Saekisan, Hanekoto', N'NXB Kim Đồng', N'Bìa mềm', N'19 x 13 cm', N'Mọi người đều thân thiết với Amane, chỉ có tôi như bị cho ra rìa vậy đó.”

Mahiru và Amane đã lên lớp 11, họ trở thành bạn cùng lớp với nhau! Trái với Mahiru luôn cố gắng thu hẹp khoảng cách kể cả khi ở trường, Amane vẫn giữ ý với “thiên sứ” và không tiến thêm một bước nào.

Nhờ có Chitose mà Mahiru dần xóa bỏ bức tường ngăn cách với các bạn cùng lớp, trong khi Amane lại nhớ đến vết thương cũ vừa lành trong

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.', 97, N'images\tenshi3.jpg', N'2022-05-30')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (3, N'Hội Chứng Tuổi Thanh Xuân – Tập 6', 105000, 96000, N'Hajime KAMOSHIDA', N'NXB Kim Đồng', N'Bìa mềm', N'19 x 13 cm', N'Gần ngày thi giữa kì, Sakura đã phải lo lắng khổ não suốt từ sáng. Cậu nhận được một lá thư với nội dung “muốn gặp mặt” từ mối tình đầu Shouko. Hơn thế nữa, Sakuta không thể kể chuyện này cho chị Mai được. Đây phải chăng là điềm báo rằng sóng gió lại đang lén lút tìm tới hai người!?

Ngay giữa lúc ấy thì lần này lại đến lượt cô em gái Kaede nghiện ở nhà của Sakuta đường đột công bố một chuyện trọng đại! Nội dung của nó là: “Em sẽ đến trường.”

Đây quả là một mục tiêu to lớn mà Kaede đã đặt ra, dẫu rằng việc từng bị bắt nạt chính là nguyên nhân khiến cho cô bé không thể ra khỏi nhà nữa. Sakuta hạ quyết tâm hỗ trợ cô bé về mọi mặt, cả chị Mai cũng dốc hết sức mình. Tuy nhiên, với một Kaede đã không ra khỏi nhà tận hai năm thì con đường hoàn thành mục tiêu vẫn còn gian nan lắm', 99, N'images\bunny6.jpg', N'2022-03-04')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (4, N'Hội Chứng Tuổi Thanh Xuân – Tập 7', 105000, 96000, N'Hajime KAMOSHIDA', N'NXB Kim Đồng', N'Bìa mềm', N'19 x 13 cm', N'Hai người dọn về ở chung từ khi nào thế?”
Cả ba ngồi quây quanh bàn sưởi, bên trái là mối tình đầu Shouko, bên phải là Mai, người mà Sakuta đang hẹn hò. Hôm đó còn chưa đầy một tháng là tới lễ Giáng sinh, vậy mà chuyện cậu  bắt đầu sống chung với Shouko một cách bất đắc dĩ đã bị Mai biết được, khiến Sakuta rơi vào tình thế khó xử nhất trong đời.

Trong lúc đó, cậu phát hiện ra Shouko học cấp hai đang phải nhập viện do bệnh tình chuyển biến xấu. Shouko nói rằng, “Trở thành người lớn đối với em là cả một ước mơ.” Vận mệnh của cô bé rồi sẽ đi về đâ Dấu hiệu rạn nứt giữa Mai và Sakuta, cùng bí mật của “Shouko lớn” với “Shouko bé” cuối cùng đã được làm sáng tỏ.

Hãy đón đọc tập thứ sáu đầy gay cấn về câu chuyện tình yêu của chúng tôi, bắt đầu tại một thành phố được bao bọc bởi bầu trời và biển cả! ', 99, N'images\bunny7.jpg', N'2022-07-01')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (5, N'Ma vương đi làm-Tập 4', 189000, 170000, N'Satoshi Wagahara', N'Sakura Light Novel', N'Bìa mềm', N'18 x 13 cm', N'Cửa hàng đồ ăn nhanh tạm ngừng kinh doanh khiến Ma Vương thất nghiệp. Thêm vào đó, bức tường của căn phòng trọ ở Villa Rosa Sasazuka bị hư hại trong trận chiến với Gabriel cũng cần phải sửa chữa lại nên Ma Vương buộc phải rời đi một khoảng thời gian.

Vừa mất việc lại mất cả Ma Vương thành, Ma Vương may mắn được nhận vào làm việc ở “cửa hàng phục vụ ven biển” dưới sự giới thiệu của bà chủ nhà Shiba. Cửa hàng này hiện đang được cháu gái của Shiba là Amane kinh doanh. Thêm vào đó, Chiho, cô nữ sinh cấp 3 ái mộ Ma Vương và Emilia, vị Dũng Sĩ mang mục tiêu lấy mạng Ma Vương cũng đã đuổi theo đến cửa hàng này!?

Tác phẩm đoạt giải bạc Tiểu thuyết Dengenki lần thứ 17 đã bước sang tập thứ 4! Hãy cùng đón chờ những diễn biến gay cấn nhất trong tập truyện này nhé.', 99, N'images\maou4.jpg', N'2022-03-03')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (6, N'Chào mừng tới lớp học đề cao thực lực-Tập 2', 120000, 110000, N'KINUGASA SYOUGO', N'IPM', N'Bìa mềm', N'18 x 23 cm', N'Trường Trung học Phổ thông Đào tạo Nâng cao là ngôi trường danh giá hàng đầu Nhật Bản, với gần 100% học sinh đỗ vào trường đại học mong muốn và tìm được việc làm. Học sinh được sử dụng cơ sở vật chất hiện đại bậc nhất, mỗi tháng được cấp một số điểm có giá trị tương đương 100.000 yên, tự do tạo kiểu tóc và mang vật dụng cá nhân. Thật giống như sống trên thiên đường.

Thực chất, đây là ngôi trường theo chủ nghĩa đề cao thực lực, nơi chỉ học sinh ưu tú mới được đãi ngộ tốt. Vì lý do riêng, nhân vật chính Ayanokoji Kiyotaka làm bài thi đầu vào qua loa, rồi bị xếp vào lớp D hạng bét - thường bị giễu cợt là cái “ổ” tập trung “hàng lỗi”. Tại đây, cậu gặp Horikita Suzune - một nữ sinh xinh đẹp học giỏi nhưng tính cách đầy vấn đề, và Kushida Kikyo - một cô bạn dịu dàng tốt bụng tựa thiên thần. Nhờ đó, tình hình quanh Kiyotaka dần biến chuyển..', 100, N'images\cote2.jpg', N'2022-07-07')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (7, N'Nhân Vật Hạ Cấp Tomozaki - Tập 3', 111000, 98000, N'Yuki Yaku, Fly', N'NXB Kim Đồng', N'Bìa mềm', N'19 x 13 cm', N'Học kì một đầy sóng gió đã kết thúc, giờ là tới kì nghỉ hè.
Phần nào đó trong tôi đã dự đoán được rằng Hinami không hề có ý định cho tôi “nghỉ”. “Giải thích một cách đơn giản, đây chính là kì cắm trại tập huấn để vun vào cho Yuzu và Nakamura”… Một nhóm nam nữ ăn tiệc nướng BBQ, chơi đùa bên sông, rồi trọ lại qua đêm. Chà, tôi thấy đây đúng là một sự kiện khắc hoạ đầy chân thật về riajuu đấy. Chỉ có đúng một vấn đề. Đấy là tôi cũng phải tham gia. Cảm giác kì quặc bao trùm này là sao nhỉ? Hơn thế nữa, về cuộc hẹn với Kikuchi, thực tế Hinami đã lệnh cho tôi “phải thành đôi với Kikuchi trong mùa hè này”...? Kì nghỉ hè của tôi sẽ thành ra thế nào đây!?
Tập thứ 3 của bộ truyện hài lãng mạn nơi một nhân vật hạ cấp chấp nhận thử thách chinh phục cuộc đời!
', 100, N'images\tomo3.jpg', N'2022-07-11')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (8, N'Công Cuộc Tái Thiết Vương Quốc Của Anh Hùng Chủ Nghĩa Hiện Thực - Tập 3', 135000, 125000, N'Dojyomaru, Fuyuyuki', N'Skybooks', N'Bìa mềm', N'18 x 13 cm', N'Ở tập trước, Công quốc Amidonia đã phát động tấn công Elfrieden hòng chiếm đoạt làm của riêng, song chẳng những không đạt được mục đích mà còn đánh mất luôn cả thủ đô của mình. Julius – thái tử Amidonia đã vin vào cớ có tham gia liên minh của Tuyên ngôn Nhân loại, muốn Đế quốc Grand Chaos đứng ra lấy lại thủ đô giúp nước mình.
Về phía Elfrieden, sau cuộc chinh phạt, Quốc vương tạm thời Souma lập tức bắt tay vào việc xử lý hậu chiến, nhanh chóng cho tiến hành động thái tiếp theo, tức việc triển khai Dự án ca nhạc Lorelei thông qua Ngọc phát sóng.
Rốt cuộc ý định thực sự của Souma là gì? Khi mà cậu còn cho phát sóng chương trình này tại Van – thủ đô đã bị Elfrieden chiếm đóng của Công quốc Amidonia. Người dân Amidonia sẽ có phản ứng ra sao trước chuyện này?
', 99, N'images\yuusha3.jpg', N'2022-06-06')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (9, N'Bị Đuổi Khỏi Nhóm Anh Hùng, Tôi Muốn Sống Tự Do Tự Tại Ở Vương Đô - Tập 4', 209000, 195000, N'kiki', N'Ichi Light Novel', N'Bìa mềm', N'18 x 13 cm', N'Chị cũng... không có nơi để về à?”
Sau khi Flum rời khỏi nhóm Anh hùng, mỗi ngày của Cyrill đều chìm trong nỗi ân hận. Đồng thời, Cyrill còn phát hiện ra hành vi tàn ác của Hiền Nhân Jean đối với Flum và chứng kiến khuôn mặt đã biến thành xoắn ốc của Maria, cô hét lên đầy tuyệt vọng, chạy khỏi lâu đài, hoà vào dòng người trên đường phố. Khi đang đi lang thang không nơi nương tựa, Cyrill đã gặp gỡ một cô bé tự xưng là Mute.
Và rồi cuộc gặp gỡ đó trở thành đòn bẩy, biến câu chuyện thành một màn bi kịch. Vương đô phồn hoa đô hội nay trở thành vùng đất loạn lạc, tang thương.
', 100, N'images\tudo4.jpg', N'2022-06-29')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (10, N'Hành Trình Trở Thành Nhà Thám Hiểm Của Chàng Lính Đánh Thuê Bần Hàn - Tập 1', 125000, 110000, N'Mine', N'Tsuki Light Novel', N'Bìa mềm', N'18 x 13 cm', N'Đoàn lính dánh thuê đã bị tiêu diệt. Để kiếm kế sinh nhai ở nơi ẩn náu, Loren – người sống sót duy nhất – đã quyết định lựa chọn con đường trở thành nhà thám hiểm.
“Nhất quan hệ, nhì tiền tệ”, nhưng Loren không có cả hai nên anh chẳng nhận được nhiệm vụ nào tử tế. Trong lúc Loren đang bế tắc, một nhóm nhà thám hiểm đã đến nói chuyện với anh. Và thế là Loren chuyển nghề thành công, từ lính đánh thuê cừ khỏi sang “tấm chiếu mới” trong giới thám hiểm.
', 95, N'images\danhthue1.jpg', N'2022-06-24')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (11, N'Cô nàng Otaku nhà tôi - Tập 1', 126000, 109000, N'Rin Murakami', N'AMAK', N'Bìa mềm', N'18 x 13 cm', N'Tiêu chuẩn về người bạn gái lý tưởng của tôi:

Trước hết cô ấy phải là otaku. Thêm vào đó cô ấy bắt buộc phải mang phong cách thanh lịch và có mái tóc đen dài bóng mượt.

Nếu cô ấy cũng thích những tác phẩm có nhiều nhân vật nữ đáng yêu thì càng tuyệt vời!

 

Thế nhưng tại sao?!

“Cậu nói rồi còn gì?! Cậu nói sẽ chỉ giáo tôi về lý tưởng của đám otaku các cậu ấy…!”

Tại sao tôi phải sống chung cùng một gyaru kiêm otaku ngầm Nishina Kokoro – người hoàn toàn trái ngược với gu bạn gái của mình vậy?!', 99, N'images\otaku.jpg', N'2022-07-08')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (12, N'Dáng Hình Thanh Âm Boxset', 350000, 320000, N'Yoshitoki Oima', N'NXB Trẻ', N'Boxset', N'Box', N'DÁNG HÌNH THANH ÂM sẽ kể một câu chuyện đầy cảm xúc…

Chuyện kể về Nishimiya Shoko là cô bé bị khiếm thính bẩm sinh. Khi nhập học vào trường tiểu học, cô bé luôn bị các bạn cùng lớp bắt nạt mà đầu têu là cậu bé Ishiya Shoya ngỗ nghịch, khiến mẹ cô bé đành phải chuyển trường cho con mình. Vài năm sau, hối hận vì những hành động không hay lúc nhỏ của mình, Ishida Shoya đã cất công đi tìm cô bạn học năm xưa để bù đắp cho những lỗi lầm của mình khi ấy.

Câu chuyện đầy cảm động về vấn nạn bắt nạt học đường, cũng như quá trình nỗ lực sống và hòa nhập vào xã hội của những người vốn sinh ra không được lành lặn như bao người khác.', 10, N'images\silent.jpg', N'2021-01-16')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (13, N'Thám Tử Đã Chết - Tập 4', 109000, 98000, N'Nigozyu', N'Hikari Light Novel', N'Bìa mềm', N'19 x 13 cm', N'Kẻ từng là trợ lý của Thám tử bậc thầy – tôi, Kimizuka Kimihiko – đã đương đầu với thử thách của Siesta quá cố và tìm ra một câu trở lời vượt lên trên cả ý chí ấy. Để thực hiện một phép màu không tương – mang Siesta trở lại và tìm manh mối đánh bại Hạt Giống, tôi cùng Natsunagi quyết định bay đến London. Nhưng trên chuyến bay, tôi lại nghe thấy câu nói y hệt như bốn năm trước đây: “Trong số quý khách, có vị nào là thám tử không ạ?”

…Kẻ địch và đồng minh, quá khứ và tương lai, gặp gỡ và chia biệt. Do ý chí của chúng tôi và người đã khuất trộn lẫn vào nhau, câu chuyện bắt đầu thay đổi đột ngột. Thám tử đã chết. Nhưng không thể kết thúc như thế. Dù có là một nguyện ước đi ngược lại quy luật của thế giới này, tôi vẫn không chấp nhận được kết cục đó. Ở độ cao mười ngàn mét giữa không trung, một cuộc thám hiểm mới lại bắt đầu.', 100, N'images\tantei4.jpg', N'2022-07-15')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (14, N'SPY ROOM - Lớp Học Điệp Viên - Tập 4: Yumegatari Tia', 109000, 98000, N'Takemachi', N'Hikari Light Novel', N'Bìa mềm', N'19 x 13 cm', N'Nhờ khai thác thông tin từ tay sát thủ chuyên ám sát các điệp viên lạnh lùng và tàn ác “Shikabane” mà Klaus đã hạ gục trước đó, đội “Tomoshibi” đã tóm được đuôi của tổ chức không rõ hành tung thuộc Đế quốc – “Hebi”. Cả đội hạ cánh xuống thủ đô hào nhoáng Mitalio của Hợp chúng quốc Mouzaia, hang ổ của chúng để vạch trần chân tướng.

Tuy nhiên, người được giao nhiệm vụ chỉ huy lần này, Tia, vì những việc xảy ra trong quá khứ, đã đánh mất hoàn toàn tự tin của một điệp viên. Trong đầu cô lại vọng về những lời của một điệp viên đã từng cứu mạng cô khi trước.

“Em hãy hướng đến mục tiêu trở thành một anh hùng.”

Cái ác cùng cực đến mức triệt tiêu cả hi vọng đang ngự trị trên một chiến trường bị che phủ bởi vòng xoáy sợ hãi. Khi rớt xuống tận cùng của tuyệt vọng, vị anh hùng mà mọi người mong mỏi sẽ xuất hiện!', 100, N'images\spy4.jpg', N'2022-07-15')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (15, N'[COMBO] RELIFE 1 -13', 1005000, 995000, N'YayoiSo', N'Nhà Xuất Bản Dân Trí', N'Bìa mềm', N'Combo', N'Kaizaki Arata, 27 tuổi, thất nghiệp, chán nản với cuộc đời. Tình cờ trong một lần say xỉn, anh trở thành đối tượng thí nghiệm của dự án mang tên ReLIFE, bị thu nhỏ về hình dạng của một học sinh cao trung 17 tuổi, từ đó bắt đầu hành trình học lại kỹ năng sống, làm lại cuộc đời.', 1, N'images\relife.jpg', NULL)
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (16, N'[BẢN BOXSET MANGA] BA NGÀY HẠNH PHÚC', 195000, 183000, N'Sugaru Miaki', N'IPM', N'Boxset', N'Box', N'Chuyển thể từ tiểu thuyết nổi tiếng cùng tên. Kusunoki, một thanh niên chán đời tình cờ nghe được tin đồn về cửa tiệm kì quái chuyên thu mua tuổi thọ. Do quá túng tiền, anh quyết định bán phần lớn tuổi thọ của mình và phải sống chung với cô gái giám sát viên Miyagi trong suốt ba tháng ngắn ngủi cuối đời…', 10, N'images\3ngay.jpg', N'2021-10-17')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (17, N'[COMBO BOXSET] PHÁO HOA, NGẮM TỪ DƯỚI HAY BÊN CẠNH? + TẠM BIỆT PHÁO HOA', 130000, 118000, N'Hitoshi One', N'IPM', N'Boxset', N'Box', N'Hôm ấy là ngày tập trung giữa hè đầy náo nhiệt của một trường cấp hai, đồng thời là ngày diễn ra lễ hội pháo hoa tại thị trấn ven biển nọ. Norimichi thầm mến Nazuna, nhưng cô bé sắp phải chuyển trường vì mẹ tái hôn.', 10, N'images\hanabi.jpg', N'2021-01-30')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (18, N'Mỹ Vị Hầm Ngục - Tập 1', 88000, 80000, N'Kui Ryoko', N'IPM', N'Bìa mềm', N'18 x 13 cm', N'Có thực mới vực được đạo”. Câu nói không chỉ đúng với cuộc sống hằng ngày mà còn đúng với những nhà thám hiểm khám phá hầm ngục nhiều ngày, thậm chí nhiều tuần liền.
Không còn tiền và lương thực trong tay, nhóm thám hiểm của Laios vẫn dấn thân vào hầm ngục để cứu em gái bị rồng ăn thịt. Đó cũng là lúc họ nhận ra, hầm ngục nguy hiểm chết chóc thật ra tồn tại một hệ sinh thái vô cùng đa dạng, và những con quái vật họ chiến đấu mỗi ngày ngon lành tới bất ngờ.
', 100, N'images\myvi.jpg', N'2022-07-16')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (19, N'Tokyo Revenger - Tập 2', 115000, 97000, N'Ken Wakui', N'IPM', N'Bìa mềm', N'18 x 13 cm', N'Takemichi đã du hành thời gian về thời cấp hai 12 năm trước để cứu Hinata, cô bạn gái cũ mà cậu rất yêu, người đã bị băng đảng tàn ác “Tokyo Manji” sát hại.
Biết được vụ tranh chấp với Moebius là nguồn cơn khiến Toman chia rẽ, Takemichi đã thử thuyết phục Mikey dừng lại, song họ lại bị Moebius tập kích!
Takemichi bị xoay vần giữa những biến chuyển đột ngột và quá khứ không ngừng đổi thay! Thế rồi một lưỡi dao hung hiểm lại gần Draken!
', 100, N'images\tore2.jpg', N'2022-07-16')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (20, N'Blue Period - Tập 1', 48000, 40000, N'Yamaguchi Tsubasa', N'NXB Trẻ', N'Bìa mềm', N'19 x 13 cm', N'Yataro Yaguchi là một học sinh xuất sắc nhưng có lối sống buông thả, không mục đích. Một ngày nọ, tận mắt chiêm ngưỡng bức tranh của một chị lớp trên ở CLB Mỹ thuật, Yataro hoàn toàn bị hút hồn và lần đầu tiên trong đời, cậu đã tìm ra thứ mình thật sự đam mê và đặt mọi tâm huyết vào đó. Yataro quyết định tham gia vào CLB mỹ thuật và nuôi hy vọng thi vào trường ĐH mỹ thuật Tokyo danh tiếng. Thế nhưng, cậu liên tục vấp phải sự phản đối từ cha mẹ và bạn bè. Đứng trước tình thế khó xử này, Yataro đã quyết định tự mình thuyết phục mọi người bằng các bức vẽ đầy tâm huyết.', 100, N'images\blue.jpg', N'2022-07-11')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (21, N'Dr.STONE - Tập 19: Thành Phố Ngô 1 Triệu Dân', 25000, 22000, N'Riichiro Inagaki', N'NXB Kim Đồng', N'Bìa mềm', N'17.6 x 11.3 cm', N'Các thành viên của Vương quốc khoa học phân tán ra để tiếp tục triển khai kế hoạch chế tác liều chết hòng bắt giữ Dr. Xeno!! Mặt khác, ở phe địch cũng đang phát triển một “vũ khí bí mật” gây sốc!! Trận quyết chiến khoa học vô tiền khoáng hậu sẽ là một trận đấu căng thẳng nhằm tranh giành quyền chi phối bầu trời, mặt đất và mặt nước!!', 100, N'images\stone19.jpg', N'2022-06-27')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (22, N'Komi - Nữ Thần Sợ Giao Tiếp - Tập 10', 25000, 22000, N'Tomohito Oda', N'NXB Kim Đồng', N'Bìa mềm', N'17.6 x 11.3 cm', N'Chứng rối loạn giao tiếp xã hội là việc cảm thấy khó khăn khi tương tác với người khác.  Nó còn dùng để chỉ những người ít hoặc không có kĩ năng giao tiếp."  Những người mắc phải chứng này chỉ sợ nói chuyện, chứ kì thực họ có rất nhiều điều muốn nói. Vậy phải làm sao để họ có thể giao tiếp trong cuộc sống thường ngày...?     Nữ sinh Komi đẹp nghiêng nước nghiêng thành nhưng lại mắc phải hội chứng đó. Cô không giỏi tương tác với người khác và lúc nào cũng tự hỏi “Làm thế nào để bắt chuyện”, hay “Bắt chuyện rồi thì nói gì tiếp theo”. Và anh chàng Tadano đã kết bạn với một Komi như thế. Từng bước từng bước, cả hai dần thấu hiểu và trao nhau một lời hứa...', 100, N'images\komi10.jpg', N'2022-07-11')
INSERT [dbo].[Product] ([id], [title], [price], [discount], [author], [publisher], [form], [size], [discribe], [quantity], [image], [public_year]) VALUES (23, N'Chú Thuật Hồi Chiến - Tập 4', 30000, 25000, N'Gege Akutami', N'NXB Kim Đồng', N'Bìa mềm', N'17.6 x 11.3 cm', N'Tại hiện trường án mạng do chú linh gây ra, Itadori đã gặp gỡ Junpei, cả hai tâm đầu ý hợp. Nhưng Junpei lại tôn sùng chú linh Mahito, thủ phạm của vụ án. Mahito lợi dụng Junpei, hòng li gián cậu và Itadori. Junpei rơi vào cạm bẫy của hắn và...', 100, N'images\jujutsu4.jpg', N'2022-07-20')
GO
INSERT [dbo].[User] ([fname], [lname], [email], [password], [address], [phone], [role_id]) VALUES (N'Thái', N'Lê Sỹ', N'gamer.otaku.1710@gmail.com', N'17102002', N'Sảnh C tòa 32T The golden An Khánh, Hoài Đức, Hà Nội ', N'0397461220', 1)
INSERT [dbo].[User] ([fname], [lname], [email], [password], [address], [phone], [role_id]) VALUES (N'Thái', N'Lê Sỹ', N'lesythai123@gmail.com', N'123', NULL, N'0389254639', 0)
INSERT [dbo].[User] ([fname], [lname], [email], [password], [address], [phone], [role_id]) VALUES (N'Leon ', N'Fou Bartfort', N'otomemod@gmail.com', N'otome', N'Lãnh địa Bá tước BartFort Vương quốc HortFort', N'0982669602', 0)
INSERT [dbo].[User] ([fname], [lname], [email], [password], [address], [phone], [role_id]) VALUES (N'Thái', N'Lê Sỹ', N'thailshe160614@fpt.edu.vn', N'123', NULL, NULL, 0)
INSERT [dbo].[User] ([fname], [lname], [email], [password], [address], [phone], [role_id]) VALUES (N'user', N'god', N'user@gmail.com', N'12345', N'Đại học FPT Hà Nội , Hòa Lạc', N'02462597749', 0)
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [role_id]
GO
ALTER TABLE [dbo].[Genre]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Genre]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ue])
REFERENCES [dbo].[User] ([email])
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
