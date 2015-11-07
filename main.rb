require 'tweetstream'
require_relative 'config'
require_relative 'tracker'

# Use Event Machine for timer program reporting and exit
EM.run do
  client = TweetStream::Client.new
  tracker = BBC::TweetTracker.new

  # Set Periodic Timer to exit program and report results after 5 minutes
  EM::PeriodicTimer.new(time_in_seconds = 60 * TERM_IN_MINS) do
    client.stop
    puts
    puts "***********Results***********"
    puts "Total Word Count: #{tracker.total_word_count}"
    puts
    tracker.list_top_words(10)
    exit
  end

  # Receive sample stream from Twitter and use BBC::TweetTracker to parse
  client.sample do |status|
    tweet = BBC::Tweet.new(status.text)
    tracker.add_word_count(tweet)
    tracker.add_words_to_hash(tweet)
    puts "#{status.text}"
  end
end
