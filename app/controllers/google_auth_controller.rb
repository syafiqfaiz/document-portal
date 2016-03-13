class GoogleAuthController < ApplicationController

  def create

    auth = env["omniauth.auth"]

    user = User.find_or_create_by(uid_google: auth.slice(:uid).uid) do |u|
      u.uid_google = auth.uid
      u.email = auth.info.email
      u.password = auth.info.email
      u.name = auth.info.name
      u.oauth_token = auth.credentials.token
      u.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end

    sign_in(user)
    cookies['remember_token'] = user.remember_token
    redirect_to(root_path)
  end

end





