import pytest


def pytest_addoption(parser):
    parser.addoption("--url", action="store", default='http://testapp:5000')


@pytest.fixture(scope='session')
def url(request):
    return request.config.option.url
