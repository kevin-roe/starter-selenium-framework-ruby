describe "Products", :products  do
    before(:all) do
        require_relative "../driver"
        require_relative "../pages/login_page"
        require_relative "../pages/products_page"
        require_relative "../pages/partials/header"
    end

    before(:each) do
        @driver = Driver.new(:firefox)

        @login = LoginPage.new(@driver)
        @products = ProductsPage.new(@driver)
        @header = Header.new(@driver)
    end

    after(:each) do
        @driver.quit
    end

    context "Positive Tests" do
        it "Products-01 - User can add and remove an item to the cart from the products page" do
            product_name = "Sauce Labs Fleece Jacket"

            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true
            expect(@header.cart_badge_present?).to be false
            @products.click_add_to_cart_button(product_name)
            expect(@header.cart_badge_present?).to be true
            expect(@header.items_in_cart).to eql 1
            @products.click_remove_button(product_name)
            expect(@header.cart_badge_present?).to be false
        end

        it "Products-02 - Products are sorted by ascending name by default" do
            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true

            product_names = @products.product_names_array
            expect(product_names).to eql product_names.sort
        end

        it "Products-03 - Products can be sorted by descending name" do
            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true

            @products.set_sort_order_name_descending
            product_names = @products.product_names_array
            expect(product_names).to eql product_names.sort.reverse
        end

        it "Products-04 - Products can be sorted by ascending  price" do
            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true

            @products.set_sort_order_price_ascending
            product_prices = @products.product_prices_array
            expect(product_prices).to eql product_prices.sort
        end

        it "Products-05 - Products can be sorted by descending price" do
            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true

            @products.set_sort_order_price_descending
            product_prices = @products.product_prices_array
            expect(product_prices).to eql product_prices.sort.reverse
        end
    end
end