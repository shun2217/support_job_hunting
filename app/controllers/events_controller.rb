class EventsController < BaseController
  def index
    @events = Event.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder が呼ばれる
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id]) # 該当のレコードを取得
    if @event.update(event_params) #更新して成功か否かで分岐
      flash[:notice] = "更新に成功しました"
      redirect_to events_path # 成功の場合会社一覧に遷移
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

    def destroy
    @event = Event.find(params[:id]) # 該当のレコードを取得
    if @event.destroy #削除して成功か否かで分岐
      flash[:notice] = "削除しました"
      redirect_to events_path # 成功の場合会社一覧に遷移
    else
      flash[:alert] = "削除できませんでした"
      redirect_to events_path
    end
  end

  def create
    @event = Event.new
    if @event.update(event_params) #作成して成功か否かで分岐
      flash[:notice] = "作成に成功しました"
      redirect_to events_path # 成功の場合会社一覧に遷移
    else
      render :new
    end
  end
  
  private
  
  def event_params
    #必要なカラムのみをハッシュに近い形で取得
    params.require(:event).permit(:name, :started_at, :ended_at, :memo, :company_id)
  end
end
