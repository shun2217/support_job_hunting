# db/seeds.rb

# リセットのための全削除
EntrySheet.delete_all

# 業界データの作成
EntrySheet.create([
  { 
    title: "ガクチカ",
    question: "大学生時代に頑張ったことを400文字以内で書きなさい",
    answer: "私が大学時代に力を入れたことは、地域のボランティアです。力を入れたことの理由としては二つあります。一つは人の役に立つことが好きであること、もう一つは地域の人との交流を深めたいと考えたからです",
    words: 400,
    event_id: 1,
    memo: "メモ１"
  }, { 
    title: "強み",
    question: "あなたの強みを30字以内で書きなさい",
    answer: "私の強みは強いことです",
    words: 30,
    event_id: 2,
    memo: "メモ１"
  }, { 
    title: "趣味",
    question: "趣味について20字で教えてください",
    answer: "趣味はスポーツです",
    words: 20,
    event_id: 3,
    memo: "メモ１"
  }
])
