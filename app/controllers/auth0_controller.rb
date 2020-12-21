class Auth0Controller < ApplicationController
  include Auth0Helper

  def callback
    session[:user_id] = LocalUser.upsert_from_auth(
      request.env['omniauth.auth']['uid'],
      request.env['omniauth.auth']['info']['name'],
      request.env['omniauth.auth']['info']['email']
    ).id
    session[:user_gravatar] = request.env['omniauth.auth']['info']['image']
    redirect_to application_index_path
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to logout_url.to_s
  end

  def secured
    redirect_to application_index_path unless logged_in?
  end
end
