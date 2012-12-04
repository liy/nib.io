class HomeController < ApplicationController
  def index
    # if user is signed in, go to his own home page
    if current_user
        redirect_to current_user
    end

    # get the rss information
    require 'simple-rss'
    require 'open-uri'
    require 'iconv'


    # force to read rss as UTF-8
    i = Iconv.new('UTF-8', 'UTF-8')
    # Seems like there is a bug on bitbucket's rss feed. If you try to open the feed it will auto detect the
    # encoding as western ISO-8859-1, but it is actually is in UTF-8 encoding
    @rss = SimpleRSS.parse i.iconv(open('https://github.com/liy/nib.io/commits/master.atom').read)

    # if user is not signed in, go to public home page
  end
end
