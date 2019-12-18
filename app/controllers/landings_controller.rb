class LandingsController < ApplicationController

  def new
    if current_admin
      @landing = Landing.last
    else
      redirect_to discovery_path
    end
  end

  def user_params
    params.require(:landing).permit(:allvendorspicture, :allvendorsdescription, :vendorsbycatpicture, :vendorsbycatdescription, :allprodcutspicture, :allproductsdescription, :productsbycatpicture, :productsbycatdescription)

  end

  def create
    if current_admin
      @landing = Landing.create(user_params)
      if @landing.save
        redirect_to discovery_path
      end
    end
  end

  def update
    @landing = Landing.find(params[:id])

    if @landing.update(user_params)
      redirect_to discovery_path
    end
  end

end
