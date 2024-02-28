class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    "/users/#{current_user.id}"
  end

  private

    # deviseのUserモデルに関するリクエストからパラメータを取得できるようになる
    # deviseであらかじめ設定されたストロングパラメータに新たにカラムを含めたい場合、
    # permitメソッドで追加できる

    # ユーザー新規登録時にアカウント名をDBに保存できるようにする
    def configure_permitted_paramaters
      if resource_class == User
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
        devise_parameter_sanitizer.permit(:log_in, keys: [:name])
      end
    end
end
