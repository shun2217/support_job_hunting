excluded_columns = %w[created_at updated_at]
columns = Company.column_names.reject { |c| excluded_columns.include?(c) }

json.columns columns.map { |col| Company.human_attribute_name(col) }
json.data @companies.map { |company|
  columns.map { |col| company.send(col) }
}
