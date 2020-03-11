import piexin
from setuptools import setup
import setuptools

setup(
    name='piexin',
    version=piexin.__version__,
    description='phpipam export to ansible inventory ini file',
    url='http://github.com/aufbaubank/piexin',
    author='Daniel Henneberg',
    author_email='daniel.henneberg@aufbaubank.de',
    license='MIT',
    entry_points={
        'console_scripts': ['piexin=piexin.entrypoint:main'],
    },
    zip_safe=False,
    packages=setuptools.find_packages(),
    python_requires='>=3.6',
    install_requires=['requests']
)
