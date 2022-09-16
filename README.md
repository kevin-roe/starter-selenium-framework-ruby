# Starter Selenium Framework - Ruby

This project requires Ruby version 2.7.2 and the ruby gem `bundler`. You can use either RVM or ASDF to install Ruby 2.7.2 as it supports both (due to the both `.tool-versions` and `.ruby-version` files being present).

After installing ruby, you need to install bundler by using this command: `gem install bundler`.

After installing the correct version of Ruby, simply install the gems required for this project by running the command `bundle install`. This will install all the necessary dependencies.

To run the tests, just run the command `rspec`. This will run all of the selenium tests in this suite.

To generate an HTML report of the tests, run this command: `rspec --format html --out test_results/test_results.html`. This will create an HTML report and place it inside the `test_results` directory.

#### Swag Labs username and password

This project also requires a `.env` file placed at the root of the project containing the username and password. While the username and password are available on the Swag Labs login page, for the purposes of this project I will assume that the username and password should NOT be accessible in a git repository and therefore should be stored in a local environment file. See the `.env.example` file for the required format.
