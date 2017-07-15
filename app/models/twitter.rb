require 'uri'
require 'net/http'
require 'twitter'

module TwitterAdapter
  def self.post(string)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_OAUTH_TOKEN"]
      config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
    end

    client.update(string)
  end

# def post
#   url = URI("https://api.twitter.com/1.1/statuses/update.json?oauth_consumer_key=wU6eJiE9IsVsr2TFfIaEDM4G7&oauth_token=885644590165901312-d43ztttU6Ugu6uaSEdbJh4fTYvvqeQA&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1500064484&oauth_nonce=abcdefghijklmnopqrstuvwxyz123456&oauth_version=1.0&oauth_signature=cbCVm0NyVWcCN5V%206AsS98dt%20iA%3D&status=oh_boy")
#
#   timestamp = Time.now.to_i
#
#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#
#   request = Net::HTTP::Post.new(url)
#   request["authorization"] = "OAuth oauth_consumer_key=\'#{CONSUMER_KEY}\',oauth_token=\'#{TWITTER_TOKEN}\',oauth_signature_method=\'HMAC-SHA1\',oauth_timestamp=\'#{timestamp}\',oauth_nonce=\'e8ZGpk8vUd3\',oauth_version=\'1.0\',oauth_signature=\'dpZiNCOXoud5CdMZq1qXs2vbXsU%3D\'"
#   request["cache-control"] = 'no-cache'
#   request["postman-token"] = '8ea6cf28-3590-7d50-78dd-59ad06cc6d51'
#
#   response = http.request(request)
#   puts response.read_body
# end
#
# private 
#
# def self.generate_bearer_token
#
#   url = URI("https://api.twitter.com/oauth2/token")
#
#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#
#   consumer_key    = ENV['TWITTER_CONSUMER_KEY']
#   consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
#   bearer_token_credentials = Base64.strict_encode64("#{consumer_key}:#{consumer_secret}")
#
#   request = Net::HTTP::Post.new(url)
#   request["authorization"] = "Basic #{bearer_token_credentials}"
#   request["content-type"] = 'application/x-www-form-urlencoded;charset=UTF-8'
#   request.body = "grant_type=client_credentials"
#
#   response = JSON.parse http.request(request).read_body
#   response["access_token"]
#
# end
end
