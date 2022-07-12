class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start, :end, :allday, :contents))
      
    #終日のチェック判断
    if @schedule.allday == "true"
      @result = "○"
    else
      @result = ""
    end
      
    if @schedule.start > @schedule.end
      flash[:notice] = "終了日時は開始日時より後に設定してください。"
      render "new"
    elsif @schedule.save
      flash[:notice] = "スケジュールを追加しました。"
      redirect_to :schedules
    else
      flash[:notice] = "スケジュール登録に失敗しました。"
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

    #終日のチェック判断
    if @schedule.allday == "true"
      @result = "○"
    else
      @result = ""
    end

    if @schedule.start > @schedule.end
      flash[:notice] = "終了日時は開始日時より後に設定してください。"
      render "edit"
    elsif @schedule.update(params.require(:schedule).permit(:title, :start, :end, :allday, :contents))
      flash[:notice] = "#{@schedule.title} の情報を更新しました。"
      redirect_to :schedules
    else
      flash[:notice] = "更新に失敗しました。"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    flash[:notice] = "スケジュール：#{@schedule.title} を削除しました。"
    @schedule.destroy
    redirect_to :schedules
  end
end
