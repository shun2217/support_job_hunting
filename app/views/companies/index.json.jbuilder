# 表示しないカラム名のリストの作成
excluded_columns = %w[id strength weakness information memo created_at updated_at]

# 表示しないカラムの削除とoperationの追加
columns = Company.column_names.reject { |c| excluded_columns.include?(c) } + ["operation"]

# カラム名を日本語に変換しjson化
json.columns columns.map { |col| human_column_name(Company, col) }

json.data @companies.map { |company|
  columns.map{ |col|
    value = case col
    when "my_page" # リンクにしたいカラム
      link = company.send(col) rescue nil
      link.present? ? link_to(human_column_name(Company, col), link, target: "_blank", rel: "noopener") : nil
    when "operation" # 編集ボタン
      link_to("編集", edit_company_path(company), class: "btn btn-primary btn-sm")
    when "status", "desire" # ENUM型の場合
      I18n.t("activerecord.enums.company.#{col}.#{company.send(col)}")
    when "industry_id" # 別のモデルから引っ張る
      company.industry.name rescue nil
    else
      company.send(col) rescue nil # その他普通のカラム
    end
  }
} 
