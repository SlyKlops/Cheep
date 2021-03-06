-- Code by Chris Siegler
-- 10/27/2015

USE `Cheep`;

-- -----------------------------------------------------
-- Procedure `New_User`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `New_User`;

DELIMITER //
CREATE PROCEDURE `New_User`(IN UName VARCHAR(45), IN Upwd VARCHAR(45), IN UEmail VARCHAR(45),IN Uzip VARCHAR(45))
BEGIN
	DECLARE CurID INT;
    SET CurID = (SELECT Coalesce(MAX(ID), 0) FROM `USER`) + 1;
    
    INSERT INTO `USER`(ID, Username, `Password`, Email, Zip, Date_Joined) VALUES (CurID, UName, Upwd, UEmail, Uzip, CURDATE());
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `New_Item`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `New_Item`;

DELIMITER //
CREATE PROCEDURE `New_Item`(IN IName VARCHAR(255), IN IDesc VARCHAR(255), IN ICat VARCHAR(45))
BEGIN
	DECLARE CurID INT;
    SET CurID = (SELECT Coalesce(MAX(ID), 0) FROM `ITEM`) + 1;
    
    INSERT INTO `ITEM`(ID, `Name`, Description, Category) VALUES (CurID, IName, IDesc, ICat);
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `New_Location`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `New_Location`;

DELIMITER //
CREATE PROCEDURE `New_Location` (IN LocName VARCHAR(45), IN LocZip VARCHAR(45))
BEGIN
	DECLARE CurID INT;
    SET CurID = (SELECT Coalesce(MAX(ID), 0) FROM `LOCATION`) + 1;
    
    INSERT INTO `LOCATION`(ID, `Name`, Zip) VALUES (CurID, LocName, LocZip);
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `Get_Locations_byZip`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `Get_Locations_byZip`;

DELIMITER //
CREATE PROCEDURE `Get_Locations_byZip`(IN UZip VARCHAR(45))
BEGIN
	SELECT * FROM `LOCATION` WHERE `Zip` = UZip;
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `New_ILP`
-- -----------------------------------------------------
-- Only accepts existing items/locations
-- @@COMING SOON: INCLUDING BRAND IN ILPS

DROP PROCEDURE IF EXISTS `New_ILP`;

DELIMITER //
CREATE PROCEDURE `New_ILP`(IN IName VARCHAR(255), IN LocName VARCHAR(45),IN LocZip INT, IN IPrice INT)
BEGIN
	DECLARE ItemID, LocID, CurID INT;
    SET ItemID = (SELECT ID FROM `ITEM` WHERE `Name` = IName);
    SET LocID = (SELECT ID FROM `LOCATION` WHERE `Name` = LocName AND Zip = LocZip);
    SET CurID = (SELECT Coalesce(MAX(ID), 0) FROM `ITEM_LOCATION_PRICE`) + 1;
    
    INSERT INTO `ITEM_LOCATION_PRICE` (ID, ITEM_ID, LOCATION_ID, Price) VALUES (CurID, ItemID, LocID, IPrice);    
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `Get_ILP_byZip`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `Get_ILP_byZip`;

DELIMITER //
CREATE PROCEDURE `Get_ILP_byZip`(IN UZip VARCHAR(45))
BEGIN
	SELECT `ITEM_LOCATION_PRICE`.ID, `ITEM_LOCATION_PRICE`.Price, `LOCATION`.`Name`, `ITEM`.`Name`
    FROM `ITEM_LOCATION_PRICE`, `ITEM`, `LOCATION` 
    WHERE 
		`LOCATION`.ID = `ITEM_LOCATION_PRICE`.LOCATION_ID
        AND `ITEM`.ID = `ITEM_LOCATION_PRICE`.ITEM_ID
        AND `LOCATION`.Zip = UZip
	ORDER BY `ITEM_LOCATION_PRICE`.Price ASC;    
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `Searc_ILPbyName`
-- -----------------------------------------------------
-- The flaw here is that there can be many items of the same name
-- This entire procedure is flawed. May need a different way to search

DROP PROCEDURE IF EXISTS `Search_ILPbyName`;

DELIMITER //
CREATE PROCEDURE `Search_ILPbyName`(IN IName VARCHAR(45))
BEGIN
	SELECT `ITEM`.`Name`, `LOCATION`.`Name`, `ITEM_LOCATION_PRICE`.Price
    FROM `ITEM_LOCATION_PRICE`, `ITEM`, `LOCATION`
    WHERE `ITEM_LOCATION_PRICE`.ITEM_ID IN (SELECT ID FROM `ITEM` WHERE `Name` = IName)
    AND `ITEM`.ID IN (SELECT ID FROM `ITEM` WHERE `Name` = IName)
    AND `ITEM_LOCATION_PRICE`.LOCATION_ID = `LOCATION`.ID;
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `New_List`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `New_List`;

DELIMITER //
CREATE PROCEDURE `New_List` (IN LName VARCHAR(45), IN UName VARCHAR(45))
BEGIN
	DECLARE CurID, UID INT;
    SET CurID = (SELECT Coalesce(MAX(ID), 0) FROM `LIST`) + 1;
    SET UID = (SELECT ID FROM `USER` WHERE Username = UName);
    
    INSERT INTO `LIST` (ID, USER_ID, `Name`) VALUES (CurID, UID, LName);
END // 
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `Get_Lists_byUser`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `Get_Lists_byUser`;

DELIMITER //
CREATE PROCEDURE `Get_Lists_byUser`(IN UName VARCHAR(45))
BEGIN
	SELECT * FROM `LIST` WHERE USER_ID IN (SELECT ID FROM `USER` WHERE `Username` = UName);
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `Add_ILP_toList`
-- -----------------------------------------------------
-- Again, we either need to make all names unique in IPL or we need to store ID's hidden on the page

DROP PROCEDURE IF EXISTS `Add_ILP_toList`;

DELIMITER //
CREATE PROCEDURE `Add_ILP_toList`(IN LName VARCHAR(45), IN UName VARCHAR(45),IN IName VARCHAR(45), IN ILoc VARCHAR(45), IN IZip VARCHAR(45))
BEGIN
	DECLARE ILPID, UID, ListID INT;
    SET UID = (SELECT ID FROM `USER` WHERE Username = UName);
    SET ListID = (SELECT ID FROM `LIST` WHERE `Name` = LName AND USER_ID = UID);
    SET ILPID = (SELECT ID FROM `ITEM_LOCATION_PRICE`
					WHERE ITEM_ID IN (SELECT ID FROM `ITEM` WHERE `Name` = IName)
                    AND LOCATION_ID IN (SELECT ID FROM `LOCATION` WHERE `Name` = ILoc
											AND Zip = IZip));
	INSERT INTO `LIST_has_ILP` (LIST_ID, ILP_ID) VALUES (ListID, ILPID);
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `Get_ListItems`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `Get_ListItems`;

DELIMITER //
CREATE PROCEDURE `Get_ListItems`(IN LName VARCHAR(45), IN UName VARCHAR(45))
BEGIN
	SELECT `ITEM_LOCATION_PRICE`.Price, `ITEM`.`Name`, `LOCATION`.`Name`
    FROM `ITEM_LOCATION_PRICE`, `ITEM`, `LOCATION`
    WHERE `ITEM_LOCATION_PRICE`.ITEM_ID = `ITEM`.ID
    AND `ITEM_LOCATION_PRICE`.LOCATION_ID = `LOCATION`.ID
    AND `ITEM_LOCATION_PRICE`.ID IN 
		(SELECT ILP_ID FROM `LIST_has_ILP` 
			WHERE LIST_ID IN 
				(SELECT ID FROM `LIST` 
					WHERE USER_ID IN 
						(SELECT ID FROM `USER` WHERE Username = UName) 
					AND `Name` = LName))
	ORDER BY `ITEM`.`Name` ASC;
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `OrderList_byLocation`
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `OrderList_byLocation`;

DELIMITER //
CREATE PROCEDURE `OrderList_byLocation`(IN LName VARCHAR(45), IN UName VARCHAR(45))
BEGIN
	SELECT `ITEM_LOCATION_PRICE`.Price, `ITEM`.`Name`, `LOCATION`.`Name`
    FROM `ITEM_LOCATION_PRICE`, `ITEM`, `LOCATION`
    WHERE `ITEM_LOCATION_PRICE`.ITEM_ID = `ITEM`.ID
    AND `ITEM_LOCATION_PRICE`.LOCATION_ID = `LOCATION`.ID
    AND `ITEM_LOCATION_PRICE`.ID IN 
		(SELECT ILP_ID FROM `LIST_has_ILP` 
			WHERE LIST_ID IN 
				(SELECT ID FROM `LIST` 
					WHERE USER_ID IN 
						(SELECT ID FROM `USER` WHERE Username = UName) 
					AND `Name` = LName))
	ORDER BY `LOCATION`.`Name` ASC;
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `OrderList_byPrice	`
-- -----------------------------------------------------
-- from my understanding this procedure should only return the items that are the cheapest from one location. I.e, the location with the cheapest total price.
-- There needs to be exception handling if a location is missing an item.