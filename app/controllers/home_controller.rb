class HomeController < ApplicationController
  #before_action :check_candidate_profile
  def index
    #@profiles = Profile.all
    #redirect_to new_profile_path unless Profile.find_by(candidate: current_candidate).present?
    # if candidate_signed_in?
    #   if Profile.find_by(candidate: current_candidate).nil?
    #     redirect_to new_profile_path
    #     flash[:notice] = 'Preencha seu perfil antes de se candidatar'
    #  end
    # end
  end

  # private
  # def check_candidate_profile
  #   if current_candidate.profile.nil?
  #     redirect_to new_profile_path
  #   end
  # end



end