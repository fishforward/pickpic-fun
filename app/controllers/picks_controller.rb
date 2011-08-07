# encoding: utf-8

class PicksController < ApplicationController
  
  # POST /picks/pickView
  # POST /picks/pickView.xml
  def pickView   
    
    @win_pic_id = params[:l_pic_id];
    @lose_pic_id = params[:r_pic_id];
    
    @pick = Pick.new
    @pick.user = 'mySelf';
    @pick.ip = request.remote_ip;
    
    @pick.win_pic_id = @win_pic_id;
    @pick.loss_pic_id = @lose_pic_id;
         
    #puts @win_pic_id
    #puts @lose_pic_id
    
   #winPic = Pic.new(@win_pic_id);
   pp = Pic.new;
   pp.pk(@win_pic_id, @lose_pic_id);
   #winPic.pk(@lose_pic_id);
   
   puts @win_pic_id
    
   respond_to do |format|
     if @pick.save
        
          flash[:notice] = 'Have Fun Pick Pic!  winner: ' + @win_pic_id + ",losser:" + @lose_pic_id ;
          format.html { redirect_to(:action =>'new')};
         # format.xml  { render :xml => @picks }
      else
          format.html { redirect_to(:action =>'new')};
          format.xml  { render :xml => @pic.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  # GET /picks/new
  # GET /picks/new.xml
  def new
  
    @l_pics = Pic.find(:all, :order => "RANDOM() LIMIT 1");
    l_id = @l_pics[0].id;
#    puts l_id
    @r_pics = Pic.find(:all, :conditions =>["id <> ?", l_id], :order => "RANDOM() LIMIT 1");
    #puts  @r_pic。size;
    #puts @pic_rnd.description
    
    @l_pic = @l_pics[0];
    @r_pic = @r_pics[0];
    
    #进度条获取
    @pickPercentage = Pic.count(:all, :conditions =>["wins > 0 or losses > 0"] );
    @picSum = Pic.count(:all);
    
    # 菜单标签配置
    @Home_current = true;

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @l_pic | @r_pic | @pickPercentage | @picSum | @Home_current}
    end
  end
  

end
