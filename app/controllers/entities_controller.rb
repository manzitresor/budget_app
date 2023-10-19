class EntitiesController < ApplicationController
  def index
    @entities = Entity.where(user_id: current_user.id)
  end

  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:entity][:selected_group_id])
    @entity = @group.entities.new(entity_params)
    @entity.author_id = current_user.id

    if @entity.save
      EntityGroup.create(group: @group, entity: @entity)
      redirect_to groups_path
    else
      render :new
    end
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
