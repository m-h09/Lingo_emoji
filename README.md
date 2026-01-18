

# プロジェクト名：EMOJI関西弁変換

[![Image from Gyazo](https://i.gyazo.com/9487b76167be2dff1506e38cf49218a8.png)](https://gyazo.com/9487b76167be2dff1506e38cf49218a8)
🌏アプリケーションURL:https://lingo-emoji.onrender.com/
## 目次


- [サービスの概要](#-サービスの概要)
- [ユーザー層について](#%E2%80%8D-%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E5%B1%A4%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)
- [このサービスへの思い・作りたい理由](#-このサービスへの思い・作りたい理由)
- [サービスの差別化のポイント・押しポイント](#-サービスの差別化のポイント・押しポイント)
- [ChatGPTとの差別化](#-ChatGPTとの差別化)

- [機能紹介](#-機能紹介)
- [ChatGPTとの差別化](#-ChatGPTとの差別化)
- [既存アプリとの違い](#-既存アプリとの違い)
- [使用技術](#-使用技術)
  - [ER図](#-ER図)
- [アプリ概要](#-アプリ概要)
  - [利用シーン](#-利用シーン)



## 💖 サービスの概要
「Emoji関西弁変換」は、入力した文章に気軽に絵文字をつけたり、関西弁に変換できるWebサービスです。

近年、SNSやメッセージアプリでのやり取りが増える中、絵文字のない文章はほとんど見かけません。
特にSNSでは、多くの人に公開されるため、誤解を避けるためにも絵文字でニュアンスを補うことが一般的になっています。
本サービスでは、入力した文章に自分の好みに合わせた絵文字を簡単に付与できます。

メインターゲットは10代後半〜30代前半のSNSユーザー、学生や若手社会人です。
私自身もSNS世代として育ってきましたが、絵文字を探すのが面倒であったり、センスがないと思われるのが不安で、うまく使えないと感じることが多くありました。

また、近年はマッチングアプリでのメッセージ利用も増えており、「程よい絵文字表現」が求められる場面も多くなっています。本サービスではフォーマル・カジュアル・フランクといったトーンや、絵文字の量を弱・中・強で調整できるため、友人だけでなく目上の方とのやり取りにも自然に活用できます。さらに、AIが利用できない状況でも使えるテンプレート機能を備えており、安心して利用できます。



## 👨‍💼 ユーザー層について
- よく文章を作成する人（チャットやLINEユーザー）で社交辞令程度の絵文字が面倒な方
- SNSなど発信する方
- 普段からのメッセージのやり取りで絵文字をつけるのに、悩んでる方
- 文章にどんな絵文字を使ったらいいか、わからなくなる方
- PCでのチャットの際、絵文字を使いたいけどすぐに変換できず面倒に思っている方

## 📖 このサービスへの思い・作りたい理由
私は基本的にメッセージで絵文字やスタンプを使う機会が少ないです。理由としては、自分の気持ちにあったものがすぐに見つけ出せなくて面倒になるのが理由でした。
文章を入力しただけで絵文字の追加や関西弁変換ができるアプリがあれば面白いと思ったのがきっかけです。
PCで入力する際は特に絵文字を選択するのが難しいため、絵文字を追加してくれるアプリがあると便利だと思いました。

## 📌 サービスの差別化のポイント・押しポイント
- 単なる「辞書置換」ではなく AIを利用して自然な絵文字付与**を実現
- 「弱/中/強」の段階で 同じ文章でも違った表現にできる遊び心
- 「開いてすぐ使える」シンプルなUI → アカウント登録不要・1画面で完結
- 将来的には「ビジネスモード（丁寧語変換）」「翻訳モード」などへの拡張性
[![Image from Gyazo](https://i.gyazo.com/00afc089bec71657e16e600b91bfdd7b.png)](https://gyazo.com/00afc089bec71657e16e600b91bfdd7b)

 -------
## ⚙️ 機能紹介
| トップページ |
| :---: |
| [![Image from Gyazo](https://i.gyazo.com/93e5d661d6963ad5aea27071a42d99e5.gif)](https://gyazo.com/93e5d661d6963ad5aea27071a42d99e5)|
| <p align="left">基本的にはユーザー登録なしで利用が可能です。選択ボタンをクリックするとAI生成やテンプレートの利用がすぐに利用できます。<br>ログインが必須の選択ボタンもあります。</p> |
<br>

| ユーザー登録 / ログイン |
| :---: |
|[![Image from Gyazo](https://i.gyazo.com/500e2d031e0c098bbdf01922fc471118.gif)](https://gyazo.com/500e2d031e0c098bbdf01922fc471118) |
|[![Image from Gyazo](https://i.gyazo.com/e03f7158abce478aea0dd1ad064ef3e1.gif)](https://gyazo.com/e03f7158abce478aea0dd1ad064ef3e1)|
| <p align="left">ハンバーガーメニューからログイン/ユーザー登録ができます。『名前』『メールアドレス』『パスワード』『確認用パスワード』を入力してユーザー登録を行います。ユーザー登録後は、自動的にログイン処理が行われるようになっており、そのまま直ぐにサービスを利用する事が出来ます。<br></p> |
<br>


| AI生成 |
| :---: |
| [![Image from Gyazo](https://i.gyazo.com/d0f614443316437d2e685de3d060505c.png)](https://gyazo.com/d0f614443316437d2e685de3d060505c)|
| <p align="left">AI生成では３つの生成方法があります。<br>入力されるテキスト合うemojiを生成する「Emoji追加」、テキストを関西弁に変換する「関西弁変換」、Emojiとテキストを関西弁変換できる「Emoji関西弁」を利用することができます<br></p> |
|[![Image from Gyazo](https://i.gyazo.com/7cf358f423ede8c7d2544a9f74468826.gif)](https://gyazo.com/7cf358f423ede8c7d2544a9f74468826)|
|<p align="left">上記の動画のようにテキストを入力する他に２、３つほど選択してもらい、ユーザーが思う理想のテキストの雰囲気に近づけるようにしいました。</p>
<br>

| テンプレート |
| :---: |
|[![Image from Gyazo](https://i.gyazo.com/c384e9202107317e6a578ad9582e223e.png)](https://gyazo.com/c384e9202107317e6a578ad9582e223e)|
|<p align ="left">データベースに「Emoji」「関西弁」のテンプレートを用意しました。
|[![Image from Gyazo](https://i.gyazo.com/8e492f0e16f4c866ef3482a082922d0b.gif)](https://gyazo.com/8e492f0e16f4c866ef3482a082922d0b)|
<br>セレクトボックスが全て選択されてから出力するようにしています</p>|
<br>

|Myテンプレート|
| :---: |
|[![Image from Gyazo](https://i.gyazo.com/97521a067cb849690078fd95205205f6.png)](https://gyazo.com/97521a067cb849690078fd95205205f6)|
|<p align="left">「Myエンプレート」ではAI生成の履歴が残っていきます。
<br>まず、「Myテンプレート」をクリックするとMyテンプレートが出てきます。
<br>「編集はこちら」をクリックすると下画面にスクロールし、メニュが現れます</p>|
|[![Image from Gyazo](https://i.gyazo.com/5e0307838e76ef29fbec49f7c91aeba2.png)](https://gyazo.com/5e0307838e76ef29fbec49f7c91aeba2)|
<br>

<h6>Myテンプレートができることをご紹介</h6>
<br>

|「Myテンプレートに登録」|
| :---: |
|[![Image from Gyazo](https://i.gyazo.com/71a8eae993ec80d449c79875136753d4.png)](https://gyazo.com/71a8eae993ec80d449c79875136753d4)|
|<p align="left">AI生成をするとデータ量が多くなるのでpagenateを設置。複数選択が可能です。
<br>データ量が増えてくるので検索機能も設置<p>|
|[![Image from Gyazo](https://i.gyazo.com/23d3d5f1538a1d9878573a19a893899e.png)](https://gyazo.com/23d3d5f1538a1d9878573a19a893899e)|
|<p align="left">登録後はMyテンプレートに移動し、すぐ使えるような動線にしました。</p>|
<br>

|「Myテンプレートから削除」|
| :---: |
|[![Image from Gyazo](https://i.gyazo.com/0df062b08e238bcaf69926647341da34.png)](https://gyazo.com/0df062b08e238bcaf69926647341da34)|
|<p align="left">登録を解除する意味で「Myテンプレートから削除」と表現しています。
<br>削除されると履歴が保管されているデータベースに戻ります。</p>|
<br>

|「「履歴を削除」|
| :---: |
|[![Image from Gyazo](https://i.gyazo.com/771a68a1ed1b314b08292fa9071c56c8.png)](https://gyazo.com/771a68a1ed1b314b08292fa9071c56c8)|
|<p align="left">この場所では履歴自体を完全に削除できる場所になります。</p>|




## ChatGPTとの差別化
- ChatGPTだと毎回プロンプトが必要、本アプリは入力したい文章を打ってボタンを押して即変換
- LINE返事などの日常会話に特化
- AIが落ちてもテンプレ機能があるため安定性がある
- UIで直感的に使えるため、ユーザーに優しい

## 既存アプリとの違い
 [![Image from Gyazo](https://i.gyazo.com/00afc089bec71657e16e600b91bfdd7b.png)](https://gyazo.com/00afc089bec71657e16e600b91bfdd7b)




## 使用技術

| カテゴリ | 技術内容 |
|---------|----------|
| 環境構築 | Docker（※使用していれば追記） |
| サーバーサイド | Ruby 3.2.3 ／ Ruby on Rails 7.2.2 |
| データベース | PostgreSQL（pg） |
|cssフレームワーク|boostrap|
| アプリケーションサーバー | Puma |
|ホスティングサーバー| render |
| 認証 | Sorcery |
| 画像アップロード | CarrierWave ／ Cloudinary |
| AI API | ruby-openai |
| フロントエンド | Hotwire（Turbo + Stimulus）・JavaScript（Importmap） |
| バージョン管理 | git ・ github |
| デバッグ | debug |
| 静的解析 | Rubocop・Rubocop Rails・Brakeman |
| 環境変数管理 | dotenv-rails |
| 開発ツール | web-console・letter_opener_web |
|バージョンアップ管理ツール|github|




### ER図
[![Image from Gyazo](https://i.gyazo.com/7f84aba471f7fe38556736ca8db1e30f.png)](https://gyazo.com/7f84aba471f7fe38556736ca8db1e30f)
