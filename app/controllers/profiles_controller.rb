class ProfilesController < ApplicationController
  before_action :authenticate_candidate!, only: [:new, :create, :edit, :update]
  before_action :authenticate_head_hunter!, only: [:index]
  def index
    @profiles = Profile.all     
  end
  
  def show
    #@profile = Profile.find_by(candidate_id: params[:id])
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.candidate = current_candidate
    if @profile.save
      flash[:notice] = "Perfil cadastrado com sucesso"  
      redirect_to @profile
    else
      render :new
    end
  end
  
  def edit
    @profile = Profile.find(params[:id])
   end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

    # def authorize_admin
  #   redirect_to root_path, notice: 'Não autorizado' unless current_user.admin?
  # end
  
  private

  def profile_params
    params.require(:profile).permit(:full_name, :social_name, :birthdate,
                                      :formation, :description, :experience, 
                                      :photo, :candidate_id)
  end
end