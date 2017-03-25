class PagesController < ApplicationController
  def home
  	@practices = Practice.all
  end

  def search
  end
end