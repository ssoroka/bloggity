require File.join(File.dirname(__FILE__), 'lib', 'bloggity', 'bloggity_page_names')
require File.join(File.dirname(__FILE__), 'lib', 'bloggity', 'bloggity_url_helper')

# FIX for engines model reloading issue in development mode
if Rails.env.development?
	load_paths.each do |path|
		ActiveSupport::Dependencies.load_once_paths.delete(path)
	end
end
