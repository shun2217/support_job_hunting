class CompaniesController < BaseController
  def index
    @companies = Company.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder が呼ばれる
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id]) # 該当のレコードを取得
    if @company.update(company_params) #更新して成功か否かで分岐
      flash[:notice] = "更新に成功しました"
      redirect_to companies_path # 成功の場合会社一覧に遷移
    else
      render :edit
    end
  end
  
  private
  
  def company_params
    """
    paramsがハッシュに似た形でidやform_withで送ったデータが入っている
    form_withで送った部分はすべて含めてcompanyがキーで値がハッシュっぽいので合わせて入っている感じ
    requireでまずcompanyに対応する部分を取得（requireを使うとcompanyがない場合にエラーにしてくれる）
    そしてpermitでホワイトリスト化して欲しい部分以外に変なデータを混ぜてきても大丈夫なようにしている
    """
    #必要なカラムのみをハッシュに近い形で取得
    params.require(:company).permit(:name, :desire, :status, :strength, :weakness, :my_page, :information, :memo)
  end
end
