class CommentariesController < ApplicationController
  def show
    @commentaries = Commentary.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @commentary = @profile.commentaries.new(params.require(:commentary).permit(:profile_id, :text))
    @commentary.head_hunter_id = current_head_hunter.id
    @commentary.save
    redirect_to @profile
  end
end 