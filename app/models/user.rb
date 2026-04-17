class User < ApplicationRecord

    before_destroy :log_user_deletion
    before_create :log_user_creation

    # after_save :create_first_post
    after_save :create_first_post_async
    
    # Simulate a status update after saving the user
    def create_first_post
        @post = Post.new(title: "Welcome to the Blog!", description: "This is your first post. Edit or delete it, then start blogging!")
        if @post.save
            Rails.logger.info "Post created successfully with ID: #{@post.id}"
        else
            Rails.logger.error "Failed to create post: #{@post.errors.full_messages.join(", ")}"
        end
    end

    # 
    def create_first_post_async
        WelcomeWork.perform_later()
    end

    private

    def log_user_deletion
        Rails.logger.info "User with ID #{self.id} and email #{self.email} is being deleted."
    end

    def log_user_creation
        Rails.logger.info "User with email #{self.email} is being created."
    end

end
