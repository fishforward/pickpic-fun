
class Pic < ActiveRecord::Base
  # attr_accessible :title, :image_url
  
  validates_presence_of :title, :message => "can't be blank."
  validates_presence_of :image_url, :message => "can't be blank."
  validates_length_of   :description, :maximum => 125, :message=>"description exceed the limit."

  validates_format_of :image_url,
        :with=>/^.*(.jpg|.JPG|.gif|.GIF|.png|.PNG)$/,
        :message => "GIF|JPG|PNG are supported."
  
  file_column :image_url, 
              :root_path =>  "public",
              :web_root => ""
          #    :magick => {       
          #    :versions => { "medium" => "306x306>",  "thumb" => "780x780>"  }      
          #    }  
  ##attr_accessible :id, :title, :description, :image_url
  
  def self.search( page)  
    paginate :per_page => 10, :page => page,  
             :order => 'scores desc'  
  end  
  
  def pk(winPicId, losePicId)
    winPic = Pic.find(winPicId);
    losePic = Pic.find(losePicId);
    
    record(winPic, losePic);
#    puts winPic;
#    puts losePic;
  end

  def record(winPic, losePic)
    #winPic.scores = winPic.scores + 1;
    winExpectation = getExpectation(winPic.scores, losePic.scores, 1);
    puts 'winExpectation:'+winExpectation.to_s;
    winPic_scores = getNewScores(winPic.scores, winExpectation, 1);
    puts 'win_s:' + winPic_scores.to_s;
   
 
    #losePic.scores = losePic.scores - 1;
    loseExpectation = getExpectation(winPic.scores, losePic.scores, -1);
    puts 'loseExpectation:' + loseExpectation.to_s;
    losePic_scores = getNewScores(losePic.scores, loseExpectation, 0);
    puts 'lose_s:' + losePic_scores.to_s;
    
    winPic.scores = winPic_scores
    winPic.wins = winPic.wins + 1;
    if !winPic.save
      puts 'winPic.save exception'
      #throw Exception("update ex");
    end
    
    losePic.scores = losePic_scores;
    losePic.losses = losePic.losses + 1; 
    if !losePic.save
      puts 'losePic.save exception'
      #throw Exception("update ex");
    end
  end
  

  ## 计分 - 获取期望值 
  def getExpectation(winScores,loseScores,flag)
   return 1 / (1 + 10 ** ((loseScores - winScores) * flag / 400.to_f));
  end
  
  ## 计分 - 获取本次PK分值
  def getNewScores(oldScores,expectation,sa )
    return oldScores + 16.to_f * ( sa - expectation);
  end
  
  #获取picked的pic数据
  def self.getPickProgress
    
    #pick百分比
     Pic.count(:all, :conditions =>["wins > 0 or losses > 0"] );
    
  end
  
  #获取pic总数
  def self.allPicSum
    Pic.count(:all);
  end

end