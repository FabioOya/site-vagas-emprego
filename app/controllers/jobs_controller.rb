class JobsController < ApplicationController
  before_action :authenticate_head_hunter!, only: [:new, :create]
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
  
  def edit
    @job = Job.find(params[:id])
   end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def search
    @q = params[:q]
    @jobs = Job.search(@q)   
    # if @jobs.blank? || params[:q].blank?   ##TODO configurar busca caso nenhum resultado encontrado - testes quebrando quando implementado
    #   @jobs = Job.all
    #   flash.now[:alert] = "Nenhum resultado encontrado para: #{@q}"
    #end
    render :index
  end

  def candidates_applied
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :skills, 
                                :salary, :job_level, :end_date,  
                                :location)
  end
end