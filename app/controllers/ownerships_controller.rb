class OwnershipsController < ApplicationController
  def ownership_params
    params.require(:ownership).permit(:name)
  end

  def create
    ownership = Ownership.create!(ownership_params)
    # render json: {id: ownership.id, name: ownership.name}
  end
end