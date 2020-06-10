class TasksController < InheritedResources::Base

  private

    def task_params
      params.require(:task).permit(:name, :material, :description)
    end

end
