# You will have to insert records of data into the products_stores table, based on the products table. 
# Find all products that are not offered in any stores (don’t have a relation with stores) 
# and insert data in the products_stores. 
# For every product saved -> product_id and 1(one) as a store_id. 
# And now this product will be offered in store with name Wrapsafe and id 1.
-- product_id – id of product
-- store_id – set it to be 1 for all products.

INSERT INTO products_stores(product_id, store_id)
	SELECT id AS product_id, 1 AS store_id
    FROM products
    WHERE id NOT IN (SELECT product_id FROM products_stores);
   
    