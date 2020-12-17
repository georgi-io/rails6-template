module Auth0Helper
  def logout_url
    domain = Rails.application.credentials.auth0[:domain]
    client_id = Rails.application.credentials.auth0[:client_id]
    request_params = {
      client_id: client_id,
      returnTo: application_index_url
    }

    URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
  end

  def logged_in?
    session[:userinfo].present?
  end

  def username
    session[:userinfo]['info']['name']
  end

  private

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&').to_s
  end
end
