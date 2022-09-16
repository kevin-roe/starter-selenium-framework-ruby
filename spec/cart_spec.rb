describe "Cart" , :cart do
    before(:all) do
        require_relative "../driver"
        require_relative "../pages/login_page"
        require_relative "../pages/products_page"
        require_relative "../pages/cart_page"

        require_relative "../pages/partials/header"
        require_relative "../pages/partials/sidebar"
    end

    before(:each) do
        @driver = Driver.new(:firefox)

        @login = LoginPage.new(@driver)
        @products = ProductsPage.new(@driver)
        @cart = CartPage.new(@driver)

        @header = Header.new(@driver)
    end

    after(:each) do
        @driver.quit
    end

    context "Positive Tests" do
        it "Cart-01 - User can add items from the products page and remove the item in the cart" do
            product_name = "Sauce Labs Fleece Jacket"

            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true
            @products.click_add_to_cart_button(product_name)
            @header.click_cart_link

            expect(@cart.on_cart_page?).to be true
            expect(@cart.item_in_cart?(product_name)).to be true
            expect(@cart.item_qty(product_name)).to eql 1
            item_desc = "It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office."
            expect(@cart.item_description(product_name)).to eql item_desc
            expect(@cart.item_price(product_name)).to eql "$49.99"
            @cart.click_remove_button(product_name)
            expect(@cart.item_in_cart?(product_name)).to be false
            expect(@header.cart_badge_present?).to be false
        end

        it "Cart-02 - User can edit items in the cart" do
            product_name = "Sauce Labs Fleece Jacket"

            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true
            @products.click_add_to_cart_button(product_name)
            @header.click_cart_link

            expect(@cart.on_cart_page?).to be true
            expect(@cart.item_in_cart?(product_name)).to be true
            @cart.update_cart_item_qty(product_name, 2)
            expect(@cart.item_qty(product_name)).to eql 2
        end
    end    
end