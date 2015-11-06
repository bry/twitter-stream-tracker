## Twitter Stream Tracker

### Installation

    rvm install ruby 1.9.3 (or install Ruby 1.9.3)
    gem install tweetstream

### Run

    ruby main.rb

### Config

Stop words, program end time and TweetStream gem Twitter credentials are
configurable in the `config.rb` file

Create a [Twitter App](https://apps.twitter.com/), then use its credentials in
the `config.rb` file.

### Lib

The `tweet_processor.rb` file contains all tweet word tracking logic
