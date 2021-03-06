class ApplyJobsController < ApplicationController
  #before_action :authenticate_candidate!, only: [:new, :create]
  def index
    @apply = ApplyJob.all
    @job = @Job.all
    @job = Job.find(params[:job_id])
  end
  def new
    @job = Job.find(params[:job_id])
    @profile = current_candidate.profile
    if ApplyJob.exists?(profile: @profile, job: @job)
      flash[:notice] = 'Você já esta candidatado para esta vaga'
      redirect_to jobs_path
    else
      @apply = ApplyJob.new
    end
  end

  def create
    @job = Job.find(params[:job_id])
    @apply = ApplyJob.new(params.require(:apply_job).permit(:reason))
    @apply.job = @job
    @apply.profile = current_candidate.profile
    if @apply.save
      flash[:notice] = 'Você se candidatou para a vaga'
      redirect_to jobs_path
    else
      render :new
    end
  end

  def reject
    @apply = ApplyJob.find(params[:id])
    @apply.rejected!
    redirect_to request.referrer
  end

  def feedback
    @jobs = Job.all
    @applies = current_candidate.profile.apply_jobs
  end
end 