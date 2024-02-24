class ApplicationController < ActionController::Base
  before_action :coonfigure_permitted_params, if: :devise_controller?

  def after_sign_up_path_for(resource)
    "/users/#{current_user.id}"
  end

  protected

    # 入力フォームからアカウント名をDBに保存する
    def coonfigure_permitted_params
      devise_paramater_sanitizer.permit(:sign_up, keys: [:name])
    end
end
