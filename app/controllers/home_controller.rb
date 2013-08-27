class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    last_modified = File.mtime("#{Rails.root}/app/views/home/index.html.erb")
    fresh_when last_modified: last_modified , public: true, etag: last_modified
  end
end
