# db/seeds.rb

# リセットのための全削除
Industry.delete_all

# 業界データの作成
Industry.create([
  { 
    name: 'IT',
    interest: 3 
  }, { 
    name: '広告',
    interest: 2 
  }, { 
    name: '食品',
    interest: 1 
  },
])
