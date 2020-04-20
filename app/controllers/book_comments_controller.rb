class BookCommentsController < ApplicationController
    def create
        @book = Book.find(params[:book_id])
        @book_comment = current_user.book_comments.new(book_comment_params)
        @book_comment.book_id = @book.id
        if @book_comment.save
           redirect_to book_path(@book),notice: "successfully created comment!"
        else
            @newbook = Book.new
            render 'books/show'
        end
    end

    def destroy
        @book_comment = BookComment.find(params[:id])
        @book_comment.destroy
        book = Book.find(params[:book_id])
        redirect_to book_path(book)
    end

    private
    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end
end
