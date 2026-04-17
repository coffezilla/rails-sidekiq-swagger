class Post < ApplicationRecord


    def create_post_welcome

        @post = Post.new(title: "Welcome to the Blog!", content: "This is your first post. Edit or delete it, then start blogging!")
        if @post.save
            Rails.logger.info "Post created successfully with ID: #{@post.id}"
        else
            Rails.logger.error "Failed to create post: #{@post.errors.full_messages.join(", ")}"
        end
    
    end

end
