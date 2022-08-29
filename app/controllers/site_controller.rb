class SiteController < ApplicationController
  def index
    @posts = Post.all
    render url: "site/index" 
  end
end
