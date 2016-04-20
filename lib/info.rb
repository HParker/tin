class Info
  def initialize(text, req)
    @text = text
    @req = req
  end

  def keyword
    tokens.first.downcase
  end

  def contents
    tokens.drop(1).join(' ')
  end

  def ip
    @req.ip
  end

  def city_name
    db.city.name
  end

  def country_name
    db.country.name
  end

  private

  def tokens
    @text.split(' ')
  end

  def db
    MaxMindDB.new(File.join(ROOT, 'db/GeoLite2-City.mmdb')).lookup(ip)
  end
end
