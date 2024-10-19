class TasksController < ApplicationController
  def index
    @categories = Category.all
    @tasks = Task.where(status: false) 
    @task = Task.new 
  end

  def create
    @task = Task.new(task_params)
    @task.status = false 

    if @task.save
      redirect_to tasks_path, notice: "เพิ่มงานใหม่สำเร็จ"
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "อัปเดตงานสำเร็จ"
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "ลบงานสำเร็จ"
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :category_id)
  end
end
