# As you remember at the beginning of our work, we inserted and updated some data. Now you need to remove some addresses.	
#Delete all addresses from table addresses, which id is divisible by 3.


DELETE FROM addresses
WHERE id % 3 = 0;