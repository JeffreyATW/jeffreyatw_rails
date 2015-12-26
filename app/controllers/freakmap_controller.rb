require 'wombat'
require 'gon'

class FreakmapController < ApplicationController

  def show
    gon.push(crawl: crawl)
  end

  private
  def crawl
    Rails.cache.fetch 'freakmap_crawl', expires_in: 1.day do
      Wombat.crawl do
        base_url 'http://www.ddrfreak.com'
        path '/locations/locations.php'

        states 'css=table.standardtext li', :iterator do
          name 'css=a'
          cities 'css=a', :follow do
            cities 'css=table.standardtext tr', :iterator do
              name 'css=td:nth-child(1)'
              city 'css=td:nth-child(2)'
              version 'css=td:nth-child(3)'
            end
          end
        end
      end
    end
  end
end
