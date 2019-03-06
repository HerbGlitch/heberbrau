module Users::OmniauthHelper
  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def register
    @user = User.new(params[:user])    # Not the final implementation!
    @user.save
  end
end
