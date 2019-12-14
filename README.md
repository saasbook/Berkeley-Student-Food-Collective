[![Maintainability](https://api.codeclimate.com/v1/badges/237c342e4fc77c0c3689/maintainability)](https://codeclimate.com/github/asliakalin/Berkeley-Student-Food-Collective)
[![Test Coverage](https://api.codeclimate.com/v1/badges/237c342e4fc77c0c3689/test_coverage)](https://codeclimate.com/github/asliakalin/Berkeley-Student-Food-Collective/test_coverage)
[![Build Status](https://travis-ci.org/asliakalin/Berkeley-Student-Food-Collective.svg?branch=master)](https://travis-ci.com/asliakalin/Berkeley-Student-Food-Collective)

# README

## Heroku

http://bsfc.herokuapp.com

Our practice is to deploy to Heroku using the release branch of the repository.
To deploy to Heroku, run `git push heroku release:master`. You may also need to run `heroku rake db:migrate` if you have added migrations since you last deployed to Heroku. Run `heroku rake db:seed` if you want to reseed the database.

## Pivotal Tracker

https://www.pivotaltracker.com/n/projects/2317544

## Installation

Must have Ruby 2.4.0 to run this project locally. Run `bundle install --without production` to import all gems and `rake db:setup` to initialize the database.

## How to Run Tests

Use `bundle exec cucumber` to run all cucumber tests.

## Overview

This app creates a website for the Berkeley Student Food Collective which allows their customers to explore their products and vendors and allows the volunteers to upload products and vendors for the customers to view. The Berkeley Student Food Collective (BSFC) needed a way to better express why they choose specific products and vendors to populate their store with. This website was designed to create a way so they can better explain those choices to their customers and allow BSFC customers to view those products and vendors.

## Admin Access

Admin access allow volunteers at BSFC to put specific products and vendors on their website. In order to access admin privileges the admin

## Directory Structure

Set up as a standard rails app. Notable choices include:

- Partials shared among multiple views live in the "application" folder under views.

## Models

The main three models are Vendor, Product, and Tag. Certification, Nutrition, Ownership, and Packaging inherit from Tag and therefore all live in the Tag table in the database with different types. They each have a "belongs to" relationship with either a Vendor or Product model. Product_Certification, Product_Nutrition, Product_Packaging, and Vendor_Ownership are models linking the two tables they mention.

## Miscellaneous

- How to update the banner image on the discovery page: Go into app/assets/images and add the image file. Rename it to discovery_image.jpeg
