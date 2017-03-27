class PagesController < ApplicationController
  def home
  	@practices = Practice.all
  end
end

