CREATE TABLE [dbo].[Categories] (
    [CategoryID] VARCHAR (10) NOT NULL,
    [ShortName]  VARCHAR (15) NOT NULL,
    [LongName]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);


CREATE TABLE [dbo].[Products] (
    [ProductID]        VARCHAR (10)   NOT NULL,
    [Name]             VARCHAR (50)   NOT NULL,
    [ShortDescription] VARCHAR (200)  NOT NULL,
    [LongDescription]  VARCHAR (2000) NOT NULL,
    [CategoryID]       VARCHAR (10)   NOT NULL,
    [ImageFile]        VARCHAR (30)   NULL,
    [UnitPrice]        MONEY          NOT NULL,
    [OnHand]           INT            NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID])
);



CREATE TABLE [dbo].[States] (
    [StateCode] CHAR (2)     NOT NULL,
    [StateName] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED ([StateCode] ASC)
);



CREATE TABLE [dbo].[Customers] (
    [Email]       VARCHAR (25) NOT NULL,
    [LastName]    VARCHAR (20) NOT NULL,
    [FirstName]   VARCHAR (20) NOT NULL,
    [Address]     VARCHAR (40) NOT NULL,
    [City]        VARCHAR (30) NOT NULL,
    [State]       CHAR (2)     NOT NULL,
    [ZipCode]     VARCHAR (9)  NOT NULL,
    [PhoneNumber] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([Email] ASC),
    CONSTRAINT [FK_Customers_States] FOREIGN KEY ([State]) REFERENCES [dbo].[States] ([StateCode])
);



Insert into Categories VALUES (1, 'Thriller', 'Thriller'),(2, 'Horror', 'Horror'), (3, 'Drama', 'Drama');



insert into Products values 
(1, 'ULYSSES', 'Written as an homage to Homer’s epic poem', 'verflowing with puns, references to classical literature, and stream-of-consciousness writing, this is a complex, multilayered novel about one day in the life of an ordinary man. Initially banned in the United States', 1, 'arm1.jpg', 75, 75),
(2, 'THE GREAT GATSBY', 'Set in the Jazz Age, The Great Gatsby tells the story of the mysterious millionaire Jay Gatsby', 'Great Gatsby is now considered a contender for “the Great American Novel.” Fitzgerald wanted to title the novel “Trimalchio in West Egg,” but both his wife and his editor preferred “The Great Gatsby.” Fitzgerald gave in, though he still thought that “the title is only fair, rather bad than good.', 2, 'blacklight1.jpg', 55, 55),
(3, 'A PORTRAIT OF THE ARTIST AS A YOUNG MAN', 'Published in 1916, James Joyce’s semiautobiographical tale of his alter ego', 'A bold, innovative experiment with both language and structure, the work has exerted a lasting influence on the contemporary novel; Alfred Kazin commented that “Joyce dissolved mechanism in literature as effectively as Einstein destroyed it in physics.” Reviewing the book in The New Republic, H. G. Wells wrote', 3, 'cat1.jpg', 49, 49),
(4, 'LOILITA', 'olita tells the story of middle-aged Humbert Humbert’s love for twelve-year-old Dolores Haze', 'In Reading Lolita in Tehran, Azar Nafisi summarized the book as “hopeful, beautiful even, a defense not just of beauty but of life . . . Nabokov, through his portrayal of Humbert, has exposed all solipsists who take over other people’s lives.”', 1, 'cool1.jpg', 110, 110),
(5, 'BRAVE NEW WORLD', 'Though Brave New World is less famous than George Orwell’s 1984,', 'Juxtaposing Orwell’s and Huxley’s dystopias, the critic Neil Postman commented: “What Orwell feared were those who would ban books. What Huxley feared was that there would be no reason to ban a book, for there would be no one who wanted to read one. . . . Orwell feared that the truth would be concealed from us. Huxley feared the truth would be drowned in a sea of irrelevance.”', 1, 'fog1.jpg', 36, 36),
(6, 'THE SOUND AND THE FURY', 'Narrated by the Compson siblings—Benjy, a source of shame for his family due to his diminished mental capacity', 'The Sound and the Fury is a tragedy of haunted lives. As each of these characters reflect on the fourth sibling, beautiful and free-spirited Caddy, Faulkner paints an indelible portrait of a family in disarray. While The Sound and the Fury was dismissed by its author as a “splendid failure,” it is now considered a masterpiece and played a crucial role in Faulkner being awarded the 1949 Nobel Prize in Literature.', 1, 'fogjuice1.jpg', 75, 75),
(7, 'CATCH-22', 'This satirical novel follows U.S. Captain John Yossarian and his squadron of World War II fighters', 'Based on American author Joseph Heller’s own wartime experiences, the novel explores the many facets of war and employs a unique narrative structure. Catch-22 is widely seen as one of the most significant American novels of the twentieth century. The New York Times called it “a dazzling performance that will outrage nearly as many readers as it delights.', 1, 'head1.jpg', 68, 68),
(8, 'DARKNESS AT NOON', 'Set in the midst of Stalin’s 1936–1938 purges—when Stalin executed as many as 1.75 million peasants', 'Darkness at Noon is the story of a man named Rubashov, who is arrested in the middle of the night by the state’s secret police. The Party he has long served tortures him and demands he confess to crimes they know he has not committed. Darkness at Noon sold over 400,000 copies when it was published and its portrait of Communism was a major factor in the Communist Party’s defeat in France.', 1, 'head2.jpg', 40, 40);
