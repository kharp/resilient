module Mailchimp
  class AddToMailingList < ActiveRecord::Base

    def self.initialize
      mailchimp_api_key = "cce81c75727b6134410eb22293e0d1a0-us9"
      @mc = Mailchimp::API.new(mailchimp_api_key)
    end

    def self.subscribe(user)
      Mailchimp::AddToMailingList.initialize
      list_id = '4334a5a58c'
      email = user.email

      begin
        @mc.lists.subscribe(list_id, {'email' => email}, nil, 'html', false)
        Rails.logger.debug("#{email} subscribed successfully")
      rescue Mailchimp::ListAlreadySubscribedError
        Rails.logger.debug("#{email} is already subscribed to the list")
      rescue Mailchimp::ListDoesNotExistError
        Rails.logger.debug("The list could not be found")
        return
      rescue Mailchimp::Error => ex
        if ex.message
          puts = ex.message
        else
          Rails.logger.debug("An unknown error occurred")
        end
      end
    end
  end
end