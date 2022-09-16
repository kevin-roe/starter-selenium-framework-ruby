require_relative "../helpers"

class CheckoutOverviewPage
    include Helpers

    OVERVIEW_TITLE = { xpath: "//span[@class='title'][text()='Checkout: Overview']" }.freeze
    SUBTOTAL = { class_name: "summary_subtotal_label" }.freeze
    TAX = { class_name: "summary_tax_label" }.freeze
    TOTAL = { class_name: "summary_total_label" }.freeze
    CANCEL_BTN = { id: "cancel"}.freeze
    FINISH_BTN = { id: "finish" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def on_overview_page?
        @driver.element_present?(OVERVIEW_TITLE)
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

    def payment_information
        @driver.locator_text({ xpath: "(//div[text()='Payment Information:']/following-sibling::div)[1]" })
    end

    def shipping_information
        @driver.locator_text({ xpath: "(//div[text()='Shipping Information:']/following-sibling::div)[1]" })
    end

    def item_total
        @driver.locator_text(SUBTOTAL)
    end

    def tax
        @driver.locator_text(TAX)
    end

    def total
        @driver.locator_text(TOTAL)
    end

    def click_cancel
        @driver.click(CANCEL_BTN)
    end

    def click_finish
        @driver.click(FINISH_BTN)
    end
end