module ApplicationHelper
  # def avatar_for(user)
  #   @avatar = user.image
  #   if @avatar.empty?
  #     @avatar_user = image_tag('user.png', alt: user.name)
  #   else
  #     @avatar_user = image_tag(@avatar.url, alt: user.name)
  #   end
  #   return @avatar_user
  # end

  def avatar(user)
    @user = user
    if @user.image.attached?
      @avatar = cl_image_tag @user.image.key
    else
      @avatar = cl_image_tag('1tbzym9jzdasao247crk9bbpdtpj.png')
    end
    return @avatar
  end
end
