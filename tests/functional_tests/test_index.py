from selenium import webdriver
import pytest
import os

from selenium.webdriver.common.by import By
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

# class TestBackend:
#     def setup_method(self):
#         # options = webdriver.FirefoxOptions()
#         # options.add_argument("--headless")  # Run in headless mode
#         # options.add_argument("--no-sandbox")

#         self.driver = webdriver.Remote(command_executor="http://selenium-chrome:4444/wd/hub",options=webdriver.ChromeOptions())

#     def test_add(self, url):
#         print(f"Url is {url}")
#         self.driver.get(f'{url}/add/1&2')
#         assert "Add 1 and 2. Got 3!" == self.driver.find_element(By.TAG_NAME, "body").text

#     def test_multiply(self, url):
#         self.driver.get(f'{url}/multiply/2&2')
#         assert "Multiply 2 and 2. Got 4!" == self.driver.find_element(By.TAG_NAME, "body").text

#     def test_divide(self, url):
#         self.driver.get(f'{url}/divide/10&2')
#         assert "Divide 10 and 2. Got 5.0!" == self.driver.find_element(By.TAG_NAME, "body").text

#     def test_subtract(self, url):
#         self.driver.get(f'{url}/subtract/9&2')
#         assert "Subtract 9 and 2. Got 7!" == self.driver.find_element(By.TAG_NAME, "body").text

#     def teardown_method(self, method):
#         self.driver.close()

class TestUntitled():
  def setup_method(self, method):
    self.driver = webdriver.Remote(command_executor="http://selenium-chrome:4444/wd/hub",options=webdriver.ChromeOptions())
    self.vars = {}
  
  def teardown_method(self, method):
    self.driver.quit()
  
  def test_untitled(self):
    self.driver.get("http://testapp:5000/")
    self.driver.set_window_size(1600, 876)
    self.driver.find_element(By.CSS_SELECTOR, "body").click()
  
