module Users
  class SessionsController < Devise::SessionsController
    def destroy
      redirect_path = after_sign_out_path_for(resource_name)
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      set_flash_message! :notice, :signed_out if signed_out
      yield if block_given?
      # We actually need to hardcode this as Rails default responder doesn't
      # support returning empty response on GET request
      redirect_to devise_root_path
    end
  end
end
