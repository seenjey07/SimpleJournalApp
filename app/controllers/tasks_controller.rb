class TasksController < ApplicationController

  before_action :set_category, only: [:new, :create]

  def new
    @task = Task.new
  end

  def create
    @task = @category.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to category_path(@category), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
    @category = @task.category
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to category_path(@task.category), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @category = @task.category
    @task.destroy
    redirect_to category_path(@category), notice: 'Task was successfully deleted.'
  end

  def today
    @tasks = @category.tasks.where(due_date: Date.today)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end
