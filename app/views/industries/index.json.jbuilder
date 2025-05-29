# 表示するカラムを順番に代入
columns = %w[name interest operation]

# カラム名を日本語に変換しjson化
json.columns columns.map { |col| human_column_name(Industry, col) }

json.data @industries.map { |industry|
  columns.map{ |col|
    value = case col
    when "operation" # 編集ボタン
      edit_btn = link_to("編集", edit_industry_path(industry), class: "btn btn-primary btn-sm")
      delete_btn = link_to("削除", industry_path(industry),
                            data: { turbo_method: :delete, turbo_confirm: "本当に削除しますか？" },
                            class: "btn btn-danger btn-sm")
      edit_btn + delete_btn
    when "interest" # ENUM型の場合
      I18n.t("activerecord.enums.industry.#{col}.#{industry.send(col)}")
    else
      industry.send(col) rescue nil # その他普通のカラム
    end
  }
} 
