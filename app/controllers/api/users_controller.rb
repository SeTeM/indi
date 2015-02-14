class API::UsersController < API::BaseController
  def index
    @users = User.all

    render json: @users
  end

  def create
    build_user
    build_form
    save_form
  end

  private

  def save_form
    if @user_form.save
      render json: @user_form.model, status: :created
    else
      render json: @user_form.errors, status: :unprocessable_entity
    end
  end

  def build_form
    @user_form = UserForm.new(@user).tap { |f| f.submit(user_params) }
  end

  def build_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
