class SessionsController < Clearance::SessionsController

  protected
  def url_after_create
    return admin_users_path if current_user.admin
    root_path
  end
end
