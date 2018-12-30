class Constants
    # 【２】works#newで、公開・非公開の選択肢を作ろうとして、他でも使うだろうからと部品化することにした。
    # カラム名：public。integer=数値が入る。０か１かを書き換えることで公開・非公開を管理する。
    # １はどっちだっけ？とならないように、定数を使うことにした。
    # １なら公開として定数PUBLIC、０なら非公開として定数PRIVATEとする。
    # Constantsは定数って意味。
    # なんでクラス作ってるかは忘れてもた。
    # メソッドで使える定数・変数は先に定義済みじゃなきゃいかんから、以下の流れはわかる。
    # 2018/12/25追記
    # ↓workをintegerで０・１管理にしたからこうなった。でも今やりたいのはbooleanだからtrue/false
    # ということで、or を使ってみたけれどmypate#showで非公開が出ちゃってる。
    # PRIVATE = 0 || false
    # PUBLIC =  1 || true)←これだと都度計算になってしまっている。定数は計算済みのものを当てるようにする
# 定数は一度決めたら変更しない。

    PRIVATE = 0
    PUBLIC =  1


    # 新たに2018/12/21追加↓表示ではなくコード上でいちいち公開・非公開と書くことはマジックナンバー使うのと同じ。
    # またいろんなところで公開・非公開を使うので、変更が会った時に全部書き直す面倒が。
    # よってここで公開・非公開を定数管理にした。
    PRIVATE_VALUE = "非公開"
    PUBLIC_VALUE = "公開"

    # 選択肢として表示する内容をメソッドとして作成。
    # 表示文字列（キー）が"公開"のものは、定数（値）：PUBLIC。定数：PUBLICは、カラム内では１として管理される。
    # この後はapplication_herlperでお呼び出しする
    # def self.options_for_public
    #     [["公開", PUBLIC], ["非公開", PRIVATE]]
    # end
    # ↑で新たに公開・非公開を定数管理にしたので、self.options_for_publicメソッドも書き換え！
    # これをヘルパーで使う。


    # ↓2018/12/22新たに追加。moku_type#editでとりまが編集できないよう制御するための定数
    DEFAULT_MOKU_TYPE_NAME = "とりあえずMOKUる"

    # ↓2018/12/23新たに追加。faqのカテゴリのためのもの
    # 「全般」は特定のプライマリキーを持たせているわけじゃないから公開非公開みたいにIDでは繋げられない
    # QA登録は頻繁にやるものではないのでとりあえずスルーする
    GENERAL = "全般"

    def self.options_for_public
        [[PUBLIC_VALUE, PUBLIC], [PRIVATE_VALUE, PRIVATE]]
    end

    # ↑をまねて、mokus#newでMJNの選択肢選ぶのを作ってみる
    # もともと作ってあった定数へ置き換えることにしたのでコメントアウト
    # FALSE = 0
    # TRUE = 1

    # 別の箇所でも出てくるようなら↑と同じように定数にすることも考える
    def self.options_for_mjn
        [['もちろん!', PUBLIC], ['遠慮します', PRIVATE]]
    end

end