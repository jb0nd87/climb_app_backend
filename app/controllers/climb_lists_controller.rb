class ClimbListsController < ApplicationController
  before_action :set_climb_list, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /climb_lists
  def index
    @climb_lists = ClimbList.where(user_id: @user_id)

    render json: @climb_lists
  end

  # GET /climb_lists/1
  def show
    render json: @climb_list
  end

  # POST /climb_lists
  def create
    @climb_list = ClimbList.new(climb_list_params)
    @climb_list.user_id = @user.id

    if @climb_list.save
      render json: @climb_list, status: :created, location: @climb_list
    else
      render json: @climb_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /climb_lists/1
  def update
    if @climb_list.update(climb_list_params)
      render json: @climb_list
    else
      render json: @climb_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /climb_lists/1
  def destroy
    @climb_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb_list
      @climb_list = ClimbList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def climb_list_params
      params.require(:climb_list).permit(:name, :description)
    end
end
