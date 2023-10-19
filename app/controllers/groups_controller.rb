class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @groups = Group.where(user_id: current_user.id)
    end
    def new
        @group = Group.new
    end
    def show
        @group = Group.find(params[:id])
        @entities = @group.entities.order(created_at: :desc)
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
        params.require(:group).permit(:name,:icon,:author_id)
    end
end