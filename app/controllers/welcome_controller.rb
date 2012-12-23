class WelcomeController < ApplicationController
  layout false

  def index
    @sections = Section.visible
  end

  def noisegate
    require 'net/http'
    url = URI.parse('http://api.noisebridge.net/gate/')
    args = { 'open' => 'True' }
    resp = Net::HTTP.post_form(url, args)
    render :text => resp.body
  end
end