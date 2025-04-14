class CompaniesController < BaseController
  def index
    @companies = Company.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder が呼ばれる
    end
  end
end
