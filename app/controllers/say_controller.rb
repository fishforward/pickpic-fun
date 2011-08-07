class SayController < ApplicationController
  
  def hello
    @kaoa  = 'fish';
    @time = Time.now
  end
  
  def doSH    
  end
end
