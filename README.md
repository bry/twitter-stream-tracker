## Twitter Stream Tracker
A Twitter Stream Tracker tracking total word count and top words used (stop 
words filtered) in Twitter tweet stream using the
[Twitter Stream API](https://dev.twitter.com/streaming/overview) via
the [tweetstream](https://github.com/tweetstream/tweetstream) gem.

### Installation

    rvm install ruby 1.9.3 (or install Ruby 1.9.3)
    gem install tweetstream


### Config

Stop words, program end time and
[tweetstream](https://github.com/tweetstream/tweetstream) gem Twitter
credentials are configurable in the 
[config.rb](https://github.com/bry/twitter_stream_tracker/blob/master/config.rb) 
file.

Create a [Twitter App](https://apps.twitter.com/), then use its credentials in
the `config.rb` file.

### Usage

    ruby main.rb


![Image demo](https://raw.github.com/bry/twitter_stream_tracker/master/results.png)

### Lib

The [tweet_processor.rb](https://github.com/bry/twitter_stream_tracker/blob/master/tweet_processor.rb)
file contains all tweet word tracking logic.
