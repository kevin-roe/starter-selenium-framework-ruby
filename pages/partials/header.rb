class Header
    SIDEBAR_TRIGGER = { id: "react-burger-menu-btn" }.freeze
    CART_LINK = { class_name: "shopping_cart_link" }.freeze
    CART_BADGE = { class_name: "shopping_cart_badge" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def click_sidebar_trigger
        @driver.click(SIDEBAR_TRIGGER)
    end

    def click_cart_link
        @driver.click(CART_LINK)
    end

    def cart_badge_present?
        @driver.element_present?(CART_BADGE)
    end

    def items_in_cart
        if cart_badge_present?
            @driver.locator_text(CART_BADGE).to_i
        else
            0
        end
        
    end
end