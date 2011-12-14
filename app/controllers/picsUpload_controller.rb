require 'upyun'
require 'rest_client'

class PicsuploadController < ApplicationController
  def upload
    @picc = Pic.new()
    
    # 菜单标签配置
    @Upload_current = true;
  end

  def uploadView
    @picc = Pic.new(params[:pic])
    @picc.scores = 100;
    @picc.wins = 0;
    @picc.losses = 0;
    @picc.keyname = Time.now.to_i.to_s + "_"
    
    respond_to do |format|
      if @picc.save
        
        extname =File.extname(@picc.image_url)
        @picc.keyname=@picc.keyname + @picc.id.to_s + extname
        @picc.save
        
        UpYun.new().upload(@picc.image_url,@picc.keyname)
        
        #localFile= File.new(@picc.image_url)
        File.delete(@picc.image_url)
        Dir.delete(File.dirname(@picc.image_url))
        
        format.html { redirect_to(@picc) }
        format.xml  { render :xml => @picc, :status => :created, :location => @picc }
      else
        format.html { render :action => "upload" }
        format.xml  { render :xml => @picc.errors, :status => :unprocessable_entity }
      end
    end
  end
end