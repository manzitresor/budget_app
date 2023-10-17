class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @group = Group.where(user_id: current_user.id)
    end
    def new
        @group = Group.new
    end
end