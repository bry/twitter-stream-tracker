module Tracker
  class TweetTracker
    def initialize
      @total_word_count = 0
      @word_count = {}
    end

    def add_word_count(tweet)
      @total_word_count += tweet.word_count
    end

    def add_words_to_hash(tweet)
      tweet.filter_stop_words.each do |word|
        if word_count[word.to_sym].nil?
          word_count[word.to_sym] = 1
        else
          word_count[word.to_sym] += 1
        end
      end
    end

    def print_results
      puts
      puts "***********Results***********"
      puts "Total Word Count: #{@total_word_count}"
      puts
      puts "Ten Most Frequent Words:"
      top(10).each do |key, value|
        puts "#{key}: #{value}"
      end
    end

    private

    def top(number)
      top_words = word_count.sort do |a, b|
        b[1] <=> a[1]
      end.first(number)
    end

    def word_count
      @word_count
    end
  end
end
