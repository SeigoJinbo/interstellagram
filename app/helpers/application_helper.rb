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

  def ago(date)
    sec = Time.now - date

    if sec < 60
      return 'less than a minute ago'
    elsif sec <= 3600
      return "#{min = (sec / 60).floor} #{min == 1 ? 'minute' : 'minutes'} ago"
    elsif sec <= 86_400
      return "#{hour = (sec / 3600).floor} #{hour == 1 ? 'hour' : 'hours'} ago"
    elsif sec <= 604_800
      return "#{day = (sec / 86_400).floor} #{day == 1 ? 'day' : 'days'} ago"
    else
      return date.to_time.strftime('%b %e %Y')
    end
  end
  def short_ago(date)
    sec = Time.now - date

    if sec < 60
      return '<1m'
    elsif sec <= 3600
      return "#{min = (sec / 60).floor}m"
    elsif sec <= 86_400
      return "#{hour = (sec / 3600).floor}h"
    elsif sec <= 604_800
      return "#{day = (sec / 86_400).floor}d"
    elsif sec <= 2_419_200
      return "#{day = (sec / 604_800).floor}w"
    elsif sec <= 29_030_400
      return "#{day = (sec / 2_419_200).floor}m"
    else
      return "#{day = (sec / 29_030_400).floor}y"
    end
  end
end
