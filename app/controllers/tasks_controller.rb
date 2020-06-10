class TasksController < InheritedResources::Base
before_action :authenticate_user!
access user: {
    except: [:destroy, :new, :create, :edit]},
    admin: :all, 
    landlord: :all, 
    tenant: {except: [:destroy, :new, :create, :edit]}
layout 'service'
  private

    def task_params
      params.require(:task).permit(:id, :name, :minutes, :tool_id, :description, :maintenance_id, :schedule)
    end

end
