class PortfolioController < ApplicationController
  layout false

  def index
    @sections = Section.visible
  end

  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = "Jeffrey Carl Faden's Portfolio"

    # the news items
    @entries = Entry.visible

    # this will be our Feed's update timestamp
    @updated = Entry.first.pub_date unless @entries.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to portfolio_feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
