require_relative "../helpers"

class CartPage
    include Helpers

    CART_TITLE = { xpath: "//span[@class='title'][text()='Your Cart']" }.freeze
    CHECKOUT_BTN = { id: "checkout" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def on_cart_page?
        @driver.element_present?(CART_TITLE)
    end

    def update_cart_item_qty(product_name, new_qty)
        locator = { xpath: "#{Helpers::cart_item_locator(product_name)}//div[@class='cart_quantity']" }
        @driver.set_text(locator, new_qty)
    end

    def item_in_cart?(product_name)
        locator = { xpath: "//div[@class='inventory_item_name'][text()='#{product_name}']" }
        @driver.element_present?(locator)
    end

    def item_qty(product_name)
        locator = { xpath: "#{Helpers::cart_item_locator(product_name)}//div[@class='cart_quantity']" }
        @driver.locator_text(locator).to_i
    end

    def item_description(product_name)
        locator = { xpath: "#{Helpers::cart_item_locator(product_name)}//div[@class='inventory_item_desc']" }
        @driver.locator_text(locator)
    end

    def item_price(product_name)
        locator = { xpath: "#{Helpers::cart_item_locator(product_name)}//div[@class='inventory_item_price']" }
        @driver.locator_text(locator)
    end

    def click_remove_button(product_name)
        locator = { xpath: "#{Helpers::cart_item_locator(product_name)}//button[text()='Remove']" }
        @driver.click(locator)
    end

    def click_checkout_button
        @driver.click(CHECKOUT_BTN)
    end
end