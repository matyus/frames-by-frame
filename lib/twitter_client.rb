class TwitterClient
  def self.build
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials[:twitter_001_consumer_key]
      config.consumer_secret     = Rails.application.credentials[:twitter_001_consumer_key_secret]
      config.access_token        = Rails.application.credentials[:twitter_001_access_token]
      config.access_token_secret = Rails.application.credentials[:twitter_001_access_token_secret]
    end

    client
  end
end


