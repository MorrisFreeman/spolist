module ApplicationHelper
  def avatar_url(user)
    if user.image
      user.image
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
  end

  def display_favorite(playlist)
    result = ''
    if current_user.favorite?(playlist)
      result = 'no-display'
    end
    result
  end

  def display_unfavorite(playlist)
    result = ''
    unless current_user.favorite?(playlist)
      result = 'no-display'
    end
    result
  end
end
