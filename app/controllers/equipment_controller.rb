class EquipmentController < InheritedResources::Base
	protect_from_forgery prepend: true
  private

    def equipment_params
      params.require(:equipment).permit(:name, :serial, :assetno, :description)
    end

end
