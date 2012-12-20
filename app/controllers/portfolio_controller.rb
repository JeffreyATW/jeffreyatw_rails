class PortfolioController < ApplicationController
  layout false

  def index
    @sections = Section.visible
  end
end
