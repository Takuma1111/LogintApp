class TasksController < ApplicationController
  def index
  end

  def new
    # @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
        redirect_to tasks_index_path
      else
        render("tasks/index")
    end
  end

  private
    def task_params
      params.permit(:user_id,:taskname,:body)
    end

end
