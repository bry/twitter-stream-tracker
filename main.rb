# To run the program
#   1. Install Ruby 1.9.3,
#   2. gem install tweetstream
#      (https://github.com/tweetstream/tweetstream)
#   3. ruby main.rb
#
# Configuration parameters are in the 'config.rb' file
#

require 'tweetstream'
require_relative 'config'
require_relative 'tweet_processor'

# Use Event Machine for timer program reporting and exit
EM.run do
  client = TweetStream::Client.new
  processor = BBC::TweetProcessor.new

  # Set Periodic Timer to exit program and report results after 5 minutes
  EM::PeriodicTimer.new(time_in_seconds = 60 * TERM_IN_MINS) do
    client.stop
    puts
    puts "***********Results***********"
    puts "Total Word Count: #{processor.total_word_count}"
    puts
    processor.list_top_words(10)
    exit
  end

  # Receive sample stream from Twitter and use BBC::TweetProcessor to parse
  client.sample do |status|
    tweet = status.text
    processor.add_word_count(tweet)
    processor.add_words_to_hash(tweet)
    puts "#{tweet}"
  end
end
