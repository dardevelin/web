class ApplicationController < ActionController::Base
  protect_from_forgery

  unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :not_found
  end

private

  def not_found(error)
    @error = get_data_for_error
    render :template => 'errors/not_found',
      :layout => 'error',
      :status => 404
  end

  def get_data_for_error
    {:url => request.url}
  end

end
