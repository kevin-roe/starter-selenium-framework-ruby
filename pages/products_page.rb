class ProductsPage
    PRODUCTS_TITLE = { xpath: "//span[@class='title'][text()='Products']" }.freeze
    SORT_ORDER_SELECT = { xpath: "//select[@data-test='product_sort_container']" }.freeze
    PRODUCT_NAME = { class_name: "inventory_item_name" }.freeze
    PRODUCT_PRICE = { class_name: "inventory_item_price" }.freeze

    def initialize(driver)
        @driver = driver
    end

    def on_products_page?
        @driver.element_present?(PRODUCTS_TITLE)
    end

    def product_names_array
        arr = []
        elements_arr = @driver.elements(PRODUCT_NAME)
        elements_arr.each do |elem|
            arr.push(@driver.element_text(elem))
        end
        arr
    end

    def product_prices_array
        arr = []
        elements_arr = @driver.elements(PRODUCT_PRICE)
        elements_arr.each do |elem|
            arr.push(@driver.element_text(elem).gsub("$", "").to_f)
        end
        arr
    end

    def set_sort_order_name_ascending
        @driver.select_from_dropdown(SORT_ORDER_SELECT, :value, "az")
    end

    def set_sort_order_name_descending
        @driver.select_from_dropdown(SORT_ORDER_SELECT, :value, "za")
    end

    def set_sort_order_price_ascending
        @driver.select_from_dropdown(SORT_ORDER_SELECT, :value, "lohi")
    end

    def set_sort_order_price_descending
        @driver.select_from_dropdown(SORT_ORDER_SELECT, :value, "hilo")
    end

    def click_add_to_cart_button(product_name)
        locator = { xpath: "//div[@class='inventory_item_name'][text()='#{product_name}']/ancestor::div[@class='inventory_item']//button[text()='Add to cart']" }
        @driver.click(locator)
    end

    def click_remove_button(product_name)
        locator = { xpath: "//div[@class='inventory_item_name'][text()='#{product_name}']/ancestor::div[@class='inventory_item']//button[text()='Remove']" }
        @driver.click(locator)
    end
end