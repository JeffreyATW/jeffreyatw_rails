class WelcomeController < ApplicationController
  layout false

  def index
    @sections = Section.where('name != "Contact"')
  end
end