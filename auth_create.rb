# -*- coding: utf-8 -*-
require 'openssl'
require 'base64'

def encrypt(data, key, iv)
  cipher = OpenSSL::Cipher.new('aes-128-cbc')
  cipher.encrypt
  cipher.key = key
  cipher.iv = iv
  cipher.update(data) + cipher.final
end

def main(data)
  key = "1234567890123456"
  iv = "abcdef1234567890"
  url = "/home/vagrant/shearfarm/server/tmt/app/controllers/password.txt"

  result = encrypt(data, key, iv)
  base64text = Base64::strict_encode64(result)
  File.open(url, "w") {|f| f.puts base64text}

end

if ARGV.length != 1
  puts "usage: ruby #{__FILE__} data"
  exit 0
end

main(ARGV[0])
