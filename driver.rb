require "selenium-webdriver"
require "webdrivers"
require 'dotenv/load'

class Driver
    attr_reader :driver

    def initialize(browser)
        options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized'])
        @driver = Selenium::WebDriver.for(:chrome, capabilities: options)
        @driver.manage.timeouts.implicit_wait = 2
        @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

    def quit
        @driver.quit
    end

    def element_present?(locator, attempts: 10)
        @driver.find_element(locator)
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end

    def navigate_to(url)
        @driver.navigate.to(url)
    end

    def click(locator)
        @driver.find_element(locator).click
    end

    def set_text(locator, value)
        begin
            @driver.find_element(locator).send_keys(value)
        rescue Selenium::WebDriver::Error::ElementNotInteractableError
            raise StandardError, "Could not set text to element #{locator}.  Is it able to receive text?"
        end
    end

    def select_from_dropdown(dropdown_locator, select_by, select_by_value)
        dropDownMenu = @driver.find_element(dropdown_locator)
        option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
        option.select_by(select_by, select_by_value)
    end

    def locator_text(locator)
        text = @driver.find_element(locator).text
        if text.nil? || text.empty?
            return @driver.find_element(locator).attribute("value")
        end

        text
    end

    def element_text(element)
        text = element.text
        if text.nil? || text.empty?
            return @driver.find_element(locator).attribute("value")
        end

        text
    end

    def elements(locator)
       @driver.find_elements(locator)
    rescue Selenium::WebDriver::Error::NoSuchElementError
        raise StandardError, "Element with locator #{locator} could not be found!"
    end
end