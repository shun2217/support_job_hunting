# 表示するカラムを順番に代入
columns = %w[name interest operation]

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
