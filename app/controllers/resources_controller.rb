class ResourcesController < ApplicationController
  def index
    @resources = current_resource_type.enabled.default_order.paginate(page: params[:page], per_page: 15)
  end

  def show
    @resource = current_resource_type.enabled.friendly.find params[:id]
  end

  def current_resource_type
    controller_name.classify.constantize
  end
end
