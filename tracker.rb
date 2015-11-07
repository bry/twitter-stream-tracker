require 'tweetstream'
require_relative 'config'
require_relative 'lib/tweet'
require_relative 'lib/tweet_tracker'

# Use Event Machine for timer program reporting and exit
EM.run do
  client = TweetStream::Client.new
  tracker = Tracker::TweetTracker.new

  # Set Periodic Timer to exit program and report results after 5 minutes
  EM::PeriodicTimer.new(TERM_IN_SECONDS) do
    client.stop
    tracker.print_results
    exit
  end

  # Receive sample stream from Twitter and use Tracker::TweetTracker to parse
  client.sample do |status|
    tweet = Tracker::Tweet.new(status.text)
    tracker.add_word_count(tweet)
    tracker.add_words_to_hash(tweet)
    puts tweet
  end
end
