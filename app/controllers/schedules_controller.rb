class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    render layout: "toplayout"
  end

  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @schedule.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      flash[:alart] = "スケジュールを登録できませんでした"
      render "new"
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash[:alart] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:destroy] = "スケジュールを削除しました"
    redirect_to :schedules
  end
  
end
