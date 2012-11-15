module HomeHelper
  #http://stackoverflow.com/questions/195740/how-do-you-do-relative-time-in-rails
  def pretty_date(dateTime)
    a = (Time.now - dateTime).to_i

    # second  1
    # minute  60
    # hour    3600
    # day     86400
    # week    604800
    # month   2419200
    # year    29030400

    case a
      when 0...60 then return t 'past.just_now'
      when 60...3600 then return t 'past.x_minutes_ago', :count => (a/60).to_i
      when 3600...86400 then return t 'past.x_hours_ago', :count => (a/3600).to_i
      when 86400...604800 then return t 'past.x_days_ago', :count => (a/(3600*24)).to_i
      when 604800...2419200 then return t 'past.x_weeks_ago', :count => (a/(7*3600*24)).to_i
      when 2419200...29030400 then return t 'past.x_months_ago', :count => (a/(4*7*3600*24)).to_i
    end
    return t 'past.x_years_ago', :count => ((a)/(12*4*7*3600*24)).to_i
  end
end