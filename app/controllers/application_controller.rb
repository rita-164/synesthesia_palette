class ApplicationController < ActionController::Base

    private

    def not_authenticated
      redirect_to login_url, dark: t('defaults.message.login_require')
    end

    add_flash_types :dark
end
