class ApplicationController < ActionController::Base
    before_action:require_login

    private

    def not_authenticated
      redirect_to login_url, warning: t('defaults.message.login_require')
    end

    add_flash_types :success, :info, :warning, :danger
end
