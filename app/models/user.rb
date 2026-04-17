class User < ApplicationRecord

    before_destroy :log_user_deletion
    before_create :log_user_creation
    after_create_commit :enqueue_welcome_jobs

    private

    def enqueue_welcome_jobs
        CreateWelcomePostJob.perform_async(id)
        SendWelcomeEmailJob.perform_async(id)
    end

    def log_user_deletion
        Rails.logger.info "User with ID #{id} and email #{email} is being deleted."
    end

    def log_user_creation
        Rails.logger.info "User with email #{email} is being created."
    end

end
