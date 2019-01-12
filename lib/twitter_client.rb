class TwitterClient
  def self.build
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_001_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_001_CONSUMER_KEY_SECRET']
      config.access_token        = ENV['TWITTER_001_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_001_ACCESS_TOKEN_SECRET']
    end

    client
  end
end


