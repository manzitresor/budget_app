class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @group = Group.where(user_id: current_user.id)
    end
    def new
        @group = Group.new
    end
    def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id
        if @group.save
            redirect_to groups_path
        else
            render :new
        end
    end

    private
    
    def group_params
        params.require(:group).permit(:name,:icon)
    end
end