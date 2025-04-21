excluded_columns = %w[created_at updated_at] # 表示しないカラム名のリストの作成

"""
# rejectは.reject{|変数| 条件式}で、リストなどから一つずつ変数を取り出して、条件式がtrueになるものを削除していく
# .include?(変数)が、変数がリストに含まれている場合trueとなるので、exclude_columnsに含まれるカラム名を削除している
"""
columns = Company.column_names.reject { |c| excluded_columns.include?(c) } # 表示しないカラムの削除

"""
mapはブロックの中で計算などした結果でリストを作成していくので、つまりリストの値を利用した新しいリストの作成に使う
json.OO XXは、OOをキーとしたXXの値をjsonにする感じ。jbuilder内でこれがある度にjsonの内容が追加されるイメージ
human_attribute_nameはi18nの適用のメソッド
"""
json.columns columns.map { |col| Company.human_attribute_name(col) } # カラム名を日本語に変換しjson化

"""
sendは変数を使ってデータの中身を取り出すときに使う
Model.nameを呼びたいとき、col=”name” Model.send(col)でいける
ここではmapを二重に使って[”カラム1の中身”, ”カラム2の中身”]みたいなのを値としたjsonを作っている
"""
json.data @companies.map { |company|
  columns.map { |col| company.send(col) }
} # 各レコードで、各カラムの配列を取得しjson化
