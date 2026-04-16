class User < ApplicationRecord

    before_destroy :log_user_deletion
    before_create :log_user_creation

    private

    def log_user_deletion
        Rails.logger.info "User with ID #{self.id} and email #{self.email} is being deleted."
    end

    def log_user_creation
        Rails.logger.info "User with email #{self.email} is being created."
    end

end
