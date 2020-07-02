class PropublicaService
  def members_of_the_house(state)
    conn = Faraday.new("https://api.propublica.org") do |req|
      req.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.propublica.org') do |req|
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
      req.adapter Faraday.default_adapter
    end
  end
end
