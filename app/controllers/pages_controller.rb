class PagesController < ApplicationController

  def home
    @title = "Home"
    
    respond_to do |format|
      format.html { redirect_to(:controller => 'picks', :action =>'new')};
    end
  end
  
  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
    
    @message = Message.new

    # 菜单标签配置
    @About_current = true;
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message | @About_current }
    end
    
  end
end 