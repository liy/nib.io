class HomeController < ApplicationController
  def index
    # if user is signed in, go to his own home page
    if current_user
        redirect_to current_user
    else
        # get the rss information
        require 'simple-rss'
        require 'open-uri'
        require 'iconv'


        # force to read rss as UTF-8
        i = Iconv.new('UTF-8', 'UTF-8')
        @rss = SimpleRSS.parse i.iconv(open('https://github.com/liy/nib.io/commits/master.atom').read)

        render :layout => "home"
    end
  end
end
