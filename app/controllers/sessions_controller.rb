class SessionsController < Clearance::SessionsController

  protected
  def url_after_create
    root_path
  end
end
