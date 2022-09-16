class Sidebar
    CLOSE_SIDEBAR_BTN = { id: "react-burger-cross-btn" }.freeze
    ALL_ITEMS_LINK = { id: "inventory_sidebar_link" }.freeze
    ABOUT_LINK = { id: "about_sidebar_link" }.freeze
    LOGOUT_LINK = { id: "logout_sidebar_link" }.freeze
    RESET_APP_STATE_LINK = { id: "reset_sidebar_link" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def click_close_sidebar_button
        @driver.click(CLOSE_SIDEBAR_BTN)
    end

    def click_all_items
        @driver.click(ALL_ITEMS_LINK)
    end

    def click_about
        @driver.click(ABOUT_LINK)
    end

    def click_logout
        @driver.click(LOGOUT_LINK)
    end

    def click_preset_app_state
        @driver.click(RESET_APP_STATE_LINK)
    end
end