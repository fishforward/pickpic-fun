class PicsController < ApplicationController
  # GET /pics
  # GET /pics.xml
  def index
    #@pics = Pic.find(:all, :order => "scores desc")
  
    @pics = Pic.search(params[:page])  

    # 菜单标签配置
    @Picks_current = true;
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pics }
    end
  end

  # GET /pics/1
  # GET /pics/1.xml
  def show
    @pic = Pic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pic }
    end
  end

  # GET /pics/new
  # GET /pics/new.xml
  def new
    @pic = Pic.new {}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pic }
    end
  end

  # GET /pics/1/eedit
  def eedit
    @pic = Pic.find(params[:id])
  end

  # POST /pics
  # POST /pics.xml
  def create
    @pic = Pic.new(params[:pic])
    if @pic.scores == nil
      @pic.scores = 0
    end
    if @pic.wins == nil
      @pic.wins = 0
    end
    if @pic.losses == nil
      @pic.losses = 0
    end

    respond_to do |format|
      if @pic.save
        flash[:notice] = 'Pic was successfully created.'
        format.html { redirect_to(@pic) }
        format.xml  { render :xml => @pic, :status => :created, :location => @pic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pics/1
  # PUT /pics/1.xml
  def update
    @pic = Pic.find(params[:id])

    respond_to do |format|
      if @pic.update_attributes(params[:pic])
        flash[:notice] = 'Pic was successfully updated.'
        format.html { redirect_to(@pic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "eedit" }
        format.xml  { render :xml => @pic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.xml
  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy

    respond_to do |format|
      format.html { redirect_to(pics_url) }
      format.xml  { head :ok }
    end
  end
end
