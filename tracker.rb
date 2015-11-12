require 'tweetstream'
require_relative 'config'
require_relative 'lib/tweet'
require_relative 'lib/tracker'

# Use Event Machine for timer program reporting and exit
EM.run do
  client = TweetStream::Client.new

  # Set Periodic Timer to exit program and report results after 5 minutes
  EM::PeriodicTimer.new(TwitterStream::TERM_IN_SECONDS) do
    client.stop
    TwitterStream::Tracker.print_results
    exit
  end

  # Receive sample stream from Twitter and use Tracker::TweetTracker to parse
  client.sample do |status|
    tweet = TwitterStream::Tweet.new(status.text)
    TwitterStream::Tracker.process(tweet)
    puts tweet
  end
end
