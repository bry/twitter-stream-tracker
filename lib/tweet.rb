module Tracker
  class Tweet
    attr_reader :word_count

    def initialize(tweet)
      @tweet = tweet
      @words = @tweet.split(" ")
      @word_count = @words.length
    end

    def filter_stop_words
      @words.delete_if do |word|
        STOP_WORDS.include?(word)
      end
    end

    def to_s
      @tweet
    end
  end
end
