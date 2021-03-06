class NamesController < ApplicationController

  def index
    @names = Name.all
  end

  def show
    @name = Name.find(params[:id])
  end

  def new
    @name = Name.new
  end

  def edit
    @name = Name.find(params[:id])
  end

  def create
    @name = Name.new(name_param)
    @name.save
    redirect_to @name
  end


  def update
    @name = Name.find(params[:id])

    if @name.update(name_param)
      redirect_to @name
    else
      render 'edit'
    end
  end


  def destroy
    @name = Name.find(params[:id])
    @name.destroy

    redirect_to names_path
  end


  private

  def name_param
    params.require(:name).permit(:name, :age)
  end
end
