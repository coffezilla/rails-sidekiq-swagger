class WelcomeWork

    include Sidekiq::Worker

    def perform()
        User.create_first_post
    end


end