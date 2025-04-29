class IndustriesController < BaseController
  def index
    @industries = Industry.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder が呼ばれる
    end
  end

  def edit
    @industry = Industry.find(params[:id])
  end

  def update
    @industry = Industry.find(params[:id]) # 該当のレコードを取得
    if @industry.update(industry_params) #更新して成功か否かで分岐
      flash[:notice] = "更新に成功しました"
      redirect_to industries_path # 成功の場合会社一覧に遷移
    else
      render :edit
    end
  end

  def new
    @industry = Industry.new
  end

  def create
    @industry = Industry.new
    if @industry.update(industry_params) #作成して成功か否かで分岐
      flash[:notice] = "作成に成功しました"
      redirect_to industries_path # 成功の場合会社一覧に遷移
    else
      render :new
    end
  end
  
  private
  
  def industry_params
    #必要なカラムのみをハッシュに近い形で取得
    params.require(:industry).permit(:name, :interest, :memo)
  end
end
