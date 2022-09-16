describe "Checkout Flow", :checkout_flow  do
    before(:all) do
        require_relative "../driver"
        require_relative "../pages/login_page"
        require_relative "../pages/products_page"
        require_relative "../pages/cart_page"
        require_relative "../pages/checkout_your_information_page"
        require_relative "../pages/checkout_overview_page"
        require_relative "../pages/checkout_complete_page"

        require_relative "../pages/partials/header"
    end

    before(:each) do
        @driver = Driver.new(:firefox)

        @login = LoginPage.new(@driver)
        @products = ProductsPage.new(@driver)
        @cart = CartPage.new(@driver)
        @your_information = CheckoutYourInformationPage.new(@driver)
        @overview = CheckoutOverviewPage.new(@driver)
        @complete = CheckoutCompletePage.new(@driver)
        @header = Header.new(@driver)
    end

    after(:each) do
        @driver.quit
    end

    context "Positive Tests" do
        it "Checkout-Flow-01 - User can complete a checkout process" do
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
            @cart.click_checkout_button

            expect(@your_information.on_checkout_page?).to be true
            @your_information.set_first_name("Test")
            @your_information.set_last_name("User")
            @your_information.set_zip_code("38401")
            @your_information.click_continue_button

            expect(@overview.on_overview_page?).to be true
            expect(@overview.item_in_cart?(product_name)).to be true
            expect(@overview.item_qty(product_name)).to eql 1
            item_desc = "It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office."
            expect(@overview.item_description(product_name)).to eql item_desc
            expect(@overview.item_price(product_name)).to eql "$49.99"
            expect(@overview.payment_information).to eql "SauceCard #31337"
            expect(@overview.shipping_information). to eql "FREE PONY EXPRESS DELIVERY!"
            expect(@overview.item_total). to eql "Item total: $49.99"
            expect(@overview.tax). to eql "Tax: $4.00"
            expect(@overview.total). to eql "Total: $53.99"
            @overview.click_finish

            expect(@complete.on_checkout_complete_page?).to be true
            expect(@header.cart_badge_present?). to be false
            @complete.click_back_home

            expect(@products.on_products_page?).to be true
        end
    end    
end