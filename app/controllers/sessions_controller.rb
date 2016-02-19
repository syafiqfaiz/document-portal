class SessionsController < Clearance::SessionsController

  protected
  def url_after_create
    if current_user.admin
      admin_users_path
    else
      root_path
    end

  end
end
