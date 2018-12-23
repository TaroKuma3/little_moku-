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
    def public_to_s(value)
        if value == Constants::PUBLIC
            Constants::PUBLIC_VALUE
        else
            Constants::PRIVATE_VALUE
        end
    end

    def hello(name)
        "こんにちは #{name}さん"
    end

    def goodbye(name)
        "さようなら #{name}さん"
    end

    def greeting
        now = Time.now.hour
        # morning = 5 <= now && now < 12 #真偽値がかえる
        # lunchtime = 12 <= now && now < 15
        # evening = 15 <= now && now < 19
        # night = 19 <= now || now < 5 elseだからいらない
        eary_morning = (4..7).include?(now)
        morning = (8..11).include?(now) #(nowの（）はあってもなくてもいい)
        lunchtime = (12..14).include?(now)
        evening = (15..18).include?(now)
        night = (19..24).include?(now)

        if eary_morning
            "早起きですね"
        elsif
            morning #tureかfalseが入っているので == tureはいらない
            "おはようございます"
        elsif lunchtime
            "こんにちは"
        elsif evening
            "いい夕方ですね"
        elsif night
            "こんばんわ"
        else
            "遅くまでお疲れ様です"
        end

        # return "おはようございます" if morning こういう書き方もいける

    end

end
