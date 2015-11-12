module TwitterStream
  STOP_WORDS = %w(and the me a or but is to of this that from in for on at - la 
                y en de que I you my el your it with &amp &amp; e o te The be
               so los para like I'm do se)
  TERM_IN_SECONDS = 300

  TweetStream.configure do |config|
    config.consumer_key       = '[your twitter app consumer key]'
    config.consumer_secret    = '[your twitter app consumer secret]'
    config.oauth_token        = '[your oauth token]'
    config.oauth_token_secret = '[your oauth token secret]'
    config.auth_method        = :oauth
  end
end
