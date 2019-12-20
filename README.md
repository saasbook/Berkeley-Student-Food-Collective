[![Maintainability](https://api.codeclimate.com/v1/badges/237c342e4fc77c0c3689/maintainability)](https://codeclimate.com/github/asliakalin/Berkeley-Student-Food-Collective)
[![Test Coverage](https://api.codeclimate.com/v1/badges/237c342e4fc77c0c3689/test_coverage)](https://codeclimate.com/github/asliakalin/Berkeley-Student-Food-Collective/test_coverage)
[![Build Status](https://travis-ci.org/asliakalin/Berkeley-Student-Food-Collective.svg?branch=master)](https://travis-ci.com/asliakalin/Berkeley-Student-Food-Collective)


# Overview
The app is accessible through http://bsfc-v2.herokuapp.com. Please see the Installation, Testing & Deployment section below for more related information.

The Berkeley Student Food Collective (BSFC) needed a way to better express why they choose specific products and vendors to populate their store with. This app creates a website for the Berkeley Student Food Collective which allows their customers to explore their products and vendors and allows the volunteers to upload products and vendors for the customers to view. The core relationship of a vendor and its products is central in the app. From a vendor page the user can see all their products and click on them to access that product's page. Similarly, from a product, the user can see the vendor that produced the product and click on the producer link to access that vendor's page. But there is so much more!

The main features of the app are 1) tagging, 2) mapping and 3) admin access.
- <b> Tagging: </b> Viewing products and vendors and exploring the database with an extensive tagging system is now possible by clicking on individual tags. Each vendor can have zero or more producer tags that give information about the people in the vendor-side (women owned, lgbtq+, worker owned etc). And similarly each product can have zero or more product tags that give information about a variety of things about the product from its nutrition value (high sodium, good protein source etc) to its packaging (plastic container, paper bag or no packaging etc) and food certifications (vegan, non-dairy or gluten-free etc). Each individual tag is associated with a larger tag category (packaging, nutrition or certifications etc). The user can explore all the product tags or view the product tag categories and explore the tags from the same group by clicking on a category and viewing all the tags under that category instead.
- <b> Mapping: </b>: Mapping functionality allows users to find the exact location from where their food comes from by clicking on the address of the vendors. All vendor locations can also be viewed by using the "Map" options in the dropdown menu from the navigation bar under Vendors.
- <b> Admins: </b>: Admin access functionality prevents outside users to access secret options, buttons and forms that can manupulate the BSFC database. The admins can login using their password and unique name. Once logged in, admins can add new products, vendors, tags or new categories; edit the existing things on the database; update the landing page to display new pictures and messages for vendor and product pages. Moreover the admins can view their information and update their name or password easily. The admin passwords are first encrypted and then saved in the database to prevent any security breaches. The urls leading to pages to edit, add or delete items from the databases are also protected with the admin sessions, so even if a user guesses the url correctly to be able to edit a product, they will be redirected to the main page unless they are logged in as an admin. 

More detailed explanations of each feature are below. You can also look at the Workflow section below to see how to use individual features.

<br/>

# Features

### Tagging Feature

The tagging system allows a product and a vendor to be associated with a tag. For instance, a vendor can have tags such as "Women Owned" and "LGBTQ+" while a product can have tags such as "Vegan" and "Halal. In order to make such associations, we built a backend tagging system that allows an admin to add and remove tags from a vendor or product. 

As an admin, click on the '+' sign at the top right corenr of the navigation bar to access all the forms. Create a new Tag Category, Product Tag, and Producer Tag. Once created, a new vendor can be created and associated with an existing producer tag. Similarly, a new product can be created and assodicated with a product tag. In addition, an admin also has the ability to edit or delete an existing vendor, product, product tag, and producer tag.

1. Each vendor and product has clickable tags that are associated with it
2. Clicking on a tag redirects the user to that tag's page where the user can see all the products or vendors associated with that tag. 
3. Product tags also have a larger category that they belong to, as seen from the tag's page. Once clicked on the category, the user can explore related tags under the same category. For example "Plastic Bag" tag belongs to the "Packaging" category. Once the user clicks on the "Packaging" group from the "Plastic Bag" tag's page, they can see other tags under the "Packaging" category such as "Recyclable", "Plastic Container" or "No Packaging."
4. Each vendor has also a list of products they produced with a link to access that product's page
5. Each product has a link to its producer to access its producer's page.


### Admin Access

Admin access allow volunteers at BSFC to put specific products and vendors on their website. In order to access admin privileges the admin should use the login button on the upper right corner of the navigation bar and input their name & password on the login page. Once the admin is logged in, there will be 3 main changes in the navigation experience that allows admin privileges:
1. '+' button on the navigation bar: opens up a dropdown menu to add new products, vendors, tags and tag categories. Once the admin clicks on a dropdown option, they will be redirected to the related form to add new items to the BSFC database.
2. 'ADMIN' link on the navigation bar: shows the admin their information and allows them to edit their name or password.
3. 'Edit' buttons on each product, vendor or tag: opens up a form with the currently saved information of the product, vendor or tag to allow the admin to make any changes or delete the product, vendor or tag completely from the database.

### Mapping 

The mapping feature of the website allows customers to view the locations of all the vendors that stock the BSFC store. In order for the map to be populated correctly, addresses provided during vendor creation must be formatted properly. The address can be a street address or just a city location. Poorly formatted addresses will still show up on the vendor's page details, however pins will not be placed on the Google Map.There are two main ways to view the vendor locations on the map:
1. Directly click on the address of a vendor from the vendor's page to see the vendor's location with a pin on google maps
2. Click on the "Map" option in the dropdown menu on the navigation bar. Once the map is viewed with all the vendors, the user can click on a pin to see what the vendor is and get redirected to that vendor's page in the app to view details.



<br/>

# Workflow
### For first time setup locally, you *must* use the Landing form to update the images and descripitions on the pages nested in each drop down in the navigation bar. If you're looking to update the existing images/descriptions on Heroku, you would also follow the steps below
1.	Login as an admin
2.	Click on the green plus sign
3.	Click on “Update Landing Pages”
4.	New vs. Edit:
  a. If you would like to update all of them and not reuse any of the current descriptions/pictures, then start filling out the form and click “Create Landing” once you are done
  b.If you would like to have all the fields populate with what you inputted last, then don’t fill out the form and click on “Edit Previous”. This will show you all the details you add last. We advise you use this if you are updating only some of the pages not all of them. This way you won’t have to rewrite everything
  
### First time setup tagging system workflow 
1. Login as admin
2.	Use the New Tag Category form to create any new tag categories you need (must have at least one in the system in order to create a new product tag)
3.	Use the New Producer Tag form to create all the new producer tags you need (i.e Women Owned, LGBTQ+)
4.	Use the New Product Tag form to create all the new product tags you need (i.e Vegan, Halal)
5.	Use the New Vendor form to create all the new vendors (see steps below to associate tags)
6.	Use the New Product form to create all the new vendors (see steps below to associate tags)
 
 ### Adding a New Vendor with Tags 
1. Complete the name field 
2. Complete the link to picture field (must start with https://)
  a.The link should look something like this => https://cdn1-www.dogtime.com/assets/uploads/2011/03/puppy-development.jpg 
3. Complete the Address and Story fields
4. Links to social media are optional (must start with https://)
5. For tags:
  a.Use the drop down as reference for which tags you have already added
    i. If you don’t see the tag you want in the drop down, then you must use the “New Producer Tag” form to add a new tag before completing the New Vendor form 
  b. Once you see the tags you need, type them in the Tagslist field exactly how you see them in the drop down 
6. Click submit

### Adding a New Product with Tags 
1. Select the vendor name associated with this product
2. Complete the name field
3. Complete the link to picture field (must start with https://)
a. The link should look something like this => https://cdn1-www.dogtime.com/assets/uploads/2011/03/puppy-development.jpg 
4. Complete the Description fields
5. For tags:
a.	Use the drop down as reference for which tags you have already added
i.	If you don’t see the tag you want in the drop down, then you must use the “New Product Tag” form to add a new tag before completing the New Product form 
b.	Once you see the tags you need, type them in the Tagslist field exactly how you see them in the drop down 
6. Click submit

- When adding a new vendor/new product without tags, follow the same steps but ignore the tag steps
- To update a previously added product/vendor/or tag go to that page (when logged in as admin) and click on the edit button 

<br/>

# Installation, Testing & Deployment

### Directory Structure

Set up as a standard rails app. Notable choices include:
- Partials shared among multiple views live in the "application" folder under views.

### Heroku

http://bsfc-v2.herokuapp.com

Our practice is to deploy to Heroku. You may also need to run `heroku rake db:reset` and `heroku rake db:migrate` if you have added migrations since you last deployed to Heroku. Run `heroku rake db:seed` if you want to reseed the database. You may also need to go to heroku.com, find the relevant application, click settings, and then click on "reveal config vars". You will then need to fill in the API key. 

### Pivotal Tracker

https://www.pivotaltracker.com/n/projects/2317544

### Installation

Must have Ruby 2.4.0 to run this project locally. Run `bundle install --without production` to import all gems and `rake db:setup` to initialize the database.

### How to Run Tests

Use `bundle exec cucumber` to run all cucumber tests.

Before testing, you have to ensure that the Google Maps API key has been decrypted. To do so, follow these steps:
1) Have GnuPG downloaded. 
2) Navigate over to the root directory of the project. 
3) Copy paste the following command line text: gpg --output  config/application.yml --decrypt config/application.yml.asc
4) Fill in the password that was provided to you by the CS169 team.

## Miscellaneous

- How to update the banner image on the discovery page: Go into app/assets/images and add the image file. Rename it to discovery_image.jpeg
- If you need to create an admin account or access to decrypting the API key, please message cs169@berkeley.edu
- The initial app will have no images except for the discovery page banner even thought the image frames are visible, this is not a bug, the frames will render the pictures once landing page selections are made.
