class LoginPage
    USERNAME_INP = { id: "user-name" }.freeze
    PASSWORD_INP = { id: "password" }.freeze
    LOGIN_BTN = { id: "login-button" }.freeze
    ERROR_MSG = { xpath: "//h3[@data-test='error']" }.freeze
    CLOSE_ERROR_BTN = { xpath: "//button[@data-test='error-button']" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def on_login_page?
        @driver.element_present?(USERNAME_INP)
    end

    def set_username(value)
        @driver.set_text(USERNAME_INP, value)
    end

    def set_password(value)
        @driver.set_text(PASSWORD_INP, value)
    end

    def click_login
        @driver.click(LOGIN_BTN)
    end

    def error_message_present?
        @driver.element_present?(ERROR_MSG)
    end

    def error_message
        @driver.locator_text(ERROR_MSG)
    end
end