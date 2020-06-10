class MaintenancesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_maintenance, only: [:show,  :edit, :update, :destroy, :download]
    access user: {
    except: [:destroy, :new, :create, :edit]},
    admin: :all, 
    landlord: :all, 
    tenant: {except: [:destroy, :new, :create]}

layout 'service'
  def index
    if current_user.roles.include? :tenant
      @maintenances = Maintenance.planned.all
    end
    @maintenances = Maintenance.all
  end
  def show

    @tasks = @maintenance.tasks
  end
	#def index
	#	if current_user.roles.include? :admin
 	# 	@maintenances = Maintenance.all
 	# 	end
 	 	#else 
      	#@maintenances = Contract.left_joins(:service).where('contracts.user_id' => current_user.id)
      	#if current_user.roles.include? :landlord
      	#Service.where('contracts.user_id' => current_user.id)
  #	end
  def new
    if current_user.roles.include? :landlord
    @maintenance = Maintenance.new
    #@contract=Contract.all
    @task = Task.all
    end
    #Appliance.left_outer_joins(:transactions).distinct.order
   # @contract = Contract.all
  end
  def edit
    @task = Task.all# - @maintenance.tasks#@task = Task.left_outer_joins(:maintenance) 
    #@contract=Contract.all
  end
 
 def create
    @maintenance = Maintenance.new(maintenance_params)
    if @maintenance.save
  
      redirect_to @maintenance, notice: 'Maintenance Schedule was successfully created.'
    else
      render :new
    end
  end
  # PATCH/PUT /contracts/1
  def update
    if @maintenance.update(maintenance_params)
        #params[:order].each do |key, value|
      redirect_to @maintenance, notice: 'Maintenance Schedule was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contracts/1
  def destroy
    @maintenance.destroy
    redirect_to maintenances_url, notice: 'Maintenance Schedule was successfully destroyed.'
  end




  private
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def maintenance_params
      params.require(:maintenance).permit(:name, :starting_date, :description,
        verifications_attributes: [:id,  :_new,:_create, :_destroy, :maintenance_id, :task_id],
        tasks_attributes: [:id, :name, :minutes, :maintenance_id, :tool_id, :_destroy],
        contracts_attributes: [:id, :reference],
        )
    end

end
