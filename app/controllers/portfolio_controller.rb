class PortfolioController < ApplicationController
  layout false

  def index
    @sections = Section.all
  end
end
