# db/seeds.rb

# リセットのための全削除
Event.delete_all

# 業界データの作成
Event.create([
  { 
    name: '説明会',
    started_at: "202506031400",
    ended_at: "202506031900",
    company_id: 1 
  }, { 
    name: 'インターンシップ',
    started_at: "202507031400",
    ended_at: "202507151900",
    company_id: 1
  }, { 
    name: '説明会',
    started_at: "202506141000",
    ended_at: "202506141200",
    company_id: 2 
  }, { 
    name: '面接',
    started_at: "202508071400",
    ended_at: "202508071500",
    company_id: 3 
  },
])
