class JobsController < ApplicationController
  def index
   @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @head_hunters = HeadHunter.all
  end
  
  def create
    @job = Job.new(job_params)
    @job.head_hunter = current_head_hunter
    if @job.save
      flash[:notice] = 'Vaga criada com sucesso'
      redirect_to @job
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :skills, 
                                :salary, :job_level, :end_date,  
                                :location)
  end
end