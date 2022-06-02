class Admin::HumanNameSynesthesiaController < Admin::BaseController
    skip_before_action :check_admin, only: %i[new edit update]

    def index
        @q = HumanNameSynesthesium.ransack(params[:q])
        @human_name_synesthesium = @q.result(distinct: true).all.includes(:user).order(created_at: :desc)
    end

    def new
        @human_name_synesthesia = HumanNameSynesthesium.new
    end
    
    def create
        @human_name_synesthesia = HumanNameSynesthesium.build(human_name_synesthesia_params)
        if @human_name_synesthesia.save
          redirect_to human_name_synesthesia_path, success: t('defaults.message.created', item: HumanNameSynesthesium.model_name.human)
        else
          flash.now['danger'] = t('defaults.message.not_created', item: HumanNameSynesthesium.model_name.human)
          render :new
        end
    end
    
    def show
        @human_name_synesthesia = HumanNameSynesthesium.find(params[:id])
    end

    def edit
        @human_name_synesthesia = HumanNameSynesthesium.find(params[:id])
    end
    
    def update
        @human_name_synesthesia = HumanNameSynesthesium.find(params[:id])
        if @human_name_synesthesia.update(human_name_synesthesia_params)
          redirect_to human_name_synesthesia_path, success: t('defaults.message.updated', item: HumanNameSynesthesium.model_name.human)
        else
          flash.now['danger'] = t('defaults.message.not_updated', item: HumanNameSynesthesium.model_name.human)
          render :edit
        end
    end
    
    def destroy
        @human_name_synesthesia = HumanNameSynesthesium.find(params[:id])
        @human_name_synesthesia.destroy!
        redirect_to human_name_synesthesia_path, success: t('defaults.message.deleted', item: HumanNameSynesthesium.model_name.human)
    end
    
    private
    
    def human_name_synesthesia_params
        params.require(:human_name_synesthesium).permit(:name, :color, :color_cache)
    end
end
