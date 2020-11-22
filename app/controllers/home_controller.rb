class HomeController < ApplicationController
  def top
    @latest_news = News.last
  end

  def about
    add_breadcrumb '概要', :about_path
  end

  def privacy_policy; end

  def terms; end
end
