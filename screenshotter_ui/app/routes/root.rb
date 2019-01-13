require 'uri'
HOST_WHITELIST = %w[en.wikipedia.org www.instagram.com]

get '/' do
  conn = Screenshot::Connector.new
  haml :index, locals: { screenshots: conn.screenshots }
end

post '/' do
  conn = Screenshot::Connector.new

	begin
		uri = URI.parse(params[:url])
    puts("uri.host=#{uri.host}")
		if HOST_WHITELIST.include?(uri.host)
      conn = Screenshot::Connector.new
      warn("Status: #{conn.send_url(params[:url])}")
    else
      @error = "Invalid domain"
    end
	rescue StandardError => e
    warn("Failed to post /: #{e}")
		@error = "Invalid URI"
	end

	haml :index, locals: { screenshots: conn.screenshots }
end