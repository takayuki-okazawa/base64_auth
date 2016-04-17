require 'openssl'
require 'base64'

def decrypt(data, key, iv)
  cipher = OpenSSL::Cipher.new('aes-128-cbc')
  cipher.decrypt
  cipher.key = key
  cipher.iv = iv
  cipher.update(data) + cipher.final
end

def login(u,p)
  key = "1234567890123456"
  iv = "abcdef1234567890"
  url = "/home/vagrant/shearfarm/server/tmt/app/controllers/password.txt"
  userid = "userid"

  base64text = ""

  File.open(url) {|f| base64text = f.gets.chomp }
  text = Base64::strict_decode64(base64text)
  dec_data = decrypt(text, key, iv)

  if u == userid && dec_data == p
    return true;
  else
    return false;
  end

end
