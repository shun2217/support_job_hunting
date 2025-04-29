# 表示しないカラム名のリストの作成
excluded_columns = %w[id memo created_at updated_at]

# 表示しないカラムの削除とoperationの追加
columns = Industry.column_names.reject { |c| excluded_columns.include?(c) } + ["operation"]

# カラム名を日本語に変換しjson化
json.columns columns.map { |col| human_column_name(Industry, col) }

json.data @industries.map { |industry|
  columns.map{ |col|
    value = case col
    when "operation" # 編集ボタン
      link_to("編集", edit_industry_path(industry), class: "btn btn-primary btn-sm")
    when "interest" # ENUM型の場合
      I18n.t("activerecord.enums.industry.#{col}.#{industry.send(col)}")
    else
      industry.send(col) rescue nil # その他普通のカラム
    end
  }
} 
