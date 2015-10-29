USE `Cheep`;

DELETE FROM USER;
DELETE FROM ITEM;
DELETE FROM LOCATION;
DELETE FROM ITEM_LOCATION_PRICE;

CALL `New_User`('Chris','abc', 'chris@cheep.com', '23435');

SELECT * FROM USER;

CALL `New_ILP`('Bacon', 'Piggly Wiggly', 7);
CALL `New_ILP`('Apples', 'Piggly Wiggly', 12);
CALL `New_ILP`('Toast', 'Piggly Wiggly', 10);
CALL `New_ILP`('Milk', 'Piggly Wiggly', 4);

SELECT * FROM ITEM_LOCATION_PRICE;

SELECT * FROM ITEM;
SELECT * FROM LOCATION;

CALL `Search_ILPbyName`('Bacon');

CALL `New_Location`('WalMart', '36082');

SELECT * FROM LOCATION;

CALL `New_List`('Grocery', 'Chris');
CALL `New_List`('Sex Party', 'Chris');
CALL `New_List`('Thanksgiving', 'Chris');
CALL `New_List`('Munchies', 'Chris');

SELECT * FROM LIST;

CALL `Add_ILP_toList`('Grocery', 'Chris', 'Bacon', 'Piggly Wiggly', 00000);
CALL `Add_ILP_toList`('Grocery', 'Chris', 'Apples', 'Piggly Wiggly', 00000);
CALL `Add_ILP_toList`('Grocery', 'Chris', 'Toast', 'Piggly Wiggly', 00000);
CALL `Add_ILP_toList`('Grocery', 'Chris', 'Milk', 'Piggly Wiggly', 00000);

SELECT * FROM `LIST_has_ILP`;

CALL `Get_UserLists`('Chris');
CALL `Get_ListItems`('Grocery', 'Chris');