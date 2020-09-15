
from setuptools import setup, find_packages

setup(
    name='Image-Copyright-Writer',
    version='0.0.1',
    author_email='wabrborich@hotami.com',
    author='Wladymir Brborich',
    packages=find_packages(),
    description='Tool to write copyright as exif metadata on images',
    install_requires=['py3exiv2', ],
    python_requires='>=3.6',
    entry_points={'console_scripts': [
        'license-image = main.license_writer:main',
    ]},
)
