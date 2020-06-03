require "base64"

class Crypto
  def self.encode(data)
    Base64.encode64(data)
  end

  def self.decode(data)
    Base64.decode64(data)
  end
end
