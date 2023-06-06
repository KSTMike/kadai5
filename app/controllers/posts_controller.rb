class PostsController < ApplicationController
  def index
		@posts = Post.all
  end

  def new
		@post = Post.new
  end

  def create
		@post = Post.new(post_params)
		if params[:back]
				render :new
		else        
			if @post.save
				redirect_to posts_path, notice: "Tubuyakuuを作成しました！"  
			else
				render :new
			end
		end 
  end

	def show
		params[:id]
		@post = Post.find(params[:id])
	end
    
	def edit
		@post = Post.find(params[:id])
	end

	def confirm
		@post = Post.new(post_params)
		render :new if @post.invalid?
	end 

	def update
		@post = Post.find(params[:id]) # 編集したい投稿のidを取得
		if @post.update(post_params) # その投稿を更新
			redirect_to posts_path, notice: "Tubuyakuuを編集しました！"
		else
			render :edit
		end
	end
    
	def destroy
		@post = Post.destroy(params[:id])
		redirect_to posts_path, notice: "Tubuyakuuを削除しました！"
	end

	def set_post
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end
end
