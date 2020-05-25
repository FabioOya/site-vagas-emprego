class ProposalsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @profile = Profile.find(params[:profile_id])
    @proposal = Proposal.new
  end

  def create
    @job = Job.find(params[:job_id])
    @proposal = Proposal.new(proposal_params.merge(job: @job, head_hunter: current_head_hunter, profile: @profile))
    @proposal.profile = @profile
    if @proposal.save
      flash[:notice] = 'Proposta enviada!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:begin_date, :salary, :benefits, :role, :profile_id, :job_id)
  end
end