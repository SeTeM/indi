ActionController::Base.send(:include, Auth)
ActionController::Base.helper_method :current_user
ActionController::Base.helper_method :logged_in?
