class HomeController < ApplicationController
  skip_before_action :authenticate_candidate_or_head_hunter! 
  def index
  end
end