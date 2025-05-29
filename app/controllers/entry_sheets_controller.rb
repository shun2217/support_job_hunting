class EntrySheetsController < BaseController
  def index
    @entry_sheets = EntrySheet.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder が呼ばれる
    end
  end

  def edit
    @entry_sheet = EntrySheet.find(params[:id])
  end

  def update
    @entry_sheet = EntrySheet.find(params[:id]) # 該当のレコードを取得
    if @entry_sheet.update(entry_sheet_params) #更新して成功か否かで分岐
      flash[:notice] = "更新に成功しました"
      redirect_to entry_sheets_path # 成功の場合会社一覧に遷移
    else
      render :edit
    end
  end

  def new
    @entry_sheet = EntrySheet.new
  end

    def destroy
    @entry_sheet = EntrySheet.find(params[:id]) # 該当のレコードを取得
    if @entry_sheet.destroy #削除して成功か否かで分岐
      flash[:notice] = "削除しました"
      redirect_to entry_sheets_path # 成功の場合会社一覧に遷移
    else
      flash[:alert] = "削除できませんでした"
      redirect_to entry_sheets_path
    end
  end

  def create
    @entry_sheet = EntrySheet.new
    if @entry_sheet.update(entry_sheet_params) #作成して成功か否かで分岐
      flash[:notice] = "作成に成功しました"
      redirect_to entry_sheets_path # 成功の場合会社一覧に遷移
    else
      render :new
    end
  end
  
  private
  
  def entry_sheet_params
    #必要なカラムのみをハッシュに近い形で取得
    params.require(:entry_sheet).permit(:title, :question, :answer, :event_id, :words, :memo)
  end
end
