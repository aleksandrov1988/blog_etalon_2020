class ApplicationController < ActionController::Base
  before_action :load_current_user

  private

  def load_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def check_authentication
    render_error unless @current_user
  end

  def render_error(error = t('helpers.forbidden'))
    @error = error
    render 'error', status: 403
  end
end
