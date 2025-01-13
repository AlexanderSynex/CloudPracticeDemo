from selenium import webdriver
import pytest
import os

from selenium.webdriver.common.by import By
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

url = "http://localhost:4444" if "SELENIUM_REMOTE_URL" not in os.environ.keys() else os.environ["SELENIUM_REMOTE_URL"]


class TestBackend:
    def setup_method(self):
        print(url)
        options = webdriver.ChromeOptions()
        options.add_argument('--disable-blink-features=AutomationControlled')
        options.add_argument('--headless')
        self.driver = webdriver.Remote(command_executor=url,options=options)

    def test_add(self, url):
        self.driver.get(f'{url}/add/1&2')
        assert "Add 1 and 2. Got 3!" == self.driver.find_element(By.TAG_NAME, "body").text

    def test_multiply(self, url):
        self.driver.get(f'{url}/multiply/2&2')
        assert "Multiply 2 and 2. Got 4!" == self.driver.find_element(By.TAG_NAME, "body").text

    def test_divide(self, url):
        self.driver.get(f'{url}/divide/10&2')
        assert "Divide 10 and 2. Got 5.0!" == self.driver.find_element(By.TAG_NAME, "body").text

    def test_subtract(self, url):
        self.driver.get(f'{url}/subtract/9&2')
        assert "Subtract 9 and 2. Got 7!" == self.driver.find_element(By.TAG_NAME, "body").text

    def teardown_method(self):
        self.driver.close()
        self.driver.quit()
