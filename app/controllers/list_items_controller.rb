class ListItemsController < ApplicationController
  before_action :require_login
  before_action :require_item_author

  def create
    @list_item = ListItem.new(list_item_params)
    @list_item.list_id = params[:list_id]
    if !@list_item.save
      flash[:errors] = @list_item.errors.full_messages
    end
    redirect_to list_url(List.find(params[:list_id]))
  end

  def destroy
    ListItem.destroy(params[:id])
    redirect_to list_url(List.find(params[:list_id]))
  end

  private

  def list_item_params
    params.require(:list_item).permit(:text)
  end
  
  def require_item_author
    list = List.find(params[:list_id])
    redirect_to user_url(current_user) unless current_user.is_author?(list)
  end
end
