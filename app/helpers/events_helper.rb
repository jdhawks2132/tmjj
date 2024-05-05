module EventsHelper
	def event_image_path(event)
    case event.event_type
    when 'concert'
      'concert.jpg'
    when 'date_night'
      'date_night.jpg'
    when 'dinner'
      'dinner.jpg'
    when 'misc'
      'misc.jpg'
    when 'pickleball'
      'pickleball.jpg'
    when 'softball'
      'softball.jpg'
    when 'travel'
      'travel.jpg'
    else
      'default.jpg' 
    end
  end
end
