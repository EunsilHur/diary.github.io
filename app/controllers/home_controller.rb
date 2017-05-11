class HomeController < ApplicationController
  def index
    @qestions_t = Question.all
    @date = Time.now.day
    @month = Time.now.month
    @year = Time.now.year
  end
  def memo_create
    memo = Question.find(params[:p_id]).memos.create(content: params[:content])
    memo.save
    
    
    redirect_to '/'

  end
 
  def like_create
    like =  Memo.find(params[:c_id]).likes.create(like_count: 0)
    like.save
   
    redirect_to '/'
  end
  
  
  def memo_destroy
    memo = Question.find(params[:p_id]).memos.find(params[:c_id])
    memo.destroy
    
    redirect_to '/'
  end
  
  def memo_update
     @one_memo = Question.find(params[:p_id]).memos.find(params[:c_id])
  end
  
  def memo_update_post
    one_memo = Question.find(params[:p_id]).memos.find(params[:c_id])
    one_memo.content = params[:content]
    one_memo.save
    
    redirect_to '/'
  end
  
end
