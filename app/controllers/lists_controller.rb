class ListsController < ApplicationController
  before_action :require_login
  before_action :require_list_author, except: [:new, :create]

  def new
    @list = List.new
    render :new
  end

  def create
    @list = List.new(list_params)
    @list.author_id = current_user.id

    if @list.save
      redirect_to list_url(@list)
    else
      flash.now[:errors] = @list.errors.full_messages
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def edit
    @list = List.find(params[:id])
    render :edit
  end

  def update
    @list = List.update(params[:id], list_params)

    if @list.save
      redirect_to list_url(@list)
    else
      flash.now[:errors] = @list.errors.full_messages
      render :edit
    end
  end

  def destroy
    List.destroy(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:title, :list_topic_id)
  end

  def require_list_author
    list = List.find(params[:id])
    redirect_to user_url(current_user) unless current_user.is_author?(list)
  end
end
