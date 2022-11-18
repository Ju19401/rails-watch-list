class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @list.update(list_params)

    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def lists_params
    params.require(:title).permit(:title, :body, :photo)
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
