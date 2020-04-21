class CellsController < InheritedResources::Base

  private

    def cell_params
      params.require(:cell).permit()
    end

end
