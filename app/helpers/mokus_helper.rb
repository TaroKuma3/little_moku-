module MokusHelper

    # apprication_helperにかいた、公開非公開の選択肢をまねてmokus#newのMJNの選択肢
    # 元の部分はlib/constants.rbにいる
  def options_for_mjn
      Constants.options_for_mjn
  end

  def format_moku_time
    hours = moku_time / (60 * 60)
    minutes = moku_time / 60.floor
    seconds = moku_time
    return "#{hours}時間　#{minutes}分 #{seconds}秒"
  end
end
