class CreateWelcomePostJob
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user

    post = Post.new(
      title: "Welcome to the Blog!",
      description: "This is your first post. Edit or delete it, then start blogging!"
    )

    if post.save
      Rails.logger.info "Post created successfully with ID: #{post.id} for user ID: #{user.id}"
    else
      Rails.logger.error "Failed to create post for user ID #{user.id}: #{post.errors.full_messages.join(", ")}"
    end
  end
end
