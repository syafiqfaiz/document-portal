class GoogleAuthController < ApplicationController

  def create

    auth = env["omniauth.auth"]
    user = User.find_by(uid_google: auth.slice(:uid).uid)

    if user.nil?
      user = User.new do |u|
        u.uid_google = auth.uid
        u.email = auth.info.email
        u.password = auth.info.email
        u.name = auth.info.name
        u.oauth_token = auth.credentials.token
        u.oauth_expires_at = Time.at(auth.credentials.expires_at)
        u.save!
      end
    else
      user.tap do |u|
        u.uid_google = auth.uid
        u.name = auth.info.name
        u.oauth_token = auth.credentials.token
        u.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
    end

    # move to model method in future
    sign_in(user)
    cookies['remember_token'] = user.remember_token
    redirect_to(root_path)
  end
end





