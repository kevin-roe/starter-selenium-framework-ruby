# Checkout Flow Test Cases

## Checkout-Flow-01 - User can complete a checkout process

Priority: <span style="color:red">Critical</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page
6. Click Add To Cart on any product (note the name and price of the product)
7. Click the cart icon
8. Validate on the cart page
9. Validate the name and price of the product matches what was on the products page
10. Click the checkout button
11. Validate on the Checkout: Your Information page
12. Enter "Test" for the first name
13. Enter "User" for the last name
14. Enter "38401" for the zip code
15. Click Continue button
16. Validate on the Checkout: Overview page
17. Validate the product information is right from step 6
18. Validate Payment Information equals "SauceCard #3133"
19. Validate Shipping Information equals "FREE PONY EXPRESS DELIVERY!"
20. Validate the item total matches the price from the cart and the summary from the top of the overview page
21. Validate the tax equals "$4.00"
22. Validate the Order Total equals the item price plus $4.00
23. Click Finish
24. Validate in the Checkout: Complete! page
25. Validate the cart badge icon has disappeard
26. Click Back Home
27. Validate on the products page
