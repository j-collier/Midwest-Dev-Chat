module CareerHelper
  def self.get_url object
    route = object.class.to_s == 'Job' ? 'jobs' : 'devs'
    "https://#{ActionMailer::Base.smtp_settings[:domain]}/#{route}/#{object.slug}"
  end

  def self.get_encoded_url object
    CGI.escape(get_url(object))
  end

  def self.get_facebook_url object
    "https://www.facebook.com/sharer/sharer.php?u=#{get_encoded_url(object)}"
  end

  def self.get_twitter_url object
    "https://twitter.com/home?status=#{get_encoded_url(object)}"
  end
end