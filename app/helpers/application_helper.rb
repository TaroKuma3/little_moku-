module ApplicationHelper
# 【３】ビューで使う部品は、ヘルパーで管理する。（最近あんまりこだわりがなくなりつつあるらしい）
# だけど、work_helperに書くとworkのビューにしか使えない。それはビューやコントローラと同じ。
# どのコントローラのビューでも使うであろうものなので、ここapprication_herlperに書く。
# 何を書くかって、ビューで使える部品化を書く。
# constants.rbは選択肢を部品にした。それをここにかけばビューのどこでも呼び出せる部品にできる。
# ヘルパーは一番上にある通りmodule。
# https://ja.stackoverflow.com/questions/23740/ruby%E3%81%AEclass%E3%81%A8module%E3%81%AE%E4%BD%BF%E3%81%84%E5%88%86%E3%81%91
# ↑複数のclassにまたがるメソッドを継承ではなく合成したいときにmoduleを作ります。

# https://hogehuga.com/post-356/
# ↑ViewでModuleな機能をサポートしてくれるのがHelper
# 何かしらのHelperを定義しておけば、Viewの中でincludeなどの宣言無しにHelper内で定義された処理を呼び出すことができる。
# このあとは、各ビューで「選択肢に出すデーターはどれ？」に対し↓options_for_publicをかけば、おｋ

    def options_for_public
        Constants.options_for_public
    end

    #constants.rbで公開・非公開を定数管理にした。
    # ここでhtml.erb上「公開」「非公開」という言葉で表示できるようメソッドを定義。
    # 現状、このメソッドを当てないとDBの値を返して０か１が表示されてしまうから。
    # これをいろんなhtml.erbで使うといい。とりあえずwork/show.html.erbに使ってみた。
    # これが引数をとる形式なのは、対象により表示が変わるから。
    # 公開である１が返っている場合は公開、０なら非公開を出したい。この分岐が必要。
 
    def public_to_s(value) #もしbooleanとかもでてくるならここで引数を分岐させてあげる必要がある
        if value.is_a?(TrueClass) #←booleanかどうかきいてる
            return Constants::PUBLIC_VALUE
        elsif value.is_a?(FalseClass)
            return Constants::PRIVATE_VALUE
        end

        if value == Constants::PUBLIC
            return Constants::PUBLIC_VALUE
        end

        return Constants::PRIVATE_VALUE
        #想定外の変なクラスが渡ってきたとき＝どの条件にも当てはまらない場合はこの値をかえせになる。デフォ値のようになる、ように読める
        # elseだと数字だけが入ってくるように見える場合がある。booleanが増えたので、数値以外が入るようになってきた。
        # 定数管理する際に、最初は数値にしていたけれど途中でbooleanを使い始めたのでこうなった。
        # どちらかに統一するといい。
    end

    # def hello(name)
    #     "こんにちは #{name}さん"
    # end

    # def goodbye(name)
    #     "さようなら #{name}さん"
    # end

    def greeting
        now = Time.now.hour
        # morning = 5 <= now && now < 12 #真偽値がかえる
        # lunchtime = 12 <= now && now < 15
        # evening = 15 <= now && now < 19
        # night = 19 <= now || now < 5 elseだからいらない
        eary_morning = (4..6).include?(now)
        morning = (7..10).include?(now) #(nowの（）はあってもなくてもいい)
        lunchtime = (11..14).include?(now)
        snacktime = (15..16).include?(now)
        evening = (17..18).include?(now)
        night = (19..24).include?(now)

        if eary_morning
            "早起きですね"
        elsif morning #tureかfalseが入っているので == tureはいらない
            "おはようございます"
        elsif lunchtime
            "こんにちは"
        elsif snacktime
            "今日のおやつはなんですか"
        elsif evening
            "そろそろ今日もおしまいですね"
        elsif night
            "こんばんわ"
        else
            "遅くまでお疲れ様です"
        end

        # return "おはようございます" if morning こういう書き方もいける

    end

end
