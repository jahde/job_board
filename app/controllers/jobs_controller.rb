class JobsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @jobs = Job.order(sort_column + ' ' + sort_direction)
    #@jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end
  
  def create
    Job.create(job_params)
    redirect_to jobs_path
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    redirect_to jobs_path
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end
  
  @data_tables = ActiveRecord::Base.connection.tables
  
  private
  
  def sort_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : "title"
    #params[:sort] || "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    #params[:direction] || "asc"
  end
  
  def job_params
    params.require(:job).permit(:title, :description, :location)
  end
end
