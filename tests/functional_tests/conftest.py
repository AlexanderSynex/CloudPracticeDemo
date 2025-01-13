import pytest

def pytest_addoption(parser):
    parser.addoption("--url", action="store", default='http://172.17.0.3:5000')


@pytest.fixture(scope='session')
def url(request):
    return request.config.option.url
