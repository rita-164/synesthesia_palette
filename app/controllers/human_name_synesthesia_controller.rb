class HumanNameSynesthesiaController < ApplicationController
    def index
        @human_name_synesthesias = HumanNameSynesthesium.all.includes(:user).order(created_at: :desc)
      end
end
