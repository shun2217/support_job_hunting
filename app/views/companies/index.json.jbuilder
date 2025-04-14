# # 除外するカラム
# excluded_columns = %w[created_at updated_at]

# # ヘッダー表示用（日本語）
# json.columns Company.column_names.reject { |c| excluded_columns.include?(c) }.map { |col|
#   Company.human_attribute_name(col)
# }

# # データ本体
# json.data @companies.map { |company|
#   company.attributes.reject { |k, _| excluded_columns.include?(k) }
# }
excluded_columns = %w[created_at updated_at]
columns = Company.column_names.reject { |c| excluded_columns.include?(c) }

json.columns columns.map { |col| Company.human_attribute_name(col) }
json.data @companies.map { |company|
  columns.map { |col| company.send(col) }
}
