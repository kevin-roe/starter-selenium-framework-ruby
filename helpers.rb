module Helpers
    def self.cart_item_locator(product_name)
        "//div[@class='inventory_item_name'][text()='#{product_name}']/ancestor::div[@class='cart_item']"
    end
end