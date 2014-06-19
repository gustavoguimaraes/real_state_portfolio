class PropertiesController < ApplicationController

  def index
    @houses = Property.houses.order("updated_at desc")
    @condos_coops = Property.where(property_type: ['condo', 'co-op']).order("updated_at desc")
  end

  def show
    @property = Property.find(params[:id])
  end

end
