class CheckoutCompletePage
    CHECKOUT_COMPLETE_TITLE = { xpath: "//span[@class='title'][text()='Checkout: Complete!']" }.freeze
    BACK_HOME_BTN = { id: "back-to-products" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def on_checkout_complete_page?
        @driver.element_present?(CHECKOUT_COMPLETE_TITLE)
    end

    def click_back_home
        @driver.click(BACK_HOME_BTN)
    end
end