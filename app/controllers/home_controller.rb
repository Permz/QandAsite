class HomeController < ApplicationController
  def top
    @latest_news = News.last
  end
end
