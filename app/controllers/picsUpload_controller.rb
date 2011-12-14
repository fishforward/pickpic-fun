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
    
    respond_to do |format|
      if @picc.save
        
        UpYun.new().upload(@picc.image_url,@picc.id)
        
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