class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ↑ユーザー登録画面でニックネームの追加をするためのコード。
  # 詳細はこの下のprivate methodに書かれてる。

  # ログインした後、そのユーザーの詳細ページへジャンプするためのコード
  # after_sign_in_path_forはヘルパーで適当なメソッドとかではない。
  # ↓user.admin == 1が生きてない。管理者もusers_pathに飛ぶ
  # ↓ログイン後にuser_idだすやつ、なし。

  # アクセスしてたページを覚えてて、セッションが切れた後もログインすることでそこに戻してくれる機能…かもしれない。
  # 勝手に変えるとその辺の挙動がおかしくなる。
  def after_sign_in_path_for(resource)
  "/mypage"  #＜＝文字列でOK　users_pathはヘルパーメソッドであって結局文字列が返ってる
  end


  private
  # redirect先はdevise/sessions#newが指定されてる。サインインしてないならログイン画面へ飛ばされる。
  # ↓devise入れた時にわざわざ追記したけど、authenticate_user!と同じだからコメント
  # def sign_in_required
  #     redirect_to new_user_session_url unless user_signed_in?
  # end

  #↓新規ユーザー登録のときニックネームが追加できるようにするためのストロングパラメータ
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def ensure_current_user
    @user = User.find(params[:user_id])

    unless @user.id == current_user.id
      flash[:notice] = "権限がありません！！"
      redirect_to("/mypage")
    end
  end

end
