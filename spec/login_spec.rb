describe "Login", :login  do
    before(:all) do
        require_relative "../driver"
        require_relative "../pages/login_page"
        require_relative "../pages/products_page"

        require_relative "../pages/partials/header"
        require_relative "../pages/partials/sidebar"
    end

    before(:each) do
        @driver = Driver.new(:firefox)

        @login = LoginPage.new(@driver)
        @products = ProductsPage.new(@driver)
    
        @header = Header.new(@driver)
        @sidebar = Sidebar.new(@driver)
    end

    after(:each) do
        @driver.quit
    end

    context "Positive Tests" do
        it "Login-01 - User can login with valid credentials" do
            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true
        end

        it "Login-02 - User can log out" do
            error_msg = "Epic sadface: You can only access '/inventory.html' when you are logged in."
            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true
            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password(ENV["SWAGLABS_PASSWORD"])
            @login.click_login

            expect(@products.on_products_page?).to be true

            @header.click_sidebar_trigger
            @sidebar.click_logout
            expect(@login.on_login_page?).to be true

            @driver.navigate_to("https://www.saucedemo.com/inventory.html")
            expect(@login.on_login_page?).to be true
            expect(@login.error_message_present?). to be true
            expect(@login.error_message).to eql error_msg
        end
    end

    context "Negative Tests" do
        it "Login-04 - User cannot login with invalid password" do
            error_msg = "Epic sadface: Username and password do not match any user in this service"

            @driver.navigate_to("https://www.saucedemo.com")
            
            expect(@login.on_login_page?).to be true

            @login.set_username(ENV["SWAGLABS_USERNAME"])
            @login.set_password("not_a_valid_password")
            @login.click_login

            expect(@login.error_message_present?).to be true
            expect(@login.error_message).to eql(error_msg)

            expect(@products.on_products_page?).to be false
        end
    end
    
end