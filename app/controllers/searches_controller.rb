class SearchesController < ApplicationController
    before_action :authenticate_user!

    def search
      @range = params[:range]
  
      if @range == "Name"
        @users = HumanNameSynesthesium.looks(params[:search], params[:word])
      end
    end  
end
