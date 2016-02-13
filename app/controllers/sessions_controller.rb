class SessionsController < Clearance::SessionsController

  protected
  def url_after_create
    user_path(current_user)
  end
end