USE [master]
GO
/****** Object:  Database [PheSach]    Script Date: 7/18/2022 5:36:07 PM ******/
CREATE DATABASE [PheSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PheSach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PheSach.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PheSach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PheSach_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PheSach] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PheSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PheSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PheSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PheSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PheSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PheSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [PheSach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PheSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PheSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PheSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PheSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PheSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PheSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PheSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PheSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PheSach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PheSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PheSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PheSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PheSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PheSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PheSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PheSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PheSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PheSach] SET  MULTI_USER 
GO
ALTER DATABASE [PheSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PheSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PheSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PheSach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PheSach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PheSach] SET QUERY_STORE = OFF
GO
USE [PheSach]
GO
/****** Object:  User [sa1]    Script Date: 7/18/2022 5:36:07 PM ******/
CREATE USER [sa1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 7/18/2022 5:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[born] [nvarchar](200) NULL,
	[specialization] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 7/18/2022 5:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [int] NOT NULL,
	[title] [nvarchar](200) NULL,
	[authorID] [int] NULL,
	[category] [nvarchar](2000) NULL,
	[ISBN] [nchar](20) NULL,
	[ratings] [int] NULL,
	[dateOfPublish] [date] NULL,
	[language] [nvarchar](20) NULL,
	[description] [nvarchar](2000) NULL,
	[img_path] [nvarchar](50) NULL,
	[link_Amazon] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 7/18/2022 5:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[id] [int] NOT NULL,
	[RatingStars] [real] NULL,
	[RatingAmount] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/18/2022 5:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[idBook] [int] NOT NULL,
	[ReviewContent] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Review_1] PRIMARY KEY CLUSTERED 
(
	[idBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/18/2022 5:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](200) NOT NULL,
	[password] [nvarchar](200) NULL,
	[isAdmin] [bit] NULL,
	[fullname] [nvarchar](200) NULL,
	[email] [nvarchar](200) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (1, N'Andrew Joseph White', N'in The United States', N'Horror, Thriller, Young Adult')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (2, N'Stephen King', N'Bornin Portland, Maine, The United States
', N'Horror, Mystery, Literature & Fiction')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (3, N'Antoine de Saint-Exupéry', N'in Lyon, France', N'Philosophy, Children''s Books, Nonfiction')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (4, N'John Green', N'in Indianapolis, The United States', N'Literature & Fiction, Young Adult, Young Adult Romance')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (5, N'Alexandre Dumas', N'in Villers-Cotterêts, Aisne, France', N'Adventure, Romance, Fiction')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (6, N'Dean Koontz', N'in Everett, Pennsylvania, The United States', N'Thriller, Mystery, Science Fiction & Fantasy')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (7, N' Mario Puzo', N'in Manhattan, New York, The United States', N'Literature & Fiction, Classics, Mafia')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (8, N'J.R.R. Tolkien', N'in Bloemfontein, Mangaung, Free State, South Africa', N'Fantasy, Fiction, Children''s')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (9, N' Stieg Larsson', N'	Karl Stig-Erland Larsson
15 August 1954
Skelleftehamn, Sweden', N'Literature & Fiction, Mystery & Thrillers, Crime')
INSERT [dbo].[Author] ([id], [name], [born], [specialization]) VALUES (10, N'Oscar Wilde', N'in Dublin, Ireland', N'Theatre, Poetry, Humor and Comedy, Fiction, Children''s')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (1, N'Hell Followed with Us', 1, N'Horror', N'1682633241          ', 1, CAST(N'2022-06-07' AS Date), N'English', N'Sixteen-year-old trans boy Benji is on the run from the cult that raised him—the fundamentalist sect that unleashed Armageddon and decimated the world’s population. Desperately, he searches for a place where the cult can’t get their hands on him, or more importantly, on the bioweapon they infected him with.

But when cornered by monsters born from the destruction, Benji is rescued by a group of teens from the local Acheson LGBTQ+ Center, affectionately known as the ALC. The ALC’s leader, Nick, is gorgeous, autistic, and a deadly shot, and he knows Benji’s darkest secret: the cult’s bioweapon is mutating him into a monster deadly enough to wipe humanity from the earth once and for all.

Still, Nick offers Benji shelter among his ragtag group of queer teens, as long as Benji can control the monster and use its power to defend the ALC. Eager to belong, Benji accepts Nick’s terms…until he discovers the ALC’s mysterious leader has a hidden agenda, and more than a few secrets of his own.

A furious, queer debut novel about embracing the monster within and unleashing its power against your oppressors. Perfect for fans of Gideon the Ninth and Annihilation.', N'\img\book\hell follower.jpg', N'https://www.amazon.com/gp/product/1682633241/ref=x_gr_w_bb_sout?ie=UTF8&tag=x_gr_w_bb_sout-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=1682633241&SubscriptionId=1MGPYB6YW3HWK55XCGG2s')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (2, N'The Institute', 2, N'Fiction, Horror, Thriller , Science Fiction
', N'9781432870133       ', 2, CAST(N'2019-09-10' AS Date), N'English', N'In the middle of the night, in a house on a quiet street in suburban Minneapolis, intruders silently murder Luke Ellis’s parents and load him into a black SUV. The operation takes less than two minutes. Luke will wake up at The Institute, in a room that looks just like his own, except there’s no window. And outside his door are other doors, behind which are other kids with special talents—telekinesis and telepathy—who got to this place the same way Luke did: Kalisha, Nick, George, Iris, and ten-year-old Avery Dixon. They are all in Front Half. Others, Luke learns, graduated to Back Half, “like the roach motel,” Kalisha says. “You check in, but you don’t check out.”

In this most sinister of institutions, the director, Mrs. Sigsby, and her staff are ruthlessly dedicated to extracting from these children the force of their extranormal gifts. There are no scruples here. If you go along, you get tokens for the vending machines. If you don’t, punishment is brutal. As each new victim disappears to Back Half, Luke becomes more and more desperate to get out and get help. But no one has ever escaped from the Institute. ', N'\img\book\the Institute.jpg', N'https://www.amazon.com/The-Institute-Stephen-King-audiobook/dp/B07N99GY6J/ref=sr_1_1?crid=PL1RIPY4VGUB&keywords=The+Institute&qid=1658137408&s=books&sprefix=%2Cstripbooks-intl-ship%2C1158&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (3, N'The Little Prince', 3, N'Classics , Childrens , Fantasy  ', N'9783140464079       ', 3, CAST(N'1943-04-01' AS Date), N'French', N'A pilot stranded in the desert awakes one morning to see, standing before him, the most extraordinary little fellow. "Please," asks the stranger, "draw me a sheep." And the pilot realizes that when life''s events are too difficult to understand, there is no choice but to succumb to their mysteries. He pulls out pencil and paper... And thus begins this wise and enchanting fable that, in teaching the secret of what is really important in life, has changed forever the world for its readers.

Few stories are as widely read and as universally cherished by children and adults alike as The Little Prince, presented here in a stunning new translation with carefully restored artwork. The definitive edition of a worldwide classic, it will capture the hearts of readers of all ages. ', N'\img\book\the little prince.jpg', N'https://www.amazon.com/The-Little-Prince-audiobook/dp/B0023AP7T4/ref=sr_1_1?crid=32LPKH44X4HQM&keywords=The+Little+Prince&qid=1658137449&s=audible&sprefix=%2Caudible%2C354&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (4, N'The Fault in Our Stars', 4, N'Young Adult, Romance, Fiction, Contemporary', N'9780142424179       ', 4, CAST(N'2012-01-10' AS Date), N'English', N'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel''s story is about to be completely rewritten.

Insightful, bold, irreverent, and raw, The Fault in Our Stars is award-winning author John Green''s most ambitious and heartbreaking work yet, brilliantly exploring the funny, thrilling, and tragic business of being alive and in love', N'\img\book\the fault in our stars.jpg', N'https://www.amazon.com/The-Fault-in-Our-Stars/dp/B09VQ72PVG/ref=sr_1_1?crid=XWJAQ5LTYLPS&keywords=The+Fault+in+Our+Stars&qid=1658137470&s=audible&sprefix=the+fault+in+our+stars%2Caudible%2C311&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (5, N'The Three Musketeers', 5, N'Adventure ,  Historical Fiction, Classics, ', N'9789684169135       ', 5, CAST(N'1844-07-11' AS Date), N'French', N'Alexandre Dumas’s most famous tale— and possibly the most famous historical novel of all time— in a handsome hardcover volume.

This swashbuckling epic of chivalry, honor, and derring-do, set in France during the 1620s, is richly populated with romantic heroes, unattainable heroines, kings, queens, cavaliers, and criminals in a whirl of adventure, espionage, conspiracy, murder, vengeance, love, scandal, and suspense. Dumas transforms minor historical figures into larger- than-life characters: the Comte d’Artagnan, an impetuous young man in pursuit of glory; the beguilingly evil seductress “Milady”; the powerful and devious Cardinal Richelieu; the weak King Louis XIII and his unhappy queen—and, of course, the three musketeers themselves, Athos, Porthos, and Aramis, whose motto “all for one, one for all” has come to epitomize devoted friendship. With a plot that delivers stolen diamonds, masked balls, purloined letters, and, of course, great bouts of swordplay, The Three Musketeers is eternally entertaining.', N'\img\book\the_three_musketeers.jpg', N'https://www.amazon.com/The-Three-Musketeers-audiobook/dp/B001UL7NXU/ref=sr_1_1?crid=2W4F3CO2XMDUS&keywords=The+Three+Musketeers&qid=1658137499&s=audible&sprefix=the+fault+in+our+stars%2Caudible%2C780&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (6, N'Quicksilver', 6, N'Thriller, Fantasy, Mystery', N'9781542019903       ', 6, CAST(N'2022-01-25' AS Date), N'English', N'Quinn Quicksilver was born a mystery―abandoned at three days old on a desert highway in Arizona. Raised in an orphanage, never knowing his parents, Quinn had a happy if unexceptional life. Until the day of “strange magnetism.” It compelled him to drive out to the middle of nowhere. It helped him find a coin worth a lot of money. And it practically saved his life when two government agents showed up in the diner in pursuit of him. Now Quinn is on the run from those agents and who knows what else, fleeing for his life.

During a shoot-out at a forlorn dude ranch, he finally meets his destined companions: Bridget Rainking, a beauty as gifted in foresight as she is with firearms, and her grandpa Sparky, a romance novelist with an unusual past. Bridget knows what it’s like to be Quinn. She’s hunted, too. The only way to stay alive is to keep moving.

Barreling through the Sonoran Desert, the formidable trio is impelled by that same inexplicable magnetism toward the inevitable. With every deeply disturbing mile, something sinister is in the rearview―an enemy that is more than a match for Quinn. Even as he discovers within himself resources that are every bit as scary.', N'\img\book\Quick silver.jpg', N'https://www.amazon.com/Audible-Quicksilver/dp/B099G1HRDG/ref=sr_1_1?crid=OVGQXEQ27690&keywords=Quicksilver&qid=1658137539&s=audible&sprefix=quicksilver%2Caudible%2C317&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (7, N'Billy Summers', 2, N'Mystery, Horror, Thriller, Fiction', N'9781982173623       ', 7, CAST(N'2021-08-03' AS Date), N'English', N'Billy Summers is a man in a room with a gun. He’s a killer for hire and the best in the business. But he’ll do the job only if the target is a truly bad guy. And now Billy wants out. But first there is one last hit. Billy is among the best snipers in the world, a decorated Iraq war vet, a Houdini when it comes to vanishing after the job is done. So what could possibly go wrong?

How about everything.', N'\img\book\billy summer.jpg', N'https://www.amazon.com/Billy-Summers/dp/B08V9HZGJP/ref=sr_1_1?crid=2HPPFVGUCQLRZ&keywords=Billy+Summers&qid=1658137610&s=audible&sprefix=billy+summers%2Caudible%2C389&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (8, N'The Godfather', 7, N'Crime, Historical Fiction, Thriller, Mystery', N'9780330024570       ', 8, CAST(N'1969-03-10' AS Date), N'English', N'The Godfather—the epic tale of crime and betrayal that became a global phenomenon.

Almost fifty years ago, a classic was born. A searing portrayal of the Mafia underworld, The Godfather introduced readers to the first family of American crime fiction, the Corleones, and their powerful legacy of tradition, blood, and honor. The seduction of power, the pitfalls of greed, and the allegiance to family—these are the themes that have resonated with millions of readers around the world and made The Godfather the definitive novel of the violent subculture that, steeped in intrigue and controversy, remains indelibly etched in our collective consciousness.', N'\img\book\the  godfather.jpg', N'https://www.amazon.com/The-Godfather-audiobook/dp/B007JSDY7W/ref=sr_1_1?crid=1JQGQFWGA251M&keywords=The+Godfather&qid=1658137636&s=audible&sprefix=billy+sum%2Caudible%2C786&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (9, N'The Hobbit', 8, N'Fantasy, Adventure, Fiction', N'9780007525508       ', 9, CAST(N'1937-09-21' AS Date), N'English', N'In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.
Written for J.R.R. Tolkien’s own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics (1998), and includes a note on the text by Douglas A. Anderson (2001). ', N'\img\book\the hobbit.jpg', N'https://www.amazon.com/The-Hobbit/dp/B08C8XFQMN/ref=sr_1_1?crid=2B8B2C04TG3M1&keywords=The+Hobbit&qid=1658137654&s=audible&sprefix=the+hobbit%2Caudible%2C428&sr=1-1')
INSERT [dbo].[Books] ([id], [title], [authorID], [category], [ISBN], [ratings], [dateOfPublish], [language], [description], [img_path], [link_Amazon]) VALUES (10, N'The Girl with the Dragon Tattoo', 9, N'Crime, Mystery, Thriller', N'9780307949493       ', 10, CAST(N'1937-09-21' AS Date), N'English', N'In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.
Written for J.R.R. Tolkien’s own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics (1998), and includes a note on the text by Douglas A. Anderson (2001).', N'\img\book\The Girl with the Dragon Tattoo.jpg', N'https://www.amazon.com/Girl-with-Dragon-Tattoo-audiobook/dp/B001G8MA4O/ref=sr_1_1?crid=2M7WZS36P0KPS&keywords=The+Girl+with+the+Dragon+Tattoo&qid=1658137684&s=audible&sprefix=the+girl+with+the+dragon+tattoo%2Caudible%2C330&sr=1-1')
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (1, 9, 1000)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (2, 8, 8000)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (3, 9, 10000)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (4, 8, 3)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (5, 6, 100)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (6, 4, 1)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (7, 7, 900)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (8, 8, 300)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (9, 5, 400)
INSERT [dbo].[Rating] ([id], [RatingStars], [RatingAmount]) VALUES (10, 3, 100)
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (1, N'2022 is the year of darker yet hopeful and powerful queer YA stories like All That’s Left in the World and The Honeys, and without a doubt, Hell Followed with Us belongs to this category. It’s equally gorgeous, breathtaking, eerie, and at its heart so very queer.

Like I gushed over the books mentioned above, I could gush over Hell Followed with Us for hours, days, even for years. Over the content and trigger warnings in the letter from the author, d*mn Andrew Joseph White, you gave me shivers when I hadn’t even started reading the story. Over the book itself, the beautiful writing, the amazing character development, the terrifying horror, the fabulous rep. And over the acknowledgments, d*mn you again, Andrew, my chest tightened, and tears ran down my cheeks.

When I started reading this book, a huge storm was blowing outside. Roof tiles flew around, trucks just fell on their sides, and trees snapped like straws. But when the wind died down, the sun began to send its rays down to earth, and people started cleaning the mess. At the same time, a storm was blowing inside me as well. I sat down on a chair and read and made notes and clenched my fists and had a knot in my chest and stared in the distance and cried and kept drinking in so many beautiful words.

To control the monster inside you takes guts. To go through hell and back takes guts. To make life better for yourself and your friends takes guts. And that’s why, despite this being a hell of a story, hope and queer power, instead of blood and organs, eventually soak the pages of this extraordinary story. D*mn you once again, Andrew, this book will haunt me, probably like forever, and I’ll pick up anything you write from now on even without reading a blurb!

I received an ARC from Peachtree Teen and NetGalley in exchange for an honest review.')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (2, N'5 Bright and Fabulous Stars

What can I tell you about “The Institute?” Besides the fact that it’s a phenomenal read and the narrator is fantastic?!

I simply adored the character development! It’s something that I think Stephen King excels in. His writing draws you in like a toasted bagel with butter, that you can’t wait to sink your teeth into. Here, King features a large cast of characters, some of whom have been stolen away from home, and now reside in “The Institute.”

Luke Ellis was taken from his home in the middle of the night. When he wakes up, he’s in a room at “The Institute.” It looks almost exactly like his own room back home, except for the fact that there are no windows, none. Not a one. There he meets Sha, Nick, Avery and quite a few others. They draw strength from each other. Some are teens, like himself and a few are just kids. They go through some crazy experiments. A few of them have extraordinary powers: TK and TP. No matter what happens to them, they all end up going to the back half. Some, sooner than later. Don’t ask me to explain. You have to rip roar through the pages of this crazy read to find out what I’m saying.

What happens here is sheer insanity. You almost can’t believe it, however it actually seems real and it works and works well here because of how the story is told and that my friends is because of the genius of Stephen King’s storytelling. Time and again he reinvents himself and while there might be smidges of this story that seem familiar it is wholly new and fresh and I loved every second of it.

Stephen King - You have basically rocked my world since I was Thirteen Years Old, when I read IT and became terrified of clowns. It was then that I became a fan, and read every book of yours that I could get my hands on. The Stand, Cujo, Pet Sematary, The Shining.. the list goes on. Some are on my favorites list ((The Top 3: 11/22/63, IT and The Stand) with a few others coming close including The Outsider and this year’s The Institute)), some, not so much. Regardless, I remain astounded by your efforts, your ideas and your brilliant mind and I thank you for making me a reader.

To the Luke Ellis and Avery Dixon’s of the world. I wish I had your superpowers.

A huge thank you to audible and to Santino Fontana for the incredible narration of this novel. Bravo.')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (3, N'We are all children in adult bodies. Yes we are, don''t think we aren''t for one moment. The fact that we WERE, indeed, children, is a huge part of each of us. It is possible to shed a few appreciative tears on every page of this book if you entertain the thought that the pilot IS The Little Prince. Maybe you won''t think that--maybe you''ll have your own take on the book---that''s the magic about it. This book is translated to English from French. If you understand and/or appreciate French, the deliciousness of that fact can affect you in addition to the sweet storyline itself. The book won''t even take you a whole day to read. Consider honoring the Little You that still remains, and resides within you, and read this salute to childhood, to innocence, and to you. It just takes a ''Little'' imagination and bravery.')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (4, N'Hazel is a 16 year old girl with stage IV thyroid cancer, and has been living with an oxygen tank since she was first diagnosed at 12. She realizes she is going to die, but she is on a drug that is keeping the tumors at bay. At a support group meeting she meets hottie Augustus Waters, who is in remission. They immediately hit it off and change each others lives drastically.


The Fault in Our Stars is another beautifully written book by John Green. A few months ago John made a video on his youtube channel, and in this video he read the first two chapter of this book. I was hooked instantly. I wanted to know everything there was to know about Hazel and Augustus. I''m not going to say that this was the most original cancer book out there, but it felt more personal.


Let''s start with the characters. John Green wrote the same exact character over and over again in his previous books. This is one complaint I''ve always had, but you won''t find that here. Hazel is no Alaska Young, she is no Margot. She''s just Hazel, and she''s lovely. Same with Augustus. He''s unlike all of John Greens male characters, and I adore him.


There is simply one complaint I have about this book. John needs to make his 17 year old characters sound more like 17 year old teens than 35 year old men. Most of the dialog in this book and sweet and enjoyable, but then the characters come out with these crazy words and there are other ways to show your characters are intelligent people without always making them spout out these weird, random words. In all honesty it''s a bit annoying, but it doesn''t bother me too much, because I understand that his younger readers will build a much better vocabulary if they pay attention. Also, his book is full of quotable lines as you can clearly see from everyone else''s reviews.


I''ve said it before, and I''ll say it again. John is a phenomenal writer. He''s great at building suspense when needed, and also at hitting you in the gut with a healthy dose of raw emotion. Almost everyone I know who has read this book cried. At least a little. He also throws in lots of humor which is usually appreciated to break up sad moments.


As far as John writing a female voice for the first time, I thought he did a good job. This book wasn''t life-changing for me, but I easily could see how others could be affected by this book in an astounding way. It tackles cancer, death, loss of sight, loss of loved ones, love, thoughts of the afterlife and shows vividly from one girls perspective what it may feel like to know you are dying. This book may not suit everyone, but if you don''t have issues reading about those things I would recommend this book to you. It was quite depressing at times, but I''m sure you would know that just by reading the synopsis.')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (5, N'This is not the most profound of novels, but it may be the most compelling. Many of its sequences--the Diamond Studs, Milady''s seduction of Felton, the attempt of D''Artagnan and The Three to rescue Constance--move with remarkable rapidity. More notable than these, however, is the entire exposition, something many novelists have found to be a thankless chore, if not a stumbling block. It occupies a full sixty pages, 10% of the book, and, although it covers much ground--the introduction of our hero, the two principal villains, and all three Musketeers with their eccentricities and distinct characters, plus the fight with the Cardinal''s Guards, the emergence of D''Artagnan as the "fourth musketeer," and an examination of the curious relationship between King and Cardinal--it is constructed with such seamless grace, accomplishes its purposes with such a light touch, and moves so swiftly that the result is astonishing.

Sir Walter Scott showed us that the personal is political, that our most particular, most intimate decisions are governed by the political milieu in which we are raised and the allegiances that our background requires. Dumas adopts the contrary principle, namely, that the political is personal: a siege may be lifted, a war started, because an English Duke loves a French Queen. It seems at times that all the characters of "The Three Musketeers"--even the King and the Cardinal, even that most gifted and ruthless of femme fatales, Milady--are satellites circling the binary star of Buckingham and l''Autriche, whose doomed love is the center of this impossible--and delightful--romantic universe. ')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (6, N'This book is about a young man who was left abandoned on a highway when he was only three days old. He grew up in an orphanage and he is living a normal life. Suddenly he has these feelings that compel him to take actions. Next thing you know he is in a battle for humanity.

I have read reviews on this site that compare this to the Odd Thomas series that was written by this author. I felt the same way. I thought this book was terrific for the first half and I was enthralled by it. We have the grand scope of the battle between good versus evil and it reminded me of the early works of Koontz. There were other hallmarks of his early writing like the humor in the face of danger, a dog, and strangers that are willing to help at a drop of a pin without asking questions. I was so happy with this book. Unfortunately this book takes a turn and it becomes a small personal quest for the main character. I did not care for this turn of events. This turn of events fit in within the story but it also seemed too coincidental at the same time. Also, with this turn of events many questions were left unanswered from the first half. Maybe this is the beginning of a new series and we will find out more information about this setting and the characters.

I loved the first half of this book. It was classic Koontz. Some might argue it was too much like classic Koontz as he did seem to borrow from previous works. It did not bother me at all. The second half of this book lost me a little. While both halves were influenced by today''s society the second half seemed to reflect it a little too much. It was a little too preachy for my tastes. This author has always used today''s society as an influence but this book delved into that aspect heavily at times. This was a decent read but it could have been better. I can see how this might be a beginning of a series and it has the potential to become a series that I would enjoy.')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (7, N'Crime fiction. That’s what Billy Summers is. Let’s get that out of the way from the outset so Uncle Stevie’s Constant Readers can prepare themselves accordingly and the “I’ve never read Stephen King!” people can open their minds to finally giving him a try.

And I do hope they will, because Billy Summers is a damn fine book by any measure. Many are saying its his best in years, and I have to agree with them. It’s a non-horror jewel in King’s crown that could possibly be mistaken for a novel by an author like S.A. Cosby or maybe even Dennis Lehane. No horror, no ghosts. (Well, unless you count the ghosts of King’s canon that float through the story in the form of delightfully placed Easter eggs. I see you, clown in the backseat! I adore you, Overlook Hotel hedge maze!)

While Billy Summers the book comes close to perfection, Billy Summers the character is imperfectly perfect. He’s an Iraq war sniper who puts his post-battle skills to use as a hitman for hire. But he’s a hitter with a heart of gold, because he only takes jobs to take out “bad people.” (Yes, it’s a little “Barry” meets “Dexter.”) The first part of the novel meanders through the set up of his character and his “final job,” and then at the midway point it takes off in a direction I never saw coming. And that direction is in the form of a relationship between two characters I’ll remember for a long time.

Billy Summers also features the book-within-a-book device, because Billy is writing a memoir about his childhood and war experiences. Readers get even more context to his motivations through those sections.

Now, there is violence. There are very graphically described sexual assaults. There is a lot of anti-Trump sentiment. BUT, there is a beautiful ending. King has finally landed the plane on the runway of repletion.

This one did indeed leave me satisfied from start to finish. Thanks, Uncle Stevie.')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (8, N'Mario Puzo creates his awesome world & then plays with his own elements (those of detective noir and mob drama) like a world-class chess champion. Less than a fourth into the narrative, POW! the Don has been shot. And, hold on a sec, who is the protagonist here? I thought Michael. Or the Consigliari Hagen. Or Hollywood heart-throb Johnny Fontaine? The full display of individual destinies is what makes this better than its cinematic equivalent. Here we see flesh-and-blood people living at a Hadean level-- system of business ethics and family morality included. Anyway, the novel''s true nature is "the nature of the universe, the interlinking of good & evil, natural of itself." (392)

Masterful!-- As close as there is to a SOAP OPERA for MEN. The need for reinvention, as well as the necessity to keep things in line with tradition are explored fully. Interesting to note are: the general absence of Fredo, the omnipresence of Johnny Fontaine... the Hollywood sex parties in detail (and how''s this for risqué [& appropriate to the season]: Best Actor & Best Actress in public sex), plus invaluable insights (like the entire Book V, largely absent from the beloved film) as bizarre as sexual readjustment surgeries and as natural as mob allegiances in Vegas. This is pure entertainment-- decadence for the reader at full throttle!!!! This is a classic train of portraits of a kingdom in steep decline, of its vindication and revolution, rife with those beloved Shakespearean precepts like corruption, revenge & fate.')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (9, N'Not much more needs to be said about The Hobbit than that it is excellent! Great storytelling, fun characters, humor, action – it has it all. Tolkien is rightfully one of the (if not THE) founding fathers of modern Fantasy. If you are already into the Fantasy genre and you haven’t read him, you need to. If you are looking to get into Fantasy, The Hobbit is a great place to start.

One of the great things about The Hobbit is that I think it is easily accessible to a wide audience. The Lord of the Rings is a much larger and more daunting commitment which might be too much for the casual Fantasy fan. Then, if you are really into lore and world building, I hear people talk about The Silmarillion as a great but very dense history of Middle Earth. So, Tolkien has it all: Fantasy-101 or master’s thesis level Fantasy – you can decide how you want to approach his works.

One thing that has been bugging me about other Fantasy novels I have been reading lately is that there is a lot of wandering around without much action or story progress. And, this wandering around can stretch for several books. With The Hobbit, there is adventure, and “wandering”, but it moves quickly and gets to the point. Large chunks of progress are made without pages and pages of rambling dialogue. I appreciate how well The Hobbit gets to the point but does not leave you feeling cheated by it going too fast.

Another thing that I love about this Fantasy book is that it does not bog down with complicated names, location terminology, odd magic systems, etc. This is another thing that has been turning me off to other Fantasy lately because I cannot just escape and enjoy the book. Instead, I have to keep a notebook and a flowchart to keep everything straight! With The Hobbit, it was very organic and easy to follow – perfect for a relaxing Fantasy getaway for the brain.

I did not yet see the recent movies they made from this book but was surprised at first that they made it into three movies. After rereading this, I think I can see how they could expand on certain parts to make a movie trilogy. I will have to go and check it out now.

The Hobbit – read it!')
INSERT [dbo].[Review] ([idBook], [ReviewContent]) VALUES (10, N'The original Swedish title of this book is "Men Who Hate Women." If you ask me, it suits this story much better than catchier but less relevant "The Girl with the Dragon Tattoo," because it is in fact about men doing all kinds of horrid things to women. So here is the first warning to you, if you don''t handle violence against women and children well, skip this novel.

It''s hard to give a short synopsis of the book. "The Girl with the Dragon Tattoo" starts off as an investigation of a 40-year old disappearance of a teenage heiress, but gradually morphs into a tale of serial murder and corporate trickery spanning several continents and later takes in complicated international financial fraud and the buried evil past of a wealthy Swedish industrial family.

I found this book extremely engaging and full of action and came to regret many times that I had an audio version instead of a regular paper book. I also enjoyed immensely the amount details about everything - the publishing business, twisted Swedish family, corporate crime, history and political order of Sweden, etc. I am guessing if you don''t care to read about any of this subjects, this book is not for you, because it is packed with this information.

My only qualm about this book, a small one, was the characterization. The character of Mikael Blomkvist smelled of a male wish fulfillment fantasy, the one where a man is adored by all women, gets laid all the time and always gets lauded for his stellar bedroom skills. Lisbeth Salander also felt a little shaky and I thought Asberger''s decease didn''t quite account for her strange personality. I thought her antisocial behavior was inconsistent.

This however didn''t spoil my reading experience. I am eager to move on to "The Girl Who Played with Fire" and see what Mikael and Lisbeth are up to next.')
INSERT [dbo].[User] ([username], [password], [isAdmin], [fullname], [email]) VALUES (N'dang', N'999', 0, N'Nguyen Hai Dang', N'dan113@gmail.com')
INSERT [dbo].[User] ([username], [password], [isAdmin], [fullname], [email]) VALUES (N'ntson', N'123', 1, N'Nguyen Tien Son', N'sontse160027@gmal.com')
INSERT [dbo].[User] ([username], [password], [isAdmin], [fullname], [email]) VALUES (N'toan17', N'111', 0, N'Nguyen Huu Toan', N'toan99@gmail.com')
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Author] FOREIGN KEY([authorID])
REFERENCES [dbo].[Author] ([id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Author]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Rating] FOREIGN KEY([ratings])
REFERENCES [dbo].[Rating] ([id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Rating]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Books] FOREIGN KEY([idBook])
REFERENCES [dbo].[Books] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Books]
GO
USE [master]
GO
ALTER DATABASE [PheSach] SET  READ_WRITE 
GO
