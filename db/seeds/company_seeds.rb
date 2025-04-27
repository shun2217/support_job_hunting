# db/seeds.rb

# 業界データの作成 （業界モデル作ったらこれ活用する）
# industry_1 = Industry.create(name: 'IT')
# industry_2 = Industry.create(name: '製造業')
# industry_3 = Industry.create(name: '医療')

# 求職者データの作成
Company.create([
  { 
    name: '株式会社A',
    desire: 1, 
    status: 0, 
    information: '会社Aの詳細情報', 
    memo: 'メモA', 
    strength: '強みA', 
    weakness: '弱みA', 
    industry_id: 1, 
    my_page: 'http://mypage_a.com'
  }, { 
    name: '株式会社B', 
    desire: 2, 
    status: 1, 
    information: '会社Bの詳細情報', 
    memo: 'メモB', 
    strength: '強みB', 
    weakness: '弱みB', 
    industry_id: 1, 
    my_page: 'http://mypage_b.com' 
  }, { 
    name: '株式会社C', 
    desire: 3, 
    status: 2, 
    information: '会社Cの詳細情報', 
    memo: 'メモC', 
    strength: '強みC', 
    weakness: '弱みC', 
    industry_id: 2, 
    my_page: 'http://mypage_c.com' }
])
