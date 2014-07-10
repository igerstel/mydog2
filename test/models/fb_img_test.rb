require 'test_helper'

class FbImgTest do

  it "should get oAuth token" do
    token = FbImg.get_oauth_token
    token.class.should == String
  end

  it "should get album IDs"
    token = FbImg.get_oauth_token
    FbImg.get_album_ids(token)
    album_ids.count.should == 7
  end

  it "should get a photo URL for an album" do
    token = FbImg.get_oauth_token
    albums_ids = FbImg.get_album_ids(token)
    photos = graph.get_connections(album_ids.first, 'photos')
    photo_url = photos.first['images'].first['source']
    photo_url.include?('fbcdn.net').should == true
  end

  it "should get an array of photo URLs" do
    token = FbImg.get_oauth_token
    albums_ids = FbImg.get_album_ids(token)
    photos = graph.get_connections(album_ids.first, 'photos')
    photo_urls = FbImg.get_photo_urls(photos)
    photo_urls.class.should == Array && photo_urls.last.include?('fbcdn.net').should == true
  end

  it "should check a photo URL for http, fbcdn.net, and an extension" do
    good_url = "https://scontent-b.xx.fbcdn.net/hphotos-xpa1/t1.0-9/10540843_934068386608655_3563804495790302463_n.jpg"
    valid_url = FbImg.valid_fb_url(good_url)
    valid_url.should == true
  end

  it "should check photo URL for http/fbcdn.net/extension and discard bad url" do
    bad_url = "https://scontent-b.xx.fbcdn.net/"
    valid_url = FbImg.valid_fb_url(bad_url)
    valid_url.should == false
  end

  it "should discard images with bad extensions" do
    photo_url = 'www.fakeurl.com/not_image.mp3'
    valid_image = FbImg.valid_image(photo_url)
    valid_image.should == false
  end

  it "should allow images with proper extensions" do
    photo_url = 'www.fakeurl.com/image.jpg'
    valid_image = FbImg.valid_image(photo_url)
    valid_image.should == true
  end



end