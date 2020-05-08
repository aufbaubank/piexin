import piexin
from setuptools import setup
import setuptools

# read the contents of your README file
from os import path
this_directory = path.abspath(path.dirname(__file__))
with open(path.join(this_directory, 'Readme.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='piexin',
    version=piexin.__version__,
    description='phpipam export to ansible inventory ini file',
    long_description=long_description,
    long_description_content_type='text/markdown',
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
