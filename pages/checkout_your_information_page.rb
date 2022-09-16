class CheckoutYourInformationPage
    CHECKOUT_TITLE = { xpath: "//span[@class='title'][text()='Checkout: Your Information']" }.freeze
    FIRST_NAME_INP = { id: "first-name" }.freeze
    LAST_NAME_INP = { id: "last-name" }.freeze
    ZIP_CODE_INP = { id: "postal-code" }.freeze
    CANCEL_BTN = { id: "cancel" }.freeze
    CONTINUE_BTN = { id: "continue" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def on_checkout_page?
        @driver.element_present?(CHECKOUT_TITLE)
    end

    def set_first_name(value)
        @driver.set_text(FIRST_NAME_INP, value)
    end

    def set_last_name(value)
        @driver.set_text(LAST_NAME_INP, value)
    end

    def set_zip_code(value)
        @driver.set_text(ZIP_CODE_INP, value)
    end

    def click_cancel_button
        @driver.click(CANCEL_BTN)
    end

    def click_continue_button
        @driver.click(CONTINUE_BTN)
    end
end
