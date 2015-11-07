module BBC
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

  class TweetTracker
    attr_reader :total_word_count

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

    def list_top_words(number)
      top_words = word_count.sort do |a, b|
        b[1] <=> a[1]
      end.first(number)

      puts "Ten Most Frequent Words:"
      top_words.each do |key, value|
        puts "#{key}: #{value}"
      end
    end

    private

    def word_count
      @word_count
    end
  end
end
