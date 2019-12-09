class LandingsController < ApplicationController

  def new
    @landing = Landing.new
  end

  def user_params
    params.require(:landing).permit(:allvendorspicture, :allvendorsdescription, :vendorsbycatpicture, :vendorsbycatdescription, :allprodcutspicture, :allproductsdescription, :productsbycatpicture, :productsbycatdescription)

  end

  def create
    @landing = Landing.new(user_params)
    if @landing.save
      redirect_to new_landing_path
    end
  end
end
