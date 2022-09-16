# Login Test Cases

## Login-01 - User can login with valid credentials

Priority: <span style="color:red">Critical</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page

## Login-02 - User can log out

Priority: <span style="color:orange">High</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a valid username/password combination
4. Click the login button
5. Validate on the products page
6. Click the sidebar trigger button in the header
7. Validate the sidebar opens
8. Click the Logout button
9. Validate on the Login page
10. Navigate to https://www.saucedemo.com/inventory.html
11. Validate still on the login page
12. Validate an error message is present
13. Validate the error message reads: "Epic sadface: You can only access '/inventory.html' when you are logged in."

## Login-03 - Locked user cannot login

Priority: <span style="color:orange">High</span>

- [ ] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter a username/password combination that has been locked out.
4. Click the login button
5. Validate still on the login page
6. Validate an error message is present
7. Validate the error message reads: "Epic sadface: Sorry, this user has been locked out."

## Login-04 - User cannot login with invalid password

Priority: <span style="color:red">Critical</span>

- [x] Automated?

1. Navigate to https://www.saucedemo.com
2. Validate on the login page
3. Enter an invalid username/password combination
4. Click the login button
5. Validate still on the login page
6. Validate an error message is present
7. Validate the error message reads: "Epic sadface: Username and password do not match any user in this service"
