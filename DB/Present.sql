USE `Cheep`;

DELETE FROM USER;
DELETE FROM ITEM;
DELETE FROM LOCATION;
DELETE FROM ITEM_LOCATION_PRICE;
DELETE FROM `LIST`;

-- -----------------------------------------------------
-- REGISTER A NEW USER
-- -----------------------------------------------------
-- @@COMING SOON: Validation check.

CALL `New_User`('Chris','zxc','chris@awesome.net','36082');

-- -----------------------------------------------------
-- ADD ITEMS
-- -----------------------------------------------------
CALL `New_Item`('Bacon', 'Canadian', 'Meat');
CALL `New_Item`('Socks', 'Puma', 'Apparel');
CALL `New_Item`('AA Batteries', 'Rayovac', 'Electronics');
CALL `New_Item`('Chicken', 'Local Cut?', 'Poultry');
CALL `New_Item`('Mayonaise', 'Great Value', 'Condiment');
CALL `New_Item`('Water', 'Sam\'s Choice', 'Beverage');
CALL `New_Item`('Bologne', 'Oscar Meyer', 'Meat');

-- -----------------------------------------------------
-- VIEW ITEMS
-- -----------------------------------------------------

SELECT * FROM `ITEM`
ORDER BY CATEGORY ASC;

-- -----------------------------------------------------
-- ADD LOCATION
-- -----------------------------------------------------
CALL `New_Location`('Piggly Wiggly', '36082');
CALL `New_Location`('WalMart', '36082');
CALL `New_Location`('Food World', '36082');
CALL `New_Location`('WalMart', '36330');

-- -----------------------------------------------------
-- VIEW LOCATIONS
-- -----------------------------------------------------
CALL `Get_Locations_byZip`('36082');

-- -----------------------------------------------------
-- ADD ITEM_LOCATION_PRICE
-- -----------------------------------------------------
CALL `New_ILP`('Bacon','Piggly Wiggly', '36082', 8.00);
CALL `New_ILP`('Bacon','WalMart', '36082', 7.63);
CALL `New_ILP`('Bacon','Food World', '36082', 4.98);

CALL `New_ILP`('Chicken','Piggly Wiggly', '36082', 6.22);
CALL `New_ILP`('Chicken','WalMart', '36082', 5.37);
CALL `New_ILP`('Chicken','Food World', '36082', 5.37);

CALL `New_ILP`('Mayonaise','Piggly Wiggly', '36082', 2.68);
CALL `New_ILP`('Mayonaise','Food World', '36082', 3.14);

CALL `New_ILP`('Bologne','WalMart', '36082', 12.00);

CALL `New_ILP`('Socks','WalMart', '36082', 8.99);
CALL `New_ILP`('Water','WalMart', '36082', 3.85);
CALL `New_ILP`('AA Batteries','WalMart', '36082', 6.99);

-- -----------------------------------------------------
-- VIEW ILP's
-- -----------------------------------------------------
-- @@COMING SOON: VIEW ILP by ITEM.NAME
CALL `Get_ILP_byZip`('36082');

-- -----------------------------------------------------
-- ADD LIST
-- -----------------------------------------------------
-- @@COMMENT: Lists are unique to users.
CALL `New_List`('Dinner Shopping List', 'Chris');
CALL `New_List`('Running out of these', 'Chris');
CALL `New_List`('Gaming Supplies', 'Chris');

-- -----------------------------------------------------
-- VIEW USER LISTS
-- -----------------------------------------------------
CALL `Get_Lists_byUser`('Chris');

-- -----------------------------------------------------
-- ADD ILP TO LIST
-- -----------------------------------------------------
-- @@COMING SOON: ILP's will be added by Item Name. Cheep will return a search for item and allow user to choose from avaiable ILP's of that Item.
-- @@COMING SOON: WHEN TIE BETWEEN STORES (e.g Chicken at Walmart and Food World) CHEEP WILL ALLOW USER TO CHOOSE OR WILL PICK FROM WHAT STORE APPEARS MOST ALREADY ON LIST
CALL `Add_ILP_toList`('Dinner Shopping List', 'Chris','Bacon', 'Food World', '36082');
CALL `Add_ILP_toList`('Dinner Shopping List', 'Chris','Chicken', 'Food World', '36082');
CALL `Add_ILP_toList`('Dinner Shopping List', 'Chris','Mayonaise', 'Piggly Wiggly', '36082');
CALL `Add_ILP_toList`('Dinner Shopping List', 'Chris','Bologne', 'WalMart', '36082');

CALL `Add_ILP_toList`('Running out of these', 'Chris','Socks', 'WalMart', '36082');
CALL `Add_ILP_toList`('Running out of these', 'Chris','Water', 'WalMart', '36082');

CALL `Add_ILP_toList`('Gaming Supplies', 'Chris','AA Batteries', 'WalMart', '36082');

-- -----------------------------------------------------
-- VIEW LIST ITEMS
-- -----------------------------------------------------
CALL `Get_ListItems`('Dinner Shopping List','Chris');
CALL `Get_ListItems`('Running out of these','Chris');
CALL `Get_ListItems`('Gaming Supplies','Chris');