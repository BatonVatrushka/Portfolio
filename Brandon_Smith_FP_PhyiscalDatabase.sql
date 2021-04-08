-- Physical Database Design

/* 
	Originally, My database design had three tables. However, after spending many hours
	coding the physical database, entering values into the tables turned out to be impossible. I realized
	that my conceptual model was naive. So, I completely re-structed my database. In effect, I now only 
	have two tables. The first table is the actual UserName table while the second is the LocationList table. 
*/ 

-- Physical Database Design


-- Create the UserName Table
CREATE TABLE UserName (
-- Columns for the UserName Table
	UserNameID int IDENTITY (1, 1) NOT NULL,
	UserName varchar(50) NOT NULL,
	NarcoStatus varchar(50),
	NarcoLocation varchar(100),
-- CONSTRAINTS
	CONSTRAINT PK_UserName PRIMARY KEY(UserNameID),
	CONSTRAINT U1_UserName UNIQUE(UserName)
	);
-- End Create UserName Table

-- Now I'll attempt to actually insert some information: 
INSERT INTO UserName (UserName, NarcoStatus, NarcoLocation) 

	VALUES
	('Boho24.cc','Active',''),
	('ATB24.biz','Active',''),
	('@billExpress','Active',''),
	('@Nord_rc','Active',''),
	('@narcoteka','Active',''),
	('vor.nz','Blocked','');
-- End inserting information 

-- Begin Creating Location Table
CREATE TABLE NarcoLocationTable (
	NarcoLocationID int IDENTITY NOT NULL,
	NarcoLocationText varchar(100) NOT NULL,
	-- Constraints
	CONSTRAINT PK1_NLT PRIMARY KEY(NarcoLocationID),
	CONSTRAINT U1_NLT UNIQUE(NarcoLocationText)
	);
-- End Creating Location Table

-- Add some location names to the Location Table
INSERT INTO NarcoLocationTable (NarcoLocationText)
	VALUES
	('Dnipro'),
	('Zaporizhzhia'),
	('Krivoy Rog'), 
	('Mykolaiv'), 
	('Kherson'),
	('Kyiv'),
	('Khreshchatyk'),
	('Darnista'),
	('Kyiv Polytechnic Institute'),
	('Shulivka'), 
	('Dimiyezskaya'), 
	('st. Borschagovskaya'),
	('Victory Ave.');
-- End inserting information 

-- Create Location List Table
CREATE TABLE NarcoLocationListTable (
NarcoLocationListID int IDENTITY NOT NULL, 
UserNameID int NOT NULL, 
NarcoLocationID int NOT NULL, 
-- Constraints
	CONSTRAINT PK_NLLT PRIMARY KEY(NarcoLocationListID),
	CONSTRAINT UK_NLLT UNIQUE (UserNameID, NarcoLocationID),
	CONSTRAINT FK1_NLLT FOREIGN KEY(UserNameID) REFERENCES UserName(UserNameID),
	CONSTRAINT FK2_NLLT FOREIGN KEY(NarcoLocationID) REFERENCES NarcoLocationTable (NarcoLocationID)
	);

-- Insert more values into the UserName Table (first value w/ location)
INSERT INTO UserName (UserName, NarcoStatus, NarcoLocation)
	VALUES
	('cartel.tw', 'Active', ''),
	('broshop.one', 'Active', 'Dnipro,
	Zaporizhzhia,Krivoy Rog, Mykolaiv, Kherson');   

-- Insert the remaining values from the data 

INSERT INTO UserName (UserName, NarcoStatus, NarcoLocation)
	VALUES
	('@NostraCK', 'Not Active', ''),
	('esc777.cc', 'Not Active', ''), 
	('@cond_rc', 'Not Active', ''), 
	('t.me/yourtravmat', 'Blocked', ''), 
	('@narkofeel', 'Active', ''), 
	('rich24.cc', 'Blocked', ''), 
	('topshopik original', 'Active', ''), 
	('ATB.SEX', 'Blocked', ''), 
	('@ShopUG', 'Active', ''), 
	('@RSSSHOP', 'Active', ''), 
	('@harvest420', 'Active', 'Khreshchatyk'),
	('@TGK31NEW', 'Active', ''), 
	('@KOLNINE', 'Blocked', ''), 
	('@ArtistGena', 'Active', ''), 
	('Legalizer.info', 'Active', ''), 
	('ATB.PM', 'Blocked', ''), 
	('ToRrc', 'Not Active', ''), 
	('TET.NZ', 'Not Active', ''), 
	('bmwrc.bz', 'Active', ''), 
	('@demetra.ukr', 'Not Active', ''), 
	('@demetraukr', 'Not Active', ''), 
	('@yabber.ru', 'Blocked', ''), 
	('@ya.rasvet', 'Blocked', ''), 
	('@Pixar_shop', 'Not Active', ''), 
	('rcclub.cc', 'Not Active', ''), 
	('@ATB24_super', 'Not Active', ''), 
	('@Roshen24_bot', 'Blocked', ''), 
	('ToRrc.cc', 'Not Active', ''), 
	('@valeriia_damiwu', 'Blocked', ''), 
	('@Renaikey132', 'Blocked', ''), 
	('@VHS404_bot', 'Blocked', ''), 
	('@goodtrip666', 'Active', ''), 
	('@cultsabbat', 'Active', ''), 
	('@hotline419', 'Not Active', ''), 
	('@xtz.rc', 'Blocked', ''), 
	('@barry_ua123', 'Not Active', ''), 
	('@24ds.ga', 'Active', ''), 
	('@Le_silpo', 'Active', 'Khreshchatyk'), 
	('@Le_silpo1', 'Active', 'Khreshchatyk'), 
	('@DRGS4US', 'Active', 'Khreshchatyk'),
	('@drgs4ussa', 'Active', 'Khreshchatyk'), 
	('@km142', 'Active', ''), 
	('@psyhoway', 'Active', ''), 
	('@snegua', 'Active', ''), 
	('@zaklad2011t.g.', 'Active', ''), 
	('@PH_WAR', 'Active', 'Darnista'), 
	('@KYIV420', 'Active', 'Darnista'), 
	('@telegram24', 'Active', 'Darnista'), 
	('@TORRC', 'Active', 'Darnista'), 
	('@PsychoWay', 'Active', 'Darnista'), 
	('@HPRSHP', 'Active', 'Kyiv Polytechnic Institute'), 
	('@Chameleon.Shop', 'Active', 'Kyiv Polytechnic Institute'), 
	('@ATB24_super_6', 'Active', 'Kyiv Polytechnic Institute'), 
	('https://t.melUkrShop', 'Active', 'Kyiv Polytechnic Institute'), 
	('8BR8HB', 'Active', 'Kyiv Polytechnic Institute'), 
	('@BIGMiB', 'Active', 'Kyiv Polytechnic Institute'), 
	('@SPRSHP', 'Active', 'Kyiv Polytechnic Institute'), 
	('@gamanets', 'Active', 'Kyiv Polytechnic Institute'), 
	('@inark', 'Active', 'Kyiv Polytechnic Institute'), 
	('@Esc777topbot', 'Active', 'Kyiv Polytechnic Institute'), 
	('@Sulfatooo', 'Active', 'Kyiv Polytechnic Institute'), 
	('@Big_Mib', 'Active', 'Kyiv Polytechnic Institute'), 
	('@pirat', 'Active', 'Kyiv Polytechnic Institute'), 
	('@RUNKSHOP', 'Active', 'Shulivka'), 
	('DH24.BIZ', 'Active', 'Dimiyezskaya'), 
	('@TGK31NEWS', 'Active', 'st. Borschagovskaya'), 
	('@pokemon_777', 'Active', 'Victory Ave.'); 

/* 
	The following code contains the INSERT statements for
	the NarcoLocationList Table
*/

-- Now we need to add values into the Location List Table
-- Let's do a test run, first:
INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID FROM UserName WHERE UserName = 'broshop.one'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Dnipro'));

-- Select Statment to see if the above code worked
SELECT * FROM NarcoLocationListTable

-- Let's do another run
INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID FROM UserName WHERE UserName = 'broshop.one'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Zaporizhzhia'));

-- Check the code above
SELECT * FROM NarcoLocationListTable

-- Continue with the INSERT statements for broshop.one

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID FROM UserName WHERE UserName = 'broshop.one'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Krivoy Rog')),
	((SELECT UserNameID FROM UserName WHERE UserName = 'broshop.one'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Mykolaiv')),
	((SELECT UserNameID FROM UserName WHERE UserName = 'broshop.one'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kherson'));

-- More INSERT statements for the LocationListTable (Khreshchatyk)

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID FROM UserName WHERE UserName = '@harvest420'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Khreshchatyk'));
	
INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID FROM UserName WHERE UserName = '@Le_silpo'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Khreshchatyk')),
	((SELECT UserNameID FROM UserName WHERE UserName = '@Le_silpo1'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Khreshchatyk')),
	((SELECT UserNameID FROM UserName WHERE UserName = '@DRGS4US'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Khreshchatyk')),
	((SELECT UserNameID FROM UserName WHERE UserName = '@drgs4ussa'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Khreshchatyk'));

-- Observe the LocationListTable
SELECT * FROM NarcoLocationListTable

-- INSERT statements for the LocationListTable (Darnista)

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID FROM UserName WHERE UserName = '@PH_WAR'),
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Darnista')),
	((SELECT UserNameID FROM UserName WHERE UserName = '@KYIV420'),
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Darnista')),
	((SELECT UserNameID FROM UserName WHERE UserName = '@telegram24'),
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Darnista')),
	((SELECT UserNameID FROM UserName WHERE UserName = '@TORRC'),
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Darnista')),
	((SELECT UserNameID FROM UserName WHERE UserName = '@PsychoWay'),
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Darnista'));


-- Observe the LocationListTable

SELECT * FROM NarcoLocationListTable

-- INSERT statements for the LocationListTable (KPI)

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = '@HPRSHP'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = '@Chameleon.Shop'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@ATB24_super_6'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = 'https://t.melUkrShop'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '8BR8HB'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@BIGMiB'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));

-- I need to insert a telegram handle into the DB
INSERT INTO UserName (UserName, NarcoStatus, NarcoLocation)
	VALUES
	('@SRRSHP', 'Active', 'Kyiv Polytechnic Institute');
	
-- I missed another telegram handle

INSERT INTO UserName (UserName, NarcoStatus, NarcoLocation)
	VALUES
	('@Vypsho', 'Active', 'Kyiv Polytechnic Institute');

-- Continue the INSERT statements for NarcoLocationListTable (KPI)


INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = '@SPRSHP'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = '@Vypsho'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = '@SRRSHP'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));


-- Continue the INSERT statements for NarcoLocationListTable (KPI)

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = '@gamanets'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@inark'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@Esc777topbot'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@Sulfatooo'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@Big_Mib'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@Pirat'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@RUNKSHOP'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = 'DH24.BIZ'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@TGK31NEWS'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute')),
	((SELECT UserNameID From UserName WHERE UserName = '@pokemon_777'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));

-- I need to UPDATE the user vor.nz to add a location (KPI)

UPDATE UserName SET NarcoLocation = 'Kyiv PolyTechnic Institute' 
WHERE UserName = 'vor.nz'

-- See if the update worked properly

SELECT * FROM UserName WHERE UserName = 'vor.nz'

-- INSERT the above information into the NarcoLocationListTable

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID FROM UserName WHERE UserName = 'vor.nz'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Kyiv Polytechnic Institute'));

-- INSERT a new UserName into the database

INSERT INTO UserName (UserName, NarcoStatus, NarcoLocation)
	VALUES
	('@harvest4200', 'Active', 'Friendship of Nations Arch');

-- Add the new location into the Location Table

INSERT INTO NarcoLocationTable (NarcoLocationText)
	VALUES
	('Friendship of Nations Arch');

-- Now add the above information into the NarcoLocationListTable

INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = '@harvest4200'), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = 'Friendship of Nations Arch'));


/* 
	Now, as data starts to trickle it, it would be nice to have a procedure 
	to input the data and make entry more streamlined. 
*/ 


CREATE PROCEDURE AddUserInfo (@UserName varchar(50), @UserStatus varchar(50), @UserLocation varchar(100))
AS
BEGIN
	-- Include the appropriate INSERT statement
	INSERT INTO UserName (UserName, NarcoStatus, NarcoLocation)
	VALUES(@UserName, @UserStatus, @UserLocation)
END;

-- Now lets see if the procedure works
EXECUTE AddUserInfo '@BiG_Gram', 'Active', 'Lviv'

-- Now see if the row updated appropriately

SELECT * FROM UserName WHERE UserName = '@BiG_Gram'

-- Use the procedure to add more info
EXEC AddUserInfo '@TGK_ViRUS', 'Active', 'Lviv'

EXEC AddUserInfo '@NARK_RICK', 'Active', 'Lviv'

-- See if the procedure updated the rows

SELECT * FROM UserName WHERE NarcoLocation = 'Lviv'

/* 
	Now I need to create a procedure to input the appropriate
	information into the NarcoLocationTable
*/

-- Create the Procedure

CREATE PROCEDURE AddLocation (@Location varchar(100))
AS
BEGIN
	INSERT INTO NarcoLocationTable (NarcoLocationText)
	VALUES (@Location)
END;

-- Test the location procedure

EXEC AddLocation 'Lviv'

-- See if the procedure worked correctly

SELECT * FROM NarcoLocationTable WHERE NarcoLocationText = 'Lviv'

/* 
	Now I need to create a procedure to input the appropriate information 
	into the NarcoLocationListTable
*/ 

CREATE PROCEDURE AddToLocationList (@UserName varchar(50), @Location varchar(100))
AS
BEGIN
	INSERT INTO NarcoLocationListTable (UserNameID, NarcoLocationID)
	VALUES
	((SELECT UserNameID From UserName WHERE UserName = @UserName), 
	(SELECT NarcoLocationID FROM NarcoLocationTable WHERE NarcoLocationText = @Location))
END;
	
-- Execute the procedure on the new data
EXEC AddToLocationList '@BiG_Gram', 'Lviv'

EXEC AddToLocationList '@TGK_VIRUS', 'Lviv'

EXEC AddToLocationList '@NARK_RICK', 'Lviv'


SELECT * FROM NarcoLocationListTable
WHERE UserNameID = '132';