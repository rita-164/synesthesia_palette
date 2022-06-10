class ColorDiagnosesController < ApplicationController

    def index
        @q = HumanNameSynesthesium.ransack(params[:q])
        @human_name_synesthesium = @q.result(distinct: true)
    end
end