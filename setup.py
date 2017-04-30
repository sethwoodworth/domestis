# -*- coding: utf-8 -*-

from setuptools import setup, find_packages


with open('README.rst') as f:
    readme = f.read()

with open('LICENSE') as f:
    license = f.read()

setup(
    name='domestis',
    version='0.0.1',
    description='Exploring python3 as a game engine',
    long_description=readme,
    author='Seth Wolfwood',
    author_email='seth@sethish.com',
    url='https://github.com/sethwoodworth/domestis',
    license=license,
    packages=find_packages(exclude=('tests', 'docs'))
)
