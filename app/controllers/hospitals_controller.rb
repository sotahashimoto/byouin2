class HospitalsController < ApplicationController
  def new
    @hospital = Hospital.new
  end

  def index
    @search = Hospital.ransack(params[:q])
    @results = @search.result.page(params[:page]).reverse_order
  end

  def search
    @q = Hospital.search(search_params)
    @students = @q.result(distinct: true)
  end

  def show
    @hospital = Hospital.find(params[:id])
    @comments = @hospital.comments
    @comment = Comment.new
  end

  def create
  	@hospital = Hospital.new(hospital_params)
    @hospital.save
  	redirect_to hospitals_path
  end

  def edit
  	@hospital = Hospital.find(params[:id])
  end

  def update
    hospital = Hospital.find(params[:id])
    hospital.update(hospital_params)
    redirect_to hospital_path(hospital.id)
  end

  def destroy
  	hospital = Hospital.find(params[:id])
  	hospital.destroy
  	redirect_to hospitals_path
  end

  private
  def hospital_params
  	params.require(:hospital).permit(:title, :body, :hospital_image)
  end
end