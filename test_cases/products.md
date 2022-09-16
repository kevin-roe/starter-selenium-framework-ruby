# Products Page Test Cases

## Products-01 - User can add and remove an item to the cart from the products page

Priority: <span style="color:red">Critical</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page
6. Validate the cart badge icon on the cart icon is not present
7. Click Add To Cart on any product
8. Validate Cart Badge Icon appears containing the number 1
9. Validate the button changes from Add to Cart to Remove
10. Click the Remove button
11. Validate Cart Badge Icon disappears
12. Validate Remove buttons reverts back to Add To Cart

## Products-02 - Products are sorted by ascending name by default

Priority: <span style="color:green">Medium</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page
6. Validate the products are listed in ascending alphabetic order by default

## Products-03 - Products can be sorted by descending name

Priority: <span style="color:green">Medium</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page
6. Select "Name (Z to A)" from dropdown in the upper-right corner of the screen
7. Validate the products are listed in descending alphabetic order

## Products-04 - Products can be sorted by ascending price

Priority: <span style="color:green">Medium</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page
6. Select "Price (Low to High)" from dropdown in the upper-right corner of the screen
7. Validate the products are listed in ascending order by price

## Products-05 - Products can be sorted by descending price

Priority: <span style="color:green">Medium</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page
6. Select "Price (High to Low)" from dropdown in the upper-right corner of the screen
7. Validate the products are listed in descending order by price
