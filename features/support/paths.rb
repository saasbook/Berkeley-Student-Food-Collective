# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^Maps$/
      map_my_vendors_path

    when /^the home\s?page$/
      '/'

    when /^ADMIN$/
      admin_path(1)

    when /^logout$/
      logout_path

    when /^the Product Tag Categories page$/
      product_tag_categories_path
      
    when /^Maps$/
      map_my_vendors_path
    
    when /^new product page$/
      new_my_product_path

    when /^the Admin Welcome page$/
      login_path
    
    when /^The Admins Control page$/
      index_path

    when /^new producer tag$/
      new_producer_tag_path

    when /^the edit producer tag page$/
      edit_producer_tag_path(1)

    when /^the producer tag page$/
     producer_tag_path(1)

    when /^the edit product tag page$/
      edit_product_tag_path(1)

    when /^the vendor page$/
     my_vendor_path(1)

    when /^the edit vendor page$/
      edit_my_vendor_path(1)

    when /^the edit product page$/
      edit_my_product_path(1)


    when /^new landing$/
      new_landing_path

    when /^the new product tag page$/
      new_product_tag_path



    when /^the new vendor page$/
      new_admin_vendor_path

    when /^the volunteer-facing vendors index page$/
      admin_vendors_path

    when /^New Admin Signup page$/
      signup_path
    
    when /^Admin Edit page$/
      admin_path(1)

    when /^the edit vendor page$/
      edit_admin_vendor_path(1)

    when /^the new product page$/
      new_admin_product_path

    when /^the volunteer-facing products index page$/
      admin_products_path
    when /^the volunteer-facing tags page$/
      admin_tags_path

    when /^the edit product page$/
      edit_admin_product_path(1)

    when /^the Discovery page$/
      discovery_path

    when /^the customer-facing products index page$/
      my_products_path

    when /^the customer-facing vendors index page$/
      my_vendors_path

    when /^the customer-facing product detail page$/
      my_product_path(1)

    when /^the customer-facing vendor detail page$/
      my_vendor_path(1)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
