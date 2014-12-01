require_dependency "engine1/application_controller"

module Engine1
  class AnotherModelsController < ApplicationController
    include Wisper::Publisher

    before_action :set_another_model, only: [:show, :edit, :update, :destroy]

    # GET /another_models
    def index
      @another_models = AnotherModel.all
    end

    # GET /another_models/1
    def show
    end

    # GET /another_models/new
    def new
      @another_model = AnotherModel.new
    end

    # GET /another_models/1/edit
    def edit
    end

    # POST /another_models
    def create
      @another_model = AnotherModel.new(another_model_params)

      if @another_model.save
        broadcast(:engine1_another_model_created, @another_model)
        redirect_to @another_model, notice: 'Another model was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /another_models/1
    def update
      if @another_model.update(another_model_params || {})
        redirect_to @another_model, notice: 'Another model was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /another_models/1
    def destroy
      @another_model.destroy
      redirect_to another_models_url, notice: 'Another model was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_another_model
        @another_model = AnotherModel.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def another_model_params
        params[:another_model]
      end
  end
end
