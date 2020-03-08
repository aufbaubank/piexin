from setuptools import setup

setup(
    name='piexin',
    version='0.2',
    description='phpipam export to ansible inventory ini file',
    url='http://github.com/aufbaubank/piexin',
    author='Daniel Henneberg',
    author_email='daniel.henneberg@aufbaubank.de',
    license='MIT',
    entry_points={
        'console_scripts': ['piexin=piexin.entrypoint:main'],
    },
    zip_safe=False
)
