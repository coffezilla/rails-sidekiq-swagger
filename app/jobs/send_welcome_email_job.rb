class SendWelcomeEmailJob
  include Sidekiq::Worker
  sidekiq_options queue: :mailers

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user

    # Placeholder until a real mailer is implemented.
    Rails.logger.info "Welcome email queued/sent for user ID #{user.id} (#{user.email})"
  end
end
