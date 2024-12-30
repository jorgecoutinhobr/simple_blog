module ApplicationHelper
  include Pagy::Frontend

  def avatar_url(user, size: 200)
    hash = Digest::MD5.hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end

  def user_avatar(user)
    return avatar_url(user) if user.present?

    asset_path("mask.svg")
  end

  def user_nick(user)
    user&.nickname || "Anon"
  end

  def author_of?(resource)
    user_signed_in? && current_user.id == resource.user_id
  end
end
