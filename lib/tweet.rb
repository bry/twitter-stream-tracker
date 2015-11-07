module Tracker
  class Tweet
    attr_reader :word_count

    def initialize(tweet)
      @tweet = tweet.split(" ")
      @word_count = @tweet.length
    end

    def filter_stop_words
      @tweet.delete_if do |word|
        STOP_WORDS.include?(word)
      end
    end
  end
end
