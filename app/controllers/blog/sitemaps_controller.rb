class Blog::SitemapsController < ApplicationController

  before_filter :set_cache_control

  def show
    @posts = Post.ordered
    headers["Content-Type"] = 'text/xml'
  end

  def set_cache_control
    if Rails.env.production?
      expires_in 24.hours, :public => true
    end
  end

end
