# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#　絵文字追加・フォーマル・日常
MessageTemplate.create!([
  { category: :daily, emoji: :add, tone: :formal, content: "今日どうされてます？😊" },
  { category: :daily, emoji: :add, tone: :formal, content: "最近どうですか？🌱" },
  { category: :daily, emoji: :add, tone: :formal, content: "いい天気ですね☀️" },
  { category: :daily, emoji: :add, tone: :formal, content: "お元気にしてますか？🌸" },
  { category: :daily, emoji: :add, tone: :formal, content: "明日の予定は？📆" },
  { category: :daily, emoji: :add, tone: :formal, content: "最近ハマってることあります？🎯" },
  { category: :daily, emoji: :add, tone: :formal, content: "休みの日はどうされてますか？☕" },
  { category: :daily, emoji: :add, tone: :formal, content: "今、時間いいですか？⏰" },
  { category: :daily, emoji: :add, tone: :formal, content: "ちょっとお尋ねしてもいいですか？❓" },
  { category: :daily, emoji: :add, tone: :formal, content: "また話しましょうね✨" }
])
  # 絵文字追加・カジュアル・日常
MessageTemplate.create!([
  { category: :daily, emoji: :add, tone: :casual, content: "了解！助かる〜✨" },
  { category: :daily, emoji: :add, tone: :casual, content: "ありがとう🎶また連絡するね📩" },
  { category: :daily, emoji: :add, tone: :casual, content: "大丈夫👌気にしないで🍀" },
  { category: :daily, emoji: :add, tone: :casual, content: "おつかれさま〜🍵ゆっくり休んでね🌙" },
  { category: :daily, emoji: :add, tone: :casual, content: "わかった🙆明日よろしくね☀️" },
  { category: :daily, emoji: :add, tone: :casual, content: "今向かってるよ🚃もうすぐ着く〜📍" },
  { category: :daily, emoji: :add, tone: :casual, content: "助かった🙏ほんとありがとう💡" },
  { category: :daily, emoji: :add, tone: :casual, content: "また遊ぼう‼️楽しみにしてる🌈" },
  { category: :daily, emoji: :add, tone: :casual, content: "ちょうど良かった！助かる〜✨" },
  { category: :daily, emoji: :add, tone: :casual, content: "了解🙆また連絡する〜！" }
])
  # 関西弁変換・フォーマル・日常
  MessageTemplate.create!([
  { category: :daily, emoji: :kansai, tone: :formal, content: "今日どうしてるん？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "最近どうしてはる？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "ええ天気やな" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "元気にしてはる？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "明日の予定は？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "最近ハマってることある？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "休みの日はどう過ごしてはる？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "今、時間ええ？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "ちょっとお尋ねしてもいい？" },
  { category: :daily, emoji: :kansai, tone: :formal, content: "また話しましょ" }
])

  # 関西弁変換・カジュアル・日常
  MessageTemplate.create!([
    { category: :daily, emoji: :kansai, tone: :formal, content: "今日、何してんの？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "最近、調子どうや？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "今日はええ天気やな" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "元気にしてるん？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "明日の予定、決まってる？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "最近ハマってるん、なんや？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "休みんとき、何してん？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "今、ちょっと時間ある？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "ちょっと聞きたいんやけどええか？" },
    { category: :daily, emoji: :kansai, tone: :formal, content: "また話そな" }
  ])
# 絵文字追加　フォーマル　応答・リアクション

MessageTemplate.create!([
  { category: :reaction, emoji: :add, tone: :formal, content: "承知いたしました🫡" },
  { category: :reaction, emoji: :add, tone: :formal, content: "ありがとうございます🌿" },
  { category: :reaction, emoji: :add, tone: :formal, content: "承りました📝" },
  { category: :reaction, emoji: :add, tone: :formal, content: "了解しました✅" },
  { category: :reaction, emoji: :add, tone: :formal, content: "ご対応ありがとうございます🌼" },
  { category: :reaction, emoji: :add, tone: :formal, content: "確認いたしました✔️" },
  { category: :reaction, emoji: :add, tone: :formal, content: "いつもありがとうございます✨" },
  { category: :reaction, emoji: :add, tone: :formal, content: "助かります。感謝します🙏" },
  { category: :reaction, emoji: :add, tone: :formal, content: "すぐ対応いたしますのでお待ちくださいませ💨" },
  { category: :reaction, emoji: :add, tone: :formal, content: "恐れ入りますが、よろしくお願いいたします🙏" }
])

# 絵文字追加　カジュアル　応答・リアクション
MessageTemplate.create!([
  { category: :reaction, emoji: :add, tone: :casual, content: "いいね👍" },
  { category: :reaction, emoji: :add, tone: :casual, content: "わかった👌" },
  { category: :reaction, emoji: :add, tone: :casual, content: "助かる〜🙏" },
  { category: :reaction, emoji: :add, tone: :casual, content: "了解〜😊" },
  { category: :reaction, emoji: :add, tone: :casual, content: "すぐ確認するね🔍" },
  { category: :reaction, emoji: :add, tone: :casual, content: "ありがとう🌸" },
  { category: :reaction, emoji: :add, tone: :casual, content: "OK👌" },
  { category: :reaction, emoji: :add, tone: :casual, content: "まかせて！💪" },
  { category: :reaction, emoji: :add, tone: :casual, content: "すぐ対応するね💨" },
  { category: :reaction, emoji: :add, tone: :casual, content: "頼んどくね✨" }
])
# 関西弁変換　フォーマル　応答リアクション

MessageTemplate.create!([
  { category: :reaction, emoji: :add, tone: :casual, content: "いいやん👍" },
  { category: :reaction, emoji: :add, tone: :casual, content: "わかったで👌" },
  { category: :reaction, emoji: :add, tone: :casual, content: "助かるわ〜🙏" },
  { category: :reaction, emoji: :add, tone: :casual, content: "了解やで〜😊" },
  { category: :reaction, emoji: :add, tone: :casual, content: "すぐ確認するわ🔍" },
  { category: :reaction, emoji: :add, tone: :casual, content: "ありがと🌸" },
  { category: :reaction, emoji: :add, tone: :casual, content: "OKやで👌" },
  { category: :reaction, emoji: :add, tone: :casual, content: "まかしとき！💪" },
  { category: :reaction, emoji: :add, tone: :casual, content: "すぐ対応するわ💨" },
  { category: :reaction, emoji: :add, tone: :casual, content: "頼んどくわ✨" }
])
# 関西弁変換　カジュアル　応答リアクション
MessageTemplate.create!([
  { category: :reaction, emoji: :add, tone: :casual, content: "ええやん👍" },
  { category: :reaction, emoji: :add, tone: :casual, content: "わかったわ👌" },
  { category: :reaction, emoji: :add, tone: :casual, content: "ほんま助かるわ〜🙏" },
  { category: :reaction, emoji: :add, tone: :casual, content: "了解やで〜😊" },
  { category: :reaction, emoji: :add, tone: :casual, content: "すぐ見とくわ🔍" },
  { category: :reaction, emoji: :add, tone: :casual, content: "ありがとさん🌸" },
  { category: :reaction, emoji: :add, tone: :casual, content: "OKやわ👌" },
  { category: :reaction, emoji: :add, tone: :casual, content: "まかしときや！💪" },
  { category: :reaction, emoji: :add, tone: :casual, content: "すぐやっとくわ💨" },
  { category: :reaction, emoji: :add, tone: :casual, content: "頼んどくわな✨" }
])

# 絵文字追加　フォーマル　お誘い・関心
MessageTemplate.create!([
  { category: :invitation, emoji: :add, tone: :formal, content: "お茶でもご一緒しませんか？☕✨" },
  { category: :invitation, emoji: :add, tone: :formal, content: "もしご都合よろしければ、お誘いさせてください🌸" },
  { category: :invitation, emoji: :add, tone: :formal, content: "お時間あればお会いできますか？📅" },
  { category: :invitation, emoji: :add, tone: :formal, content: "ランチに出かけませんか？🍴" },
  { category: :invitation, emoji: :add, tone: :formal, content: "近々お時間ありますか？📆" },
  { category: :invitation, emoji: :add, tone: :formal, content: "最近、何をされてますか？😊" },
  { category: :invitation, emoji: :add, tone: :formal, content: "お休みの日はどう過ごされてますか？🌞" },
  { category: :invitation, emoji: :add, tone: :formal, content: "今日はどのように過ごしていますか？🌼" },
  { category: :invitation, emoji: :add, tone: :formal, content: "お仕事終わり、何されていますか？🌙" },
])

# 絵文字追加　カジュアル　お誘い・関心
MessageTemplate.create!([
  { category: :invitation, emoji: :add, tone: :casual, content: "今度お茶しよう☕" },
  { category: :invitation, emoji: :add, tone: :casual, content: "週末どうしてる？一緒に出かけない？🚶‍♂️" },
  { category: :invitation, emoji: :add, tone: :casual, content: "ちょっと話したいな📞" },
  { category: :invitation, emoji: :add, tone: :casual, content: "今なにしてる？😊" },
  { category: :invitation, emoji: :add, tone: :casual, content: "休日どう過ごしてる？🏖️" },
  { category: :invitation, emoji: :add, tone: :casual, content: "最近興味あることある？📚" },
  { category: :invitation, emoji: :add, tone: :casual, content: "相談したいことあるんだけど、時間ある？🕒" },
  { category: :invitation, emoji: :add, tone: :casual, content: "次遊ぶ予定立てようよ🎉" },
  { category: :invitation, emoji: :add, tone: :casual, content: "今何考えてる？🧐" },
  { category: :invitation, emoji: :add, tone: :casual, content: "最近どう？🌟元気してる？🍀" }
])

# 関西弁変換　フォーマル　お誘い・関心
MessageTemplate.create!([
  { category: :invitation, emoji: :add, tone: :formal, content: "今度お茶しませんか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "週末どうしてはりますか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "少しお話しさせてもらっても構いませんか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "今、何してはりますか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "休みの日、どんな風に過ごしてはりますか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "今からお時間よろしければ、ご都合いかがでしょうか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "相談したいことがあるねんけど、時間とれますか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "次に会う予定、ぼちぼち立てましょうか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "最近どうしてはりますか？お変わりないですか？" },
  { category: :invitation, emoji: :add, tone: :formal, content: "お元気にしてはりますか？" }
])

# 関西弁変換　カジュアル　お誘い・関心
MessageTemplate.create!([
  { category: :invitation, emoji: :add, tone: :casual, content: "今度お茶しぃひん？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "週末どうしてる？一緒に出かけへん？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "ちょっと話したいねん" },
  { category: :invitation, emoji: :add, tone: :casual, content: "今何してんの？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "休みの日、どう過ごしてる？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "今から遊ばへん？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "相談したいことあるんやけど、時間ある？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "次遊ぶ予定立てへん？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "今何考えてるん？" },
  { category: :invitation, emoji: :add, tone: :casual, content: "最近どう？元気しとる？" }
])

# 絵文字追加　フォーマル　SNS
MessageTemplate.create!([
  { category: :invitation, emoji: :add, tone: :formal, content: "みなさん、最近どうしてますか？😊✨" },
  { category: :invitation, emoji: :add, tone: :formal, content: "お元気ですか？🌸" },
  { category: :invitation, emoji: :add, tone: :formal, content: "今日はいいお天気ですね☀️🌿" },
  { category: :invitation, emoji: :add, tone: :formal, content: "最近ハマってること教えてください📖" },
  { category: :invitation, emoji: :add, tone: :formal, content: "時間があったら何をしますか？⌛" },
  { category: :invitation, emoji: :add, tone: :formal, content: "ここで近況共有しませんか？📝" },
  { category: :invitation, emoji: :add, tone: :formal, content: "みなさんの最近のこと、知りたいです👀" },
  { category: :invitation, emoji: :add, tone: :formal, content: "明日のお天気、気になりますね☁️🌼" },
  { category: :invitation, emoji: :add, tone: :formal, content: "良い一日になりますように✨🙏" },
  { category: :invitation, emoji: :add, tone: :formal, content: "また結果を報告します📣" }
])
# 絵文字追加　カジュアル　SNS
MessageTemplate.create!([
  { category: :invitation, emoji: :add, tone: :casual, content: "みなさん、最近どうしてる？😊✨" },
  { category: :invitation, emoji: :add, tone: :casual, content: "元気？🌸" },
  { category: :invitation, emoji: :add, tone: :casual, content: "今日はいい天気やね☀️🌿" },
  { category: :invitation, emoji: :add, tone: :casual, content: "最近ハマってること何かある？📖" },
  { category: :invitation, emoji: :add, tone: :casual, content: "時間あったら何する？⌛" },
  { category: :invitation, emoji: :add, tone: :casual, content: "ここで近況共有しよ？📝" },
  { category: :invitation, emoji: :add, tone: :casual, content: "みんなの最近のこと、聞きたい👀" },
  { category: :invitation, emoji: :add, tone: :casual, content: "明日のお天気、気になるな☁️🌼" },
  { category: :invitation, emoji: :add, tone: :casual, content: "良い1日になりますように✨🙏" },
  { category: :invitation, emoji: :add, tone: :casual, content: "また結果報告するね📣" }
])
# 関西弁変換　フォーマル　SNS
MessageTemplate.create!([
  { category: :invitation, emoji: :kansai, tone: :casual, content: "みなさん、最近どうしてはる？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "元気してます？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "今日はええ天気してますね" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "最近ハマってること何かあります？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "時間あったら何しはる？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "ここで近況共有しましょ？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "みんなの最近のこと聞きたいですねぇ" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "明日のお天気どうなるか気になりますね" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "ええ一日になりますように" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "また結果報告しますね" }
])

# 関西弁変換　カジュアル　SNS
MessageTemplate.create!([
  { category: :invitation, emoji: :kansai, tone: :casual, content: "みんな、最近どうしてんの？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "元気しとる？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "今日はめっちゃええ天気やな" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "最近ハマってるもん、何かある？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "時間あったら何してるん？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "ここで近況シェアしよか？" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "みんなの最近のこと、めっちゃ聞きたいわぁ" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "明日のお天気どうなるかな〜" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "いい一日になるようにしよな" },
  { category: :invitation, emoji: :kansai, tone: :casual, content: "また報告するわな" }
])

# 絵文字追加　フォーマル　確認・質問
MessageTemplate.create!([
  { category: :check_question, emoji: :add, tone: :formal, content: "これで合ってますか？✅" },
  { category: :check_question, emoji: :add, tone: :formal, content: "もう一度確認してもいいですか？🔍" },
  { category: :check_question, emoji: :add, tone: :formal, content: "どうされますか？🤔" },
  { category: :check_question, emoji: :add, tone: :formal, content: "こちらで問題ないでしょうか？✔️" },
  { category: :check_question, emoji: :add, tone: :formal, content: "少し説明をお願いできますか？🗣️" },
  { category: :check_question, emoji: :add, tone: :formal, content: "もう少し詳しく聞かせてください📖" },
  { category: :check_question, emoji: :add, tone: :formal, content: "頻繁に使いますか？🔄" },
  { category: :check_question, emoji: :add, tone: :formal, content: "それはどういう意味ですか？❓" },
  { category: :check_question, emoji: :add, tone: :formal, content: "他にご希望ありますか？✨" },
  { category: :check_question, emoji: :add, tone: :formal, content: "もしよければ教えてほしいです🙏" }
])

# 絵文字追加　カジュアル　確認・質問
MessageTemplate.create!([
  { category: :check_question, emoji: :add, tone: :casual, content: "これで合ってる？✅" },
  { category: :check_question, emoji: :add, tone: :casual, content: "もう一回確認してもいい？🔍" },
  { category: :check_question, emoji: :add, tone: :casual, content: "どうする？🤔" },
  { category: :check_question, emoji: :add, tone: :casual, content: "ここでいい？✔️" },
  { category: :check_question, emoji: :add, tone: :casual, content: "ちょっと説明してくれる？" },
  { category: :check_question, emoji: :add, tone: :casual, content: "もう少し詳しく聞きたいな📖" },
  { category: :check_question, emoji: :add, tone: :casual, content: "よく使う？🔄" },
  { category: :check_question, emoji: :add, tone: :casual, content: "それってどういう意味？❓" },
  { category: :check_question, emoji: :add, tone: :casual, content: "他に希望ある？✨" },
  { category: :check_question, emoji: :add, tone: :casual, content: "よければ教えてほしいな🙏" }
])
# 関西弁変換　フォーマル　確認・質問
MessageTemplate.create!([
  { category: :check_question, emoji: :kansai, tone: :casual, content: "これで合ってる？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "もう一回確認してもいい？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "どうする？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "ここでええ？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "ちょっと説明してくれる？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "もっと詳しく聞きたいわ" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "これ、よく使う？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "それってどういう意味や？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "他に希望ある？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "よければ教えてくれる？" }
])
# 関西弁変換　カジュアル　確認・質問
MessageTemplate.create!([
  { category: :check_question, emoji: :kansai, tone: :casual, content: "これでええんか？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "もう一回見てもろてええ？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "どうすんねん？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "ここでよろしいかいな？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "ちょっと説明してもらえへん？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "もっと詳しゅう聞きたいわ" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "これ、よう使うんか？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "それってなんやねん？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "他になんかあるんか？" },
  { category: :check_question, emoji: :kansai, tone: :casual, content: "よければ聞かしてくれや" }
])
