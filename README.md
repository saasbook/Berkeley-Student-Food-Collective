[![Maintainability](https://api.codeclimate.com/v1/badges/237c342e4fc77c0c3689/maintainability)](https://codeclimate.com/github/asliakalin/Berkeley-Student-Food-Collective)
[![Test Coverage](https://api.codeclimate.com/v1/badges/237c342e4fc77c0c3689/test_coverage)](https://codeclimate.com/github/asliakalin/Berkeley-Student-Food-Collective/test_coverage)
[![Build Status](https://travis-ci.org/asliakalin/Berkeley-Student-Food-Collective.svg?branch=master)](https://travis-ci.com/asliakalin/Berkeley-Student-Food-Collective)

# README

## Overview

The Berkeley Student Food Collective (BSFC) needed a way to better express why they choose specific products and vendors to populate their store with. This app creates a website for the Berkeley Student Food Collective which allows their customers to explore their products and vendors and allows the volunteers to upload products and vendors for the customers to view. 
The features of the app includes 1) tagging, 2)mapping and 3)admin.
- <b> Tagging: </b> Viewing products and vendors and exploring the contents of the databases through an extensive tagging system is now possible by clicking on individual tags. 
- <b> Mapping: </b>: Mapping functionality allows users to find the exact location from where their food comes from by clicking on the address of the vendors. All vendor locations can also be viewed by using the "Map" options in the dropdown menu from the navigation bar under Vendors.
- <b> Admins: </b>: Admin access functionality prevents outside users to access anything related to BSFC database including adding, removing or updating products, vendors or tags.
More detailed explanations of the features are explained below. You can also look at the Workflow section below to see how to use individual features.


## Features

### Tagging Feature

### Admin Access

Admin access allow volunteers at BSFC to put specific products and vendors on their website. In order to access admin privileges the admin should use the login button on the upper right corner of the navigation bar and input their name & password on the login page. Once the admin is logged in, there will be 3 main changes in the navigation experience that allows admin privileges:
1. '+' button on the navigation bar: opens up a dropdown menu to add new products, vendors, tags and tag categories. Once the admin clicks on a dropdown option, they will be redirected to the related form to add new items to the BSFC database.
2. 'ADMIN' link on the navigation bar: shows the admin their information and allows them to edit their name or password.
3. 'Edit' buttons on each product, vendor or tag: opens up a form with the currently saved information of the product, vendor or tag to allow the admin to make any changes or delete the product, vendor or tag completely from the database.

### Mapping 





### Models

The main three models are MyVendor, MyProduct, ProducerTag, and ProductTag. The MyVendor and MyProduct have a “has_many” relationship with ProducerTag and ProductTag respectively. To identify a MyVendor or a MyProduct with a tag, type in the name of the tag into the “taglist” field on the new/edit page (requires admin privileges to access). The app figures out which product/vendor has what tag by searching the name of the tag in the textlist. Textlist is case-insensitive, but the name itself should be spelled correctly. For example, “flkjlhAlaLalkj” is a valid input for the “halal” (don’t actually do this, its messy to look at), but “WorkerOwned” is invalid for the “Worker Owned” tag.

## Miscellaneous

- How to update the banner image on the discovery page: Go into app/assets/images and add the image file. Rename it to discovery_image.jpeg





## Installation, Testing & Deployment

### Directory Structure

Set up as a standard rails app. Notable choices include:
- Partials shared among multiple views live in the "application" folder under views.

### Heroku

http://bsfc.herokuapp.com

Our practice is to deploy to Heroku using the release branch of the repository.
To deploy to Heroku, run `git push heroku release:master`. You may also need to run `heroku rake db:migrate` if you have added migrations since you last deployed to Heroku. Run `heroku rake db:seed` if you want to reseed the database.

### Pivotal Tracker

https://www.pivotaltracker.com/n/projects/2317544

### Installation

Must have Ruby 2.4.0 to run this project locally. Run `bundle install --without production` to import all gems and `rake db:setup` to initialize the database.

### How to Run Tests

Use `bundle exec cucumber` to run all cucumber tests.
