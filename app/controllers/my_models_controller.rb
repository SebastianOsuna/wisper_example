class MyModelsController < ApplicationController
  include Wisper::Publisher

  before_action :set_my_model, only: [:show, :edit, :update, :destroy]

  # GET /my_models
  # GET /my_models.json
  def index
    @my_models = MyModel.all
  end

  # GET /my_models/1
  # GET /my_models/1.json
  def show
  end

  # GET /my_models/new
  def new
    @my_model = MyModel.new
  end

  # GET /my_models/1/edit
  def edit
  end

  # POST /my_models
  # POST /my_models.json
  def create
    @my_model = MyModel.new(my_model_params)

      if @my_model.save
        broadcast(:create_model_success, @my_model)
        redirect_to @my_model, notice: 'My model was successfully created.'
      else
        broadcast(:create_model_error, @my_model)
        render :new

      end
  end

  # PATCH/PUT /my_models/1
  # PATCH/PUT /my_models/1.json
  def update
      if @my_model.update(my_model_params || {})
          broadcast(:edit_model_success, @my_model)
          redirect_to @my_model, notice: 'My model was successfully updated.'
      else
          broadcast(:edit_model_error, @my_model)
          render :edit
      end
  end

  # DELETE /my_models/1
  # DELETE /my_models/1.json
  def destroy
    @my_model.destroy
    broadcast(:model_destroyed)
    redirect_to my_models_url, notice: 'My model was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_model
      @my_model = MyModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_model_params
      params[:my_model]
    end
end
