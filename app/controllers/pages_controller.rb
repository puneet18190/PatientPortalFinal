class PagesController < ApplicationController
  def home
  	@practices = Practice.all.page(params[:page]).per(15)
	if params[:search]
		@practices = Practice.search(params[:search]).order("created_at DESC")
	else
		@practices = Practice.all.order("created_at DESC")
	end
  end
end
