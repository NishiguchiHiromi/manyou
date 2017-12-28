class LabelsController < ApplicationController
  before_action :judge_login
  before_action :set_label, only: [:edit, :update, :destroy]
  before_action :set_labels, only: [:edit, :new]


  def show
  end

  # GET /labels/new
  def new
    @label = Label.new
    @task_id = params[:task_id]
  end

  # GET /labels/1/edit
  def edit
    @task_id = params[:task_id]
  end

  # POST /labels
  # POST /labels.json
  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  # PATCH/PUT /labels/1
  # PATCH/PUT /labels/1.json
  def update
    if @label.update(label_params)
      redirect_to tasks_path
    else
      render :edit
    end

  end

  # DELETE /labels/1
  # DELETE /labels/1.json
  def destroy
    @label.destroy
    redirect_to tasks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    def set_labels
      @labels = current_user.labels
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:name, :user_id, :task_id)
    end
end
