class HomeController < ApplicationController
  def top
    @latest_news = News.last
  end
  def about
  end
end
