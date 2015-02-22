class API::SessionsController < API::BaseController
  def destroy
    logout

    head :no_content
  end
end
