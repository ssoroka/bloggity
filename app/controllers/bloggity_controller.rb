class BloggityController < ApplicationController
  include BloggityPageNames
  include BloggityUrlHelper

  def blog_logged_in?
    logged_in?
  end
  helper_method :blog_logged_in?, :blog_named_link
  
  def load_blog
    if(!params[:blog_id] && (blog_url_identifier = params[:blog_url_id_or_id]))
      @blog = Blog.find_by_url_identifier(blog_url_identifier)
    end
    @blog_id = params[:blog_id] || (@blog && @blog.id) || 1 # There is a default BlogSet created when the DB is bootstrapped, so we know we'll be able to fall back on this
    @blog = Blog.find(@blog_id) unless @blog
  end
  
  def blog_writer_or_redirect
    if @blog_id && current_user && current_user.can_blog?(@blog_id)
      true
    else
      flash[:error] = "You don't have permission to do that."
      redirect_to "/blog"
      false
    end
  end
  
  def blog_comment_moderator_or_redirect
    if @blog_id && current_user && current_user.can_moderate_blog_comments?(@blog_id)
      true
    else
      flash[:error] = "You don't have permission to do that."
      redirect_to "/blog"
      false
    end
  end
  
  def can_modify_blogs_or_redirect
    if(current_user && current_user.can_modify_blogs?)
      true
    else
      redirect_to "/blog"
      false
    end
  end
    
  def get_bloggity_page_name
    @page_name = look_up_page_name(params[:controller], params[:action])
  end
  
end