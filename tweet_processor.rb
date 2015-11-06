module BBC
  # TweetProcessor contains all twitter text filtering and word tracking
  class TweetProcessor

    attr_accessor :total_word_count
    attr_accessor :word_cont_hash

    def initialize
      @total_word_count = 0
      @word_count_hash = {}
    end

    def add_word_count(tweet)
      word_ar = tweet.split(" ")
      @total_word_count += word_ar.length
    end

    def add_words_to_hash(tweet)
      filtered_tweet_ar = filter_stop_words(tweet)

      filtered_tweet_ar.each do |word|
        if word_count_hash[:"#{word}"].nil?
          word_count_hash[:"#{word}"] = 1
        else
          word_count_hash[:"#{word}"] += 1
        end
      end
    end

    def list_top_words(number)
      # Ruby 2.2.2 Enumerable .max(10) available
      # @word_count_hash.max(10) { |a,b| a[1] <=> b[1] }
      puts "Ten Most Frequent Words:"
      number.times do
        max = word_count_hash.max { |a,b| a[1] <=> b[1] }
        puts "#{max[0]}: #{max[1]}"
        word_count_hash.delete(max[0])
      end
    end

    private

    def filter_stop_words(tweet)
      word_ar = tweet.split(" ")
      word_ar.delete_if do |word|
        STOP_WORDS.include?(word)
      end
    end

    def word_count_hash
      @word_count_hash
    end
  end
end
