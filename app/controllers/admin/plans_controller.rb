module Admin
  class PlansController < Admin::ApplicationController
    before_filter :authenticate_admin
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Category.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:


    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
