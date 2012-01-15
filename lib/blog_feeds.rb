module BlogFeeds
  require 'feedzirra'
  
  def load_feeds
    feeds = Feedzirra::Feed.fetch_and_parse('http://blog.shigotodoko.com/feed')
  end
end