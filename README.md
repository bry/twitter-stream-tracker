## Twitter Stream Tracker
A Twitter Stream Tracker tracking total word count and top words used (stop 
    words filtered) in Twitter tweet stream using the
[Twitter Stream API](https://dev.twitter.com/streaming/overview) via
the [tweetstream](https://github.com/tweetstream/tweetstream) gem.

### Installation

Must use Ruby v1.9.3, a [tweetstream](https://github.com/tweetstream/tweetstream) gemspec dependency.

    rvm install ruby 1.9.3 (or install Ruby 1.9.3)
    gem install tweetstream

### Configuration
Stop words, execution time limit and [tweetstream](https://github.com/tweetstream/tweetstream) gem Twitter
credentials are configurable in the 
[config.rb](https://github.com/bry/twitter_stream_tracker/blob/master/config.rb) 
file.

##### Stop words

Append stop words to filter words from tweet, removing them from top words counting.

```ruby
STOP_WORDS = %w(and the me a or but is to of this that from in for on at - la y en de que I you my el your it with &amp &amp; e o te The be so los para like I'm do se)
```

##### Execution Time Limit

Set program to terminate in X number of seconds.

```ruby
TERM_IN_SECONDS = 300
```

##### Twitter App Credentials

Create a [Twitter App](https://apps.twitter.com/), then use the given app credentials in the `config.rb` file.

```ruby
TweetStream.configure do |config|
  config.consumer_key       = '[your twitter app consumer key]'
  config.consumer_secret    = '[your twitter app consumer secret]'
  config.oauth_token        = '[your oauth token]'
  config.oauth_token_secret = '[your oauth token secret]'
  config.auth_method        = :oauth
end
```

### Usage

    ruby tracker.rb


![Image demo](https://raw.github.com/bry/twitter_stream_tracker/master/results.png)

