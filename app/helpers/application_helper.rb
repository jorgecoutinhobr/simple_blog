module ApplicationHelper
  include Pagy::Frontend

  def avatar_url(user, size: 200)
    hash = Digest::MD5.hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end
end
