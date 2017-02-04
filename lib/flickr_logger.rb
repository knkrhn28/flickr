# Custom logger for Flickr API responses

class FlickrLogger < Logger
  def format_message(timestamp, stat, code, msg)
    "#{timestamp} - #{stat} #{code} #{msg}\n"
  end
end

logfile = File.open("#{Rails.root}/log/flickr_response.log", 'a')
logfile.sync = true
FLICKR_LOGGER = FlickrLogger.new(logfile) # constant accessible anywhere
