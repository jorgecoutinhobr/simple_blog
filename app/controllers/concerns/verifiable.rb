module Verifiable
  private

  def verify_permission
    if current_user != resource_user
      redirect_to root_path, alert: t('text.permission_denied')
    end
  end

  def resource_user
    raise NotImplementedError, t('text.define_resource_alert')
  end
end