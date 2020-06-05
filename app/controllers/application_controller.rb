class ApplicationController < ActionController::Base
  before_action :authenticate_candidate_or_head_hunter!, unless: :devise_controller?

  def authenticate_candidate_or_head_hunter!
    return redirect_to root_path unless !!current_candidate || !!current_head_hunter
  end 
end
