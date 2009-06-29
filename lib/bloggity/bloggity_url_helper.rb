# Here's a location to keep task-specific defines
module BloggityUrlHelper
	
	# Create a named url for the blog and action combination
	def blog_named_link(blog_post, the_action = :show, options = {})
		case the_action
		when :show: "/blog/#{blog_post.blog.url_identifier}/#{blog_post.url_identifier}"
		when :index: "/blog/#{options[:blog].url_identifier}"
		when :feed: { :controller => 'blogs', :id => options[:blog].url_identifier, :action => :feed }
		else
			{ :controller => 'blog_posts', :action => the_action, :blog_id => (options[:blog] && options[:blog].id) || blog_post.blog_id, :id => blog_post }
		end
	end
	
  def blog_path(object, options = {})
    case object
    when Blog
      "/blog/#{object.url_identifier}"
    when BlogPost
      "/blog/#{object.blog.url_identifier}/#{object.url_identifier}"
    end
  end
end
