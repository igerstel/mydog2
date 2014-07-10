class FbImg < ActiveRecord::Base

  def self.get_oauth_token
    oauth = Koala::Facebook::OAuth.new(ENV['MYDOG_ID'], ENV['MYDOG_SECRET'], nil)
    return oauth.get_app_access_token
  end

  def self.get_album_ids(token)
    graph = Koala::Facebook::API.new(token)
    dog_albums = graph.get_connections(ENV['BARKLEY_ID'],'albums')
    album_ids = []
    dog_albums.each {|d| album_ids << d['id'] unless d['name'] == 'Untitled Album'}
    return album_ids
  end

  def self.get_photo_urls(photos)
    photo_urls = []
    photos.each {|photo| photo_urls << photo['images'].first['source'] }
    return photo_urls
  end

  def self.valid_fb_url(photo_url)
    http = photo_url.include?('http')
    fbcdn = photo_url.include?('fbcdn')
    last_three = /([a-zA-Z]{3})/.match(photo_url[-3..-1])
    ext = (last_three.length == 3)
    return (http && fbcdn && ext)
  end

  def self.valid_image(photo_url)
    ext = photo_url.split('.').last
    return ['bmp', 'gif', 'jpg', 'jpeg', 'png', 'tif', 'tiff'].include?(ext)
  end

end
