require 'wombat'
require 'gon'

class FreakmapController < ApplicationController

  def show
    db_locations = []
    db_locations_by_state = {}
    FreakmapLocation.all.each do |fl|
      if db_locations_by_state[fl.state].nil?
        db_locations_by_state[fl.state] = []
      end
      db_locations_by_state[fl.state].push(fl)
      db_locations.push(fl)
    end
    all_locations = []
    crawl['states'].each do |state|
      state['locations'][0]['locations'].each_with_index do |crawl_loc, i|
        next if i == 0 # table header
        location = nil
        if db_locations_by_state[state['name']].present?
          location = db_locations_by_state[state['name']].find{|dbl| dbl.state == state['name'] and dbl.city == crawl_loc['city'] and dbl.name == crawl_loc['name']}
        end
        if location.nil?
          location = FreakmapLocation.new(state: state['name'], city: crawl_loc['city'], name: crawl_loc['name'], machines: crawl_loc['machines'])
        end
        all_locations.push(location)
        if location.latitude == nil || location.longitude == nil
          location.geocode
        end
        location.save if location.changed?
      end
    end
    (db_locations - all_locations).each(&:destroy)
    gon.push(locations: all_locations)
  end

  private
  def crawl
    Rails.cache.fetch 'freakmap_crawl', expires_in: 1.day do
      Wombat.crawl do
        base_url 'http://www.ddrfreak.com'
        path '/locations/locations.php'

        states 'css=table.standardtext li', :iterator do
          name 'css=a'
          locations 'css=a', :follow do
            locations 'css=table.standardtext tr', :iterator do
              name 'css=td:nth-child(1)'
              city 'css=td:nth-child(2)'
              machines 'css=td:nth-child(3)'
            end
          end
        end
      end
    end
  end
end
