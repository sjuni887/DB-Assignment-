USE master
IF EXISTS(select * from sys.databases where name='FinalTest')
DROP DATABASE FinalTest;


Create Database FinalTest;
GO

use FinalTest;
GO

/****** Object:  Table [dbo].[Award]    Script Date: 28/1/2023 3:47:18 am ******/

-- Award
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Award]') AND type in (N'U'))
ALTER TABLE Win
DROP CONSTRAINT FK_Win_AwardID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Award]') AND type in (N'U'))
DROP TABLE [dbo].[Award]
GO

-- BumpOrder
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bump]') AND type in (N'U'))
ALTER TABLE [dbo].[BumpOrder]
DROP CONSTRAINT FK_BumpOrder_Bump

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bump]') AND type in (N'U'))
DROP TABLE [dbo].[Bump]
GO 

-- Dropping Category FK Constraint, then dropping Category

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
ALTER TABLE [dbo].[SubCategory]
DROP CONSTRAINT FK_SubCategory_CatID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO

-- FeedbackCat

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedbackCat]') AND type in (N'U'))
ALTER TABLE [dbo].[Feedback]
DROP CONSTRAINT FK_Feedback_FbkCatID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedbackCat]') AND type in (N'U'))
DROP TABLE [dbo].[FeedbackCat]
GO

-- Member

-- Dropping Constraint from buyer
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
ALTER TABLE [dbo].[Buyer]
DROP CONSTRAINT FK_Buyer_Member

-- Dropping Constraint from seller
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
ALTER TABLE [dbo].[Seller]
DROP CONSTRAINT FK_Seller_SellerID

-- Dropping Constraint from Follow
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
ALTER TABLE [dbo].[Follower]
DROP CONSTRAINT FK_Follower_MemberID, FK_Follower_FollowerID

-- Dropping Constraint from Member
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
ALTER TABLE [dbo].[Feedback]
DROP CONSTRAINT FK_Feedback_OnMemberID

-- Drop feedback constraint
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
ALTER TABLE Feedback
DROP CONSTRAINT FK_Feedback_ByMemberID

-- Dropping Member
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
DROP TABLE [dbo].[Member]
GO

-- Buyer



-- Drop likes constraint
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buyer]') AND type in (N'U'))
ALTER TABLE [dbo].[Likes]
DROP CONSTRAINT FK_Likes_BuyerID

-- Drop offer constraint
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buyer]') AND type in (N'U'))
ALTER TABLE [dbo].[Offer]
DROP CONSTRAINT FK_Offer_BuyerID

-- Drop Chat constraint
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buyer]') AND type in (N'U'))
ALTER TABLE [dbo].[Chat]
DROP CONSTRAINT FK_Chat_BuyerID

-- Dropping Buyer
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buyer]') AND type in (N'U'))
DROP TABLE [dbo].[Buyer]
GO


-- Seller

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seller]') AND type in (N'U'))
ALTER TABLE dbo.Listing
DROP CONSTRAINT SellerID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seller]') AND type in (N'U'))
ALTER TABLE dbo.BumpOrder
DROP CONSTRAINT FK_BumpOrder_Seller

-- Dropping Seller
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seller]') AND type in (N'U'))
DROP TABLE [dbo].[Seller]
GO

-- Follower

-- Dropping Follower
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Follower]') AND type in (N'U'))
DROP TABLE [dbo].[Follower]
GO

-- SubCategory

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
ALTER TABLE dbo.Listing
DROP CONSTRAINT SubCatID

-- Dropping Subcategory
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[SubCategory]
GO

-- Listing 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listing]') AND type in (N'U'))
ALTER TABLE dbo.ListingPhoto
DROP CONSTRAINT FK_ListingPhoto_ListingID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listing]') AND type in (N'U'))
ALTER TABLE dbo.BumpOrder
DROP CONSTRAINT FK_BumpOrder_Listing

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listing]') AND type in (N'U'))
ALTER TABLE dbo.Likes
DROP CONSTRAINT FK_Likes_ListingID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listing]') AND type in (N'U'))
ALTER TABLE dbo.Chat
DROP CONSTRAINT FK_Chat_ListingID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listing]') AND type in (N'U'))
ALTER TABLE dbo.Offer
DROP CONSTRAINT FK_Offer_ListingID

-- Dropping Listing
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listing]') AND type in (N'U'))
DROP TABLE [dbo].[Listing]
GO

-- ListingPhoto

-- Dropping ListingPhoto
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListingPhoto]') AND type in (N'U'))
DROP TABLE [dbo].[ListingPhoto]
GO

-- BumpOrder

-- Dropping BumpOrder
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BumpOrder]') AND type in (N'U'))
DROP TABLE [dbo].[BumpOrder]
GO

-- Likes

-- Dropping Likes
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Likes]') AND type in (N'U'))
DROP TABLE [dbo].[Likes]
GO

-- Chat

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chat]') AND type in (N'U'))
ALTER TABLE ChatMsg
DROP CONSTRAINT FK_ChatMsg_ChatID

-- Dropping Chat
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chat]') AND type in (N'U'))
DROP TABLE [dbo].[Chat]
GO

-- ChatMsg

-- Dropping ChatMsg
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChatMsg]') AND type in (N'U'))
DROP TABLE [dbo].[ChatMsg]
GO

-- Offer

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Offer]') AND type in (N'U'))
ALTER TABLE dbo.Review
DROP CONSTRAINT FK_Review_OfferID

-- Dropping Offer
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Offer]') AND type in (N'U'))
DROP TABLE [dbo].[Offer]
GO

-- Review 

-- Dropping Review
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Review]') AND type in (N'U'))
DROP TABLE [dbo].[Review]
GO

-- Staff
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
ALTER TABLE Feedback
DROP CONSTRAINT FK_Feedback_StaffID

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
ALTER TABLE Team
DROP CONSTRAINT FK_Team_TeamLeaderID

-- Dropping Staff
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
DROP TABLE [dbo].[Staff]
GO

-- Team

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U') AND EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U')))
ALTER TABLE Staff
DROP CONSTRAINT FK_Staff_TeamID;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
DROP TABLE [dbo].[Team]
GO

-- Win
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Win]') AND type in (N'U'))
DROP TABLE [dbo].[Win]
GO

-- Feedback 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feedback]') AND type in (N'U'))
DROP TABLE [dbo].[Feedback]
GO




-- 1. Award
CREATE TABLE Award
(
    AwardID     tinyint     NOT NULL,
    AwardName   varchar(50) NULL,
    AwardAmt    smallmoney  NULL,
    CONSTRAINT PK_Award_AwardID PRIMARY KEY(AwardID)  
)
-- 2. Bump
CREATE TABLE Bump
(
    BumpID      tinyint     NOT NULL,
    BumpDesc    varchar(50) NOT NULL,
    BumpPrice   smallmoney  NOT NULL,
    CONSTRAINT PK_Bump_BumpID PRIMARY KEY(BumpID)
)

-- 3. Category
CREATE TABLE Category
(
    CatID tinyint NOT NULL,
    CatDesc varchar(50) NOT NULL,
    CONSTRAINT PK_Category_CatID PRIMARY KEY(CatID)
)

-- 4. FeedbackCat
CREATE TABLE FeedbackCat
(
    FbkCatID tinyint NOT NULL,
    FbkCatDesc varchar(200) NOT NULL,
    CONSTRAINT PK_FeedbackCat_FbkCatID PRIMARY KEY (FbkCatID)
)

-- 5. Member
CREATE TABLE Member
(
    MemberID char(10) NOT NULL,
    MemberName varchar(50) NOT NULL,
    MemberDOB date NOT NULL,
    MemberEmail varchar(200) NULL,
    MemberMobile varchar(8) NOT NULL,
    MemberDateJoined date NOT NULL,
    City varchar(50) NOT NULL,
    CONSTRAINT PK_Member_MemberID PRIMARY KEY (MemberID)
)

-- 6. Buyer
CREATE TABLE Buyer
(
    BuyerID char(10) NOT NULL,
    CONSTRAINT PK_Buyer_BuyerID PRIMARY KEY (BuyerID),
    CONSTRAINT FK_Buyer_Member FOREIGN KEY(BuyerID) REFERENCES Member(MemberID)
)
-- 7. Seller
CREATE TABLE Seller
(
    SellerID char(10) NOT NULL,
    CONSTRAINT PK_Seller_SellerID PRIMARY KEY (SellerID),
    CONSTRAINT FK_Seller_SellerID FOREIGN KEY (SellerID) REFERENCES Member(MemberID)
)
-- 8. Follow
CREATE TABLE Follower
(
    MemberID char(10) NOT NULL,
    FollowerID char(10) NOT NULL,
    DateStarted datetime NOT NULL CHECK(DateStarted <= GETDATE()),
    CONSTRAINT PK_Follower_MemberIDFollowerID PRIMARY KEY(MemberID, FollowerID),
    CONSTRAINT FK_Follower_MemberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    CONSTRAINT FK_Follower_FollowerID FOREIGN KEY (FollowerID) REFERENCES Member(MemberID)
)

-- 9. Subcat
CREATE TABLE SubCategory
(
    SubCatID tinyint NOT NULL,
    SubCatDesc varchar(150) NOT NULL,
    CatID tinyint NOT NULL,
    CONSTRAINT PK_SubCategory_SubCatID PRIMARY KEY (SubCatID),
    CONSTRAINT FK_SubCategory_CatID FOREIGN KEY (CatID) REFERENCES Category(CatID)
)

-- 10. Listing
CREATE TABLE Listing
(
    ListingID tinyint NOT NULL,
    ListDesc varchar(1000) NOT NULL,
    Listdatetime datetime NOT NULL,
    ListPrice smallmoney NOT NULL,
    ListStatus varchar(10) NOT NULL CHECK(ListStatus IN ('Available', 'Sold', 'Inactive')),
    SellerID char(10) NOT NULL,
    SubCatID tinyint NOT NULL,
    CONSTRAINT PK_Listing_ListingID PRIMARY KEY (ListingID),
    CONSTRAINT SellerID FOREIGN KEY (SellerID) REFERENCES Seller(SellerID),
    CONSTRAINT SubCatID FOREIGN KEY (SubCatID) REFERENCES SubCategory(SubCatID)
)

-- 11. ListingPhoto
 CREATE TABLE ListingPhoto
(
    ListingID tinyint NOT NULL,
    Photo varchar(10) NOT NULL,
    CONSTRAINT PK_ListingPhoto_ListingIDPhoto PRIMARY KEY (ListingID, Photo),
    CONSTRAINT FK_ListingPhoto_ListingID FOREIGN KEY (ListingID) REFERENCES Listing(ListingID)
)
-- 12. BumpOrder
CREATE TABLE BumpOrder
(
    BumpOrderID tinyint     NOT NULL,
    PurchaseDate    date   NOT NULL,
    SellerID    char(10) NOT NULL,
    BumpID  tinyint NOT NULL,
    ListingID   tinyint NOT NULL,
    CONSTRAINT PK_BumpOrder_BumpOrderID PRIMARY KEY(BumpOrderID),
    CONSTRAINT FK_BumpOrder_Seller FOREIGN KEY(SellerID) REFERENCES Seller(SellerID),
    CONSTRAINT FK_BumpOrder_Bump FOREIGN KEY(BumpID) REFERENCES Bump(BumpID),
    CONSTRAINT FK_BumpOrder_Listing FOREIGN KEY (ListingID) REFERENCES Listing(ListingID)
)
-- 13. Likes
CREATE TABLE Likes
(
    BuyerID char(10) NOT NULL,
    ListingID tinyint NOT NULL,
    DateLiked date NOT NULL,
    CONSTRAINT PK_Likes_BuyerIDListingID PRIMARY KEY(BuyerID, ListingID),
    CONSTRAINT FK_Likes_BuyerID FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID),
    CONSTRAINT FK_Likes_ListingID FOREIGN KEY (ListingID) REFERENCES Listing(ListingID)
)
-- 14. Chat
CREATE TABLE Chat
(
    ChatID tinyint NOT NULL,
    BuyerID char(10) NOT NULL,
    ListingID tinyint NULL,
    CONSTRAINT PK_Chat_ChatID PRIMARY KEY(ChatID),
    CONSTRAINT FK_Chat_BuyerID FOREIGN KEY(BuyerID) REFERENCES Buyer(BuyerID),
    CONSTRAINT FK_Chat_ListingID FOREIGN KEY (ListingID) REFERENCES Listing(ListingID)
)
-- 15. ChatMSG
CREATE TABLE ChatMsg
(
    ChatID tinyint NOT NULL,
    MsgSN tinyint NOT NULL,
    Msgdatetime datetime NOT NULL CHECK(Msgdatetime <= GETDATE()),
    Originator char(1) NOT NULL CHECK(Originator IN ('B', 'S')),
    Msg varchar(500) NOT NULL,
    CONSTRAINT PK_ChatID_MsgSN PRIMARY KEY (ChatID, MsgSN),
    CONSTRAINT FK_ChatMsg_ChatID FOREIGN KEY (ChatID) REFERENCES Chat(ChatID)    
)

-- 16. Offer
 CREATE TABLE Offer
(
    OfferID tinyint NOT NULL,
    BuyerID char(10) NOT NULL,
    ListingID tinyint NOT NULL,
    OfferPrice smallmoney NOT NULL,
    OfferStatus varchar(9) NOT NULL CHECK(OfferStatus IN ('Submitted', 'Pending', 'Accepted', 'Rejected')),
    OfferDate date NOT NULL,
    CONSTRAINT PK_Offer_OfferID PRIMARY KEY (OfferID),
    CONSTRAINT FK_Offer_BuyerID FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID),
    CONSTRAINT FK_Offer_ListingID FOREIGN KEY (ListingID) REFERENCES Listing(ListingID)
)
-- 17. Review
CREATE TABLE Review
(
    ReviewID tinyint NOT NULL,
    OfferID tinyint NOT NULL,
    MemberType char(1) NOT NULL CHECK(MemberType IN ('B', 'S')),
    ReviewDate date NOT NULL,
    ItemRank tinyint  NULL CHECK(ItemRank IN ('1', '2', '3', '4', '5')),
    DeliveryRank tinyint  NULL CHECK(DeliveryRank IN ('1', '2', '3', '4', '5')),
    CommunicationRank tinyint NULL CHECK(CommunicationRank IN ('1', '2', '3', '4', '5')),
    Comment varchar(200) NULL,
    CONSTRAINT PK_Review_ReviewID PRIMARY KEY (ReviewID),
    CONSTRAINT FK_Review_OfferID FOREIGN KEY (OfferID) REFERENCES Offer(OfferID)
)

-- 18. Staff
CREATE TABLE Staff
(
    StaffID char(7) NOT NULL,
    StaffName varchar(50) NOT NULL,
    StaffMobile varchar(8) NOT NULL,
    StaffDateJoined date NOT NULL,
    TeamID tinyint NOT NULL,
    CONSTRAINT PK_Staff_StaffID PRIMARY KEY (StaffID),
    
)
-- 18. Team
CREATE TABLE Team
(
    TeamID tinyint NOT NULL,
    TeamName varchar(50) NOT NULL,
    TeamLeaderID char(7) NOT NULL,
    CONSTRAINT PK_Team_TeamID PRIMARY KEY (TeamID),
)



-- 19. Win
CREATE TABLE Win
(
    AwardID tinyint NOT NULL,
    TeamID tinyint NOT NULL,
    DateAwarded date NOT NULL,
    CONSTRAINT PK_Win_AwardIDTeamID PRIMARY KEY(AwardID, TeamID),
    CONSTRAINT FK_Win_AwardID FOREIGN KEY (AwardID) REFERENCES Award(AwardID),
    CONSTRAINT FK_Win_TeamID FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
)
-- 20. Feedback
CREATE TABLE Feedback
(
    FbkID tinyint NOT NULL,
    ByMemberID char(10) NOT NULL,
    FbkCatID tinyint NULL,
    FbkDesc varchar(200) NOT NULL,
    FbkDateTime datetime NOT NULL,
    FbkStatus varchar(20) NOT NULL CHECK(FbkStatus IN ('Pending', 'Receiving Attention', 'Completed')),
    SatisfactionRank smallint NOT NULL CHECK(SatisfactionRank IN ('1', '2', '3', '4', '5')),
    OnMemberID char(10) NULL,
    StaffID char(7) NULL,
    CONSTRAINT PK_Feedback_FbkID PRIMARY KEY (FbkID),
    CONSTRAINT FK_Feedback_ByMemberID FOREIGN KEY (ByMemberID) REFERENCES Member(MemberID),
    CONSTRAINT FK_Feedback_FbkCatID FOREIGN KEY (FbkCatID) REFERENCES FeedbackCat(FbkCatID),
    CONSTRAINT FK_Feedback_OnMemberID FOREIGN KEY (OnMemberID) REFERENCES Member(MemberID),
    CONSTRAINT FK_Feedback_StaffID FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) 
)


/* INSERT VALUES */

/* Syed */

-- 1. Award
INSERT INTO Award
VALUES 
(1, 'CEO List 2023', NULL),
(2, 'Award of Excellence 2023 Gold', 3000),
(3, 'Most Valuable Team 2023 Gold', 5000),
(4, 'Award of Improvement 2023 Gold', 2000),
(5, 'Award of Excellence 2023 Silver', 2000),
(6, 'Most Valuable Team2023 Silver', 3000),
(7, 'Award of Improvement 2023 Silver', 1000),
(8, 'Award of Excellence 2023 Bronze', 1000),
(9, 'Most Valuable Team 2023 Bronze', 1000),
(10, 'Award of Improvement 2023 Bronze', 500)

-- 2. Bump
INSERT INTO Bump
VALUES
(1, 'Bump once, instantly', 2.56),
(2, 'Bump daily for 3 days', 6.16),
(3, 'Bump daily for 7 days', 9.35)

-- 3. Category 
INSERT INTO Category
VALUES
(1,	'Fashion'),
(2,	'Technology'),
(3,	'Beauty & Personal Care'),
(4,	'Vehicles'),
(5,	'Hobbies & Toys')

-- 4. FeedbackCat
INSERT INTO FeedbackCat
VALUES
(1	,'Technical Problem'),
(2	,'Problem with another User'),
(3	,'Problem with Listing'),
(4	,'Suggestion'),
(5	,'Problem with Staff')
/* Ian */

-- 5. Member
INSERT INTO Member
VALUES
('M000000001',	'Kayla Seow'	                          ,  '1999-01-30'	,   'kaylaseow5839@yahoe.com'	    ,'98243493'	,'2018-12-01','Singapore'),
('M000000002',	'Riyadh Hakim Muhammad Bin Shaiffudin' ,	 '1998-12-31'	,   'riyadhgames@zmail.com'	        ,'97482734'	,'2019-06-05','Singapore'),
('M000000003',	'Blayton Chong Nim'  ,                       '1987-02-01'	,   'babybender@coldmail.com'	    ,'92204821'	,'2013-12-31','Singapore'),
('M000000004',	'Justin Bieber Bibir Justin'  ,              '2003-03-02'	,   'jbbj@yahoe.com'	            ,'97936798'	,'2012-01-10','Singapore'),
('M000000005',	'Jannette Happi'  ,                          '2002-04-16'	,   'jannettesad@zmail.com'	        ,'89647965'	,'2011-09-08','Singapore'),
('M000000006',	'Shuqri Muhammad Bin Samion'  ,              '2001-05-04'	,   'smbs0405@zmail.com'	        ,'88967654'	,'2013-04-01','Singapore'),
('M000000007',	'Daphknee Lim'  ,                            '1976-02-14'	,   'lovemylungs@yahoe.com'	        ,'98897879'	,'2014-02-01','Singapore'),
('M000000008',	'Johan Hafeez'  ,                            '2003-07-06'	,   'johan_hafeez@coldmail.com'	    ,'85869009'	,'2010-02-23','Singapore'),
('M000000009',	'Titus Haititi'  ,                           '2000-08-07'	,   'onlyfanstitus@zmail.com'	    ,'97998088'	,'2016-03-17','Singapore'),
('M000000010',	'Mark Karly Jau'  ,                          '2004-09-08'	,   'markkauhijau@zmail.com'	    ,'89785956'	,'2015-07-01','Singapore')
-- 6. Buyer'
INSERT INTO Buyer
VALUES
('M000000001'),
('M000000003'),
('M000000005'),
('M000000007'),
('M000000009')
-- 7. Seller
INSERT INTO Seller
VALUES
('M000000002'),
('M000000004'),
('M000000006'),
('M000000008'),
('M000000010')
-- 8. Follower
INSERT INTO Follower
VALUES
('M000000001',	'M000000002',	'2020-02-22' ),
('M000000005',	'M000000008',	'2012-06-14' ),
('M000000007',	'M000000006',	'2015-07-03' ),
('M000000009',	'M000000008',	'2016-08-16' ),
('M000000003',	'M000000010',	'2016-10-10' ),
('M000000009',	'M000000002',	'2021-10-08' ),
('M000000005',	'M000000004',	'2013-09-05' ),
('M000000005',	'M000000006',	'2015-09-26' ),
('M000000001',	'M000000008',	'2018-12-09' ),
('M000000009',	'M000000010',	'2017-06-20' );

-- 9. Subcategory
INSERT INTO Subcategory
VALUES
(1,	    'Shirt',	                    1),
(2,	    'Pants',	                    1),
(3,	    'Computer Monitor',	            2),
(4,	    'Central Processing Unit', 	    2),
(5,	    'Facial Products',	            3),
(6,	    'Lipstick',	                    3),
(7,	    'Cars',	                        4),
(8,	    'Lorry', 	                    4),
(9,	    'Motorcycles', 	                4),
(10,	'Video Games',	                5),
(11,	'Action Figure',	            5);
/* Lu'lu */

-- 10. Listing
INSERT INTO Listing
VALUES
(1,	    'Ducati Panigale V4 R'	                                ,   '2021-10-08 17:54:32'	,   16000	,'Inactive' 	,'M000000002',  8),
(2,	    'The Ordinary Niacinamide 25ml' 	                    ,   '2023-01-13 22:09:23'	,   320	    ,'Available' 	,'M000000004',  4),
(3,	    'Fujifilm A355' 	                                    ,   '2023-01-20 15:27:32'	,   100	    ,'Sold'	        ,'M000000006',  2),
(4,	    'Fenty Beauty lip gloss'	                            ,   '2023-01-25 17:45:23'	,   20	    ,'Available'	,'M000000008',  6),
(5,	    'Animal Crossing : New Horizons Nintendo Switch Chip'	,   '2022-12-30 11:55:43'	,   55	    ,'Sold'	        ,'M000000010',  10),
(6,	    'Marvel Avengers End Game Captain America Figurine' 	,   '2019-09-12 00:12:44'	,   210	    ,'Sold'	        ,'M000000002',  11),
(7,	    'Corduroy jeans'	                                    ,   '2023-01-19 08:56:23'	,   25	    ,'Available'	,'M000000004',  2),
(8,	    'Xiaomi 34inch Widescreen Curvvved Monitor' 	        ,   '2023-01-04 18:23:34'	,   500	    ,'Sold'	        ,'M000000006',  3),
(9, 	'Pull and Bear crop top'	                            ,   '2022-12-29 23:42:23'	,   20	    ,'Sold' 	    ,'M000000008',  1),
(10,	'Molten Ball: Goyang edition'	                        ,   '2023-01-05 03:23:44'	,   70	    ,'Available'	,'M000000010',  7),
(11,	'Arai Helmet'	                                        ,   '2023-01-01 09:34:37'	,   85	    ,'Available'	,'M000000010',  9);


-- 11. ListingPhoto
INSERT INTO ListingPhoto
VALUES
(1,	    'Photo 1'),
(2,	    'Photo 2'),
(3,	    'Photo 3'),
(4,	    'Photo 4'),
(5,	    'Photo 5'),
(6,	    'Photo 6'),
(7,	    'Photo 7'),
(8,	    'Photo 8'),
(9,	    'Photo 9'),
(10,	'Photo 10'),
(11,	'Photo 11');

-- 12. BumpOrder
INSERT INTO BumpOrder
VALUES
(1,	    '2021-10-10' ,	'M000000002',	3,	1),
(2,	    '2023-01-15' ,	'M000000004',	1,	2),
(3,	    '2023-01-27' ,	'M000000006',	2,	3),
(4,	    '2023-01-28' ,	'M000000008',	1,	4),
(5,	    '2023-01-05' ,	'M000000010',	2,	5),
(6,	    '2019-09-13' ,	'M000000002',	3,	6),
(7,	    '2023-01-21' ,	'M000000004',	2,	7),
(8,	    '2023-02-01' ,	'M000000006',	3,	8),
(9,	    '2023-01-23' ,	'M000000008',	1,	9),
(10,	'2023-01-08' ,	'M000000010',	1,	10),
(11,	'2023-01-08' ,	'M000000010',	3,	11);

-- 13. Likes
INSERT INTO Likes
VALUES
('M000000001',	1,	'2021-10-09' ),
('M000000003',	2,	'2023-01-19' ),
('M000000005',	3,	'2023-01-29' ),
('M000000007',	4,	'2023-01-30' ),
('M000000009',	5,	'2023-01-11' ),
('M000000001',	6,	'2019-09-22' ),
('M000000003',	7,	'2023-01-29' ),
('M000000005',	8,	'2023-01-07' ),
('M000000007',	9,	'2022-01-09' ),
('M000000009',	10,	'2023-01-20' ),
('M000000005',	11,	'2022-12-19' );
 
-- 14. Chat
INSERT INTO Chat
VALUES
(1,	    'M000000001',	1),
(2,	    'M000000003',	2),
(3,	    'M000000005',	3),
(4,	    'M000000007',	4),
(5,	    'M000000009',	5),
(6,	    'M000000001',	6),
(7,	    'M000000003',	7),
(8,	    'M000000005',	8),
(9,	    'M000000007',	9),
(10,	'M000000009',	10);

/* Tristan */

-- 15. ChatMSG

INSERT INTO ChatMsg
VALUES 
(1,	    1,	'2021-10-08 17:05:26',	'B',	'Y the take take never go young!!!!'),
(1,	    2,	'2021-10-08 17:07:27',	'S',	'He didnt say he would love me if i was a worm.'),
(1,	    3,	'2021-10-08 17:11:56',	'S',	'Thanks see u soon!'),
(1,	    4,	'2021-10-08 18:05:26',	'S',	'Ok I will send it to u soon'),
(2,	    1,	'2023-01-13 14:23:34',	'B',	'Hi, is this still available?'),
(2,	    2,	'2023-01-13 15:05:56',	'B',	'is 300 ok?'),
(2,	    3,	'2023-01-13 15:11:34',	'S',	'This one is limited edition' ),
(3,	    1,	'2023-01-20 20:23:34',	'B',	'What does it mean by that'),
(3,	    2,	'2023-01-20 20:45:44',	'B',	'The product specs part'),
(3,	    3,	'2023-01-20 21:22:59',	'S',	'Oh so basically'),
(3,	    4,	'2023-01-20 21:23:34',	'B',	'Ohh'),
(4,	    1,	'2023-01-26 19:02:12',	'B',	'Hi, is this still available?'),
(4,	    2,	'2023-01-26 19:22:34',	'S',	'Yes'),
(4,	    3,	'2023-01-26 20:01:35',	'S',	'i can deliver it to u soon'),
(5,	    1,	'2023-01-14 14:22:01',	'B',	'animal crossing'),
(5,	    2,	'2023-01-14 16:22:01',	'S',	'what talknig you'),
(5,	    3,	'2023-01-14 16:22:02',	'S',	'r u gonna buy?'),
(5,	    4,	'2023-01-14 17:12:01',	'B',	'my life! my attitude!'),
(5,	    5,	'2023-01-14 17:32:11',	'S',	'what u saying dont come here troll me'),
(5,	    6,	'2023-01-14 17:32:14',	'S',	'i need to make a living off this you know'),
(5,	    7,	'2023-01-15 00:52:10',	'B',	'we are just messages in an sql database'),
(5,	    8,	'2023-01-15 13:10:31',	'S',	'what'),
(5,	    9,	'2023-01-16 03:00:00',	'B',	'we are just messages in an sql database'),
(5,     10,	'2023-01-16 15:42:31',	'S',	'whats an sql database'),
(6,	    1,	'2019-09-13 05:21:31',	'B',	'Hi, is this still available?'),
(6,	    2,	'2019-09-13 09:03:22',	'S',	'yes'),
(6,	    3,	'2019-09-13 13:44:45',	'B',	'okay im willing to buy it'),
(6,	    4,	'2019-09-13 13:45:50',	'B',	'for the listed price'),
(6,	    5,	'2019-09-13 14:02:47',	'S',	'okay nice!'),
(7,	    1,	'2023-01-20 15:20:19',	'B',	'Hello'),
(7,	    2,	'2023-01-20 19:23:22',	'S',	'YEs'),
(7,	    3,	'2023-01-21 07:43:56',	'B',	'I would like to buy'),
(7,	    4,	'2023-01-22 12:59:02',	'S',	'Ok, make an offer'),
(8,	    1,	'2023-01-05 20:08:43',	'B',	'Hi, is this still available?'),
(8,	    2,	'2023-01-05 20:29:13',	'B',	'Im interested to'),
(8,	    3,	'2023-01-06 14:18:21',	'S',	'No, someone else already made an offer'),
(8,	    4,	'2023-01-06 15:09:33',	'B',	'What'),
(8,	    5,	'2023-01-06 15:49:28',	'B',	'OK ill offer for higher'),
(8,	    6,	'2023-01-06 17:27:51',	'S',	'let me see how much then i will consider'),
(8,	    7,	'2023-01-06 19:37:16',	'B',	'How muchwill be enough to convince u?'),
(9,	    1,	'2023-01-03 19:22:17',	'B',	'HEY!'),
(9,	    2,	'2023-01-03 19:30:24',	'S',	'what'),
(9,	    3,	'2023-01-03 20:21:19',	'B',	'Am buy ples'),
(9,	    4,	'2023-01-03 20:52:11',	'B',	'ples'),
(9,	    5,	'2023-01-03 21:19:08',	'S',	'no'),
(10,	1,	'2023-01-12 11:01:20',	'B',	'Hello!!'),
(10,	2,	'2023-01-12 12:20:23',	'S',	'Hi!'),
(10,	3,	'2023-01-12 12:22:51',	'B',	'Is this available?'),
(10,	4,	'2023-01-12 12:52:10',	'S',	'Yes'),
(10,	5,	'2023-01-12 13:11:11',	'B',	'Can we do $100'),
(10,	6,	'2023-01-12 13:57:10',	'S',	'Sorry min $130'),
(10,	7,	'2023-01-12 14:42:19',	'B',	'$120 final offer'),
(10,	8,	'2023-01-12 14:50:20',	'S',	'ok deal'),
(10,	9,	'2023-01-12 15:01:02',	'B',	'Thank you!');

-- 16. Offer
INSERT INTO Offer
VALUES
(1,	    'M000000001', 	8,	    499,    'Accepted',	    '2023-01-10' ),
(2,	    'M000000003', 	5,	    50,     'Accepted',	    '2023-01-04' ),
(3,	    'M000000005', 	3,	    10,     'Accepted',	    '2023-01-27' ),
(4,	    'M000000007', 	4,	    20,     'Rejected',     '2023-01-26' ),
(5,	    'M000000009', 	9,	    20,     'Accepted',	    '2023-01-05' ),
(6,	    'M000000003', 	7,	    30,     'Accepted',	    '2023-01-21' ),
(7,	    'M000000001', 	6,	    200,    'Rejected',	    '2019-09-19' ),
(8,	    'M000000007', 	10,	    80,     'Accepted',	    '2023-01-09' ),
(9,	    'M000000007', 	2,      320,    'Pending',	    '2023-01-19' ),
(10,	'M000000009', 	1,      16000,  'Rejected',	    '2021-10-18' )


-- 17. Review
INSERT INTO Review
VALUES
(1,	    2,   'B',	'2023-01-05' ,	    3,	    4,	    3,	'Seller was ok'),
(2,	    2,   'S',	'2023-01-05' ,	    NULL,	NULL,	4,	'He was being cooperative even with a busy schedule :) Thanks for waiting'),
(3,	    1,   'B',	'2023-01-10' ,	    5,	    5,	    3,	'Was okay with dealing with them'),
(4,	    1,   'S',	'2023-01-10' ,	    NULL,	NULL,	4,	'Smooth dude'),
(5,	    3,   'B',	'2023-01-28' ,	    3,	    4,	    2,	'Very dry'),
(6,	    3,   'S',	'2023-01-28' ,	    NULL,	NULL,	4,	NULL),
(7,	    5,   'B',	'2023-01-06' ,	    2,	    3,	    3,	'Seller was understanding'),
(8,	    5,   'S',	'2023-01-06' ,	    NULL,	NULL,	4,	'Buyer was very friendly'),
(9,	    8,   'B',	'2023-01-09' ,	    3,	    2,	    2,	'Seller was late'),
(10,    8,	 'S',	'2023-01-09' ,	    NULL,	NULL,	3,	'Moderate transaction')


-- 18. Staff
 INSERT INTO Staff
 VALUES
('S000001',	'Hanni Lim',                        '91465889',   '2016-12-10' ,     1),
('S000002',	'Skyler Black',                     '95606982',   '2020-12-04' ,     1),
('S000003',	'Gustavo Fring',                    '93252534',   '2010-10-21' ,     2),
('S000004',	'Shuhadah Somali',                  '91131478',   '2019-06-30' ,     2),
('S000005',	'Jennie Kim',                       '96991819',   '2009-06-30' ,     3),
('S000006',	'Rose Park',                        '97751442',   '2017-04-12' ,     3),
('S000007',	'Ronny Lee',                        '89011337',   '2012-10-05' ,     4),
('S000008',	'Fiona Shrek',                      '96259703',   '2014-08-07' ,     4),
('S000009',	'Mark Yang',                        '90599646',   '2015-04-20' ,     5),
('S000010',	'Balakrisnan Raju s/o Vikram',      '87455287',   '2014-07-19' ,     5),
('S000011',	'Zufar Aleef',                      '86530097',   '2020-06-09' ,     6),
('S000012',	'Elmo Kennedy OConnor',             '80756947',   '2013-11-09' ,     6),
('S000013',	'Sarugesh Jay',                     '84937186',   '2009-07-27' ,     7),
('S000014',	'Simon Minter',                     '89170973',   '2010-11-19' ,     7),
('S000015',	'Pham Minji',                       '98204549',   '2010-01-27' ,     8),
('S000016',	'Donald Bump',                      '82177187',   '2016-07-07' ,     8),
('S000017',	'Phat Nik',                         '92701306',   '2018-11-01' ,     9),
('S000018',	'Akhtar Khan',                      '91311846',   '2018-07-31' ,     9),
('S000019',	'Vishnu Balakrishnur',              '82640022',   '2020-03-14' ,     10),
('S000020',	'Carlos Jeorge Khun Aguero',	    '81764441',   '2010-12-06' ,     10),
('S000021',	'Siti Aqilah Binte Ahmad',          '87857259',   '2020-10-19' ,     11),
('S000022',	'Saitama Onisan',                   '89530451',   '2014-10-09' ,     11),
('S000023',	'Lim Feng Kai',                     '85080915',   '2009-06-10' ,     1),
('S000024',	'Olajide Olatunji',                 '82749699',   '2010-06-29' ,     1),
('S000025',	'Tushar Chow',                      '90704471',   '2020-11-19' ,     2),
('S000026',	'Harry Richard',                    '80798395',   '2012-09-23' ,     2),
('S000027',	'Wan Tan Khoo De',                  '84006265',   '2009-06-13' ,     3),
('S000028',	'Jeremy Bing Chi Ling',             '81292983',   '2020-11-03' ,     3),
('S000029',	'Bong Huo Fung',                    '92214204',   '2017-02-26' ,     4),
('S000030',	'Daniel Neo',                       '97018860',   '2010-06-16' ,     4);


-- 18. Team
INSERT INTO Team
VALUES
(1,     'Marketing Team 1',         'S000002'),
(2,     'Marketing Team 2',         'S000004'),
(3,     'Marketing Team 3',         'S000006'),
(4,     'Public Relations Team 1',	'S000008'),
(5,     'Public Relations Team 2',	'S000010'),
(6,     'Public Relations Team 3',	'S000012'),
(7,     'R&D Team 1',               'S000014'),
(8,     'R&D Team 2',               'S000016'),
(9,     'R&D Team 3',               'S000017'),
(10,    'Customer Service Team 1',	'S000019'),
(11,    'Customer Service Team 2',	'S000022');

-- Staff alter table for TeamID Foreign Key
ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_TeamID FOREIGN KEY (TeamID) REFERENCES Team(TeamID);

ALTER TABLE Team
ADD CONSTRAINT FK_Team_TeamLeaderID FOREIGN KEY  (TeamLeaderID) REFERENCES Staff(StaffID)


-- 19. Win
INSERT INTO Win
VALUES
(1,	    10,	    '2022-07-19' ),
(2,	    8,	    '2022-11-12' ),
(3,	    4,	    '2022-02-10' ),
(4,	    3,	    '2022-10-28' ),
(5,	    6,	    '2022-04-26' ),
(6,	    9,	    '2022-06-12' ),
(7,	    11,	    '2022-08-27' ),
(8,	    2,	    '2022-12-26' ),
(9,	    1,	    '2022-05-23' ),
(10,	7,      '2022-05-12' );

-- 20. Feedback
INSERT INTO Feedback
VALUES
(1,	    'M000000001', 	1,	'App lagging',	                                            '2020-03-17 17:57:43',	        'Pending',	                    2,	    NULL	        ,NULL),
(2,	    'M000000002', 	2,	'User was being incorporative', 	                        '2021-10-20 13:16:23',	        'Receiving Attention',	        3,	    'M000000009'	,'S000007'),
(3,	    'M000000003', 	3,	'Product was not as functional as described',          	    '2023-01-05 20:12:29',	        'Completed',	                2,	    'M000000010'	,'S000017'),
(4,	    'M000000004', 	4,	'Maybe allow an archive listing function',	                '2016-09-26 00:12:23',	        'Pending',	                    3,	    NULL	       , NULL),
(5,	    'M000000005', 	5,	'Rude responses by Bijimol Bijismol',	                    '2013-12-10 19:12:44',	        'Receiving Attention',	        2,	    NULL	       , 'S000010'),
(6,	    'M000000006', 	1,	'Message does not send',	                                '2014-03-03 19:23:47',	        'Completed',	                1,	    NULL	        ,'S000020'),
(7,	    'M000000007', 	2,	'User was being very rude',	                                '2023-01-27 15:32:23',	        'Pending',	                    3,	    'M000000008'	,NULL),
(8,	    'M000000008', 	3,	'Inappropriate Listing', 	                                '2023-01-07 18:08:45',	        'Receiving Attention',	        3,	    'M000000010'	,'S000008'),
(9,	    'M000000009', 	4,	'Please add an option to add videos to our listings!',	    '2017-02-11 06:03:35',	        'Completed',	                5,	    NULL	        ,'S000016'),
(10,	'M000000010', 	5,	'Poor customer service by Saitama Onisan',	                '2017-07-06 19:28:17',	        'Pending',                 	    3,	    NULL	        ,NULL);

-- SQL SELECT *

use FinalTest;
GO

SELECT * FROM Award
SELECT * FROM Bump
SELECT * FROM BumpOrder
SELECT * FROM Buyer
SELECT * FROM Category
SELECT * FROM Chat
SELECT * FROM ChatMsg
SELECT * FROM Feedback
SELECT * FROM FeedbackCat
SELECT * FROM Follower
SELECT * FROM Likes
SELECT * FROM Listing
SELECT * FROM ListingPhoto
SELECT * FROM Member
SELECT * FROM Offer
SELECT * FROM Review
SELECT * FROM Seller
SELECT * FROM Staff
SELECT * FROM SubCategory
SELECT * FROM Team
SELECT * FROM Win