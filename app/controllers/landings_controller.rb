class LandingsController < ApplicationController

  def new
    @landing = Landing.last
  end

  def user_params
    params.require(:landing).permit(:allvendorspicture, :allvendorsdescription, :vendorsbycatpicture, :vendorsbycatdescription, :allprodcutspicture, :allproductsdescription, :productsbycatpicture, :productsbycatdescription)

  end

  def create
    @landing = Landing.create(user_params)
    if @landing.save
      redirect_to new_landing_path
    end
  end

  def update
    @landing = Landing.find(params[:id])

    if @landing.update(user_params)
      redirect_to @landing
    else
      render 'edit'
    end
  end

  def show
    @landing = Landing.find(params[:id])
    render 'edit'
  end
end
