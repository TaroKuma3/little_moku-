class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # ↑ユーザー登録画面でニックネームの追加をするためのコード。
  # 詳細はこの下のprivate methodに書かれてる。
  # ただ、forなんていうメソッドは見つからないと文句言われるから一旦コメントアウト
  # devise/registratons/new.htmlもコメントアウト済み

  # ログインした後、そのユーザーの詳細ページへジャンプするためのコード
  # idを入れたいが…？
  def after_sign_in_path_for(resource)
    users_path
  end


  private
  # ログインしているユーザーだけshowが見えるようにしている（本当はログイン
  def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
  end

  # ↓新規ユーザー登録画面でニックネームを追加するコードだったけれど、forがundefinedになるので一旦コメントアウト
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :name
  # end

end
