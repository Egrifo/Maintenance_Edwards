class AppliancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appliance, only: [:show, :edit, :update, :destroy]
  access landlord: :all, user: {
    except: [:destroy, :new, :create, :edit]}
  layout 'service'
  # GET /appliances
  def index
    @appliances = Appliance.all
  end

  # GET /appliances/1
  def show
    @appliance = Appliance.find(params[:id])
  end

  # GET /appliances/new
  def new
    @appliance = Appliance.new
  end

  # GET /appliances/1/edit
  def edit
  end
  def create
    @appliance = Appliance.new(appliance_params)
    #@appliance=current_user.service.appliances.build(appliance_params)

    if @appliance.save
      redirect_to @appliance, notice: 'appliance was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /appliances/1
  def update
    if @appliance.update(appliance_params)
      format.html {redirect_to @appliance, notice: 'appliance was successfully updated.'}
    else
      render :edit
    end
  end

  # DELETE /appliances/1
  def destroy
    @appliance.destroy
    redirect_to appliances_url, notice: 'Appliance was successfully destroyed.'
  end

  private
  def set_appliance
      @appliance = Appliance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appliance_params
      params.require(:appliance).permit(:name, :brand, :purchasing_date, :model, :serial, :description, :purchasing_cost)
    end
end
