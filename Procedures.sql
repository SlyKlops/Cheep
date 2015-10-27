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
-- Procedure `New_IPL`
-- -----------------------------------------------------
-- This is for adding items with prices and locations.

DROP PROCEDURE IF EXISTS `New_IPL`;

DELIMITER //
CREATE PROCEDURE `New_IPL`(IN IName VARCHAR(45), IN ILoc VARCHAR(45), IN IPrice INT)
BEGIN
	DECLARE CurItemID, CurLocID, CurILPID INT;
    SET CurItemID = (SELECT Coalesce(MAX(ID), 0) FROM `ITEM`) + 1;
    SET CurLocID = (SELECT Coalesce(MAX(ID), 0) FROM `LOCATION`) + 1;
    SET CurILPID = (SELECT Coalesce(MAX(ID), 0) FROM `ITEM_LOCATION_PRICE`) + 1;
    
    INSERT INTO `ITEM`(ID, `Name`) VALUES (CurItemID, IName);
    INSERT INTO `LOCATION`(ID, `Name`) VALUES (CurLocID, ILoc);
    INSERT INTO `ITEM_LOCATION_PRICE` (ID, ITEM_ID, LOCATION_ID, Price) VALUES (CurILPID, CurItemID, CurLocID, IPrice);    
    
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `Searc_IPLbyName`
-- -----------------------------------------------------
-- The flaw here is that there can be many items of the same name
-- This entire procedure is flawed. May need a different way to search

DROP PROCEDURE IF EXISTS `Search_IPLbyName`;

DELIMITER //
CREATE PROCEDURE `Search_IPLbyName`(IN IName VARCHAR(45))
BEGIN
	SELECT `ITEM`.`Name`, `LOCATION`.`Name`, `ITEM_LOCATION_PRICE`.Price
    FROM `ITEM_LOCATION_PRICE`, `ITEM`, `LOCATION`
    WHERE `ITEM_LOCATION_PRICE`.ITEM_ID IN (SELECT ID FROM `ITEM` WHERE `Name` = IName)
    AND `ITEM`.ID IN (SELECT ID FROM `ITEM` WHERE `Name` = IName)
    AND `ITEM_LOCATION_PRICE`.LOCATION_ID = `LOCATION`.ID;
END //
DELIMITER ;

-- -----------------------------------------------------
-- Procedure `New_Item`
-- -----------------------------------------------------

-- This procedure currently does not exist because items are only under ILPs in the app

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