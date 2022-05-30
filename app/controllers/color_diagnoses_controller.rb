class ColorDiagnosesController < ApplicationController
    skip_before_action :require_login

    def index
        @q = HumanNameSynesthesium.ransack(params[:q])
        @human_name_synesthesium = @q.result(distinct: true)
    end
end