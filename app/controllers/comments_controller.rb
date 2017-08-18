class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
    
        if @comment.save
          respond_to do |format|
            format.js
          end
        else
        end
    end
    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
          respond_to do |format|
            format.js
          end
        end
    end
    
    def update
        @comment =Comment.find(params[:id])
        @post = Post.find(@comment.post_id)
        if @comment.update(comment_params)
            respond_to do |format|
                format.js
            end
        end
        
    end
    def edit
        @comment =Comment.find(params[:id])
        respond_to do |format|
            format.js
        end
        
    end


     private
     
     def comment_params
        params.require(:comment).permit(:comment, :font_name, :user_email, :user_id)
     end
  

end
