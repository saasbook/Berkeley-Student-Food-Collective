module ControllerVerification extend ActiveSupport::Concern
  def verify_and_redirect(success, item, index_page, params)
    if success
      flash[:message] = 'Success!'
      flash[:type] = 'alert alert-success'
      redirect_to index_page
    else
      flash[:message] = item.errors.full_messages
      flash[:type] = 'alert alert-danger'
      flash[:prev_params] = params
      redirect_back(fallback_location: index_page)
    end
  end
end