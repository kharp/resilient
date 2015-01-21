desc 'Update Mailchimp Mailing List'
task :update_mailing_list => :environment do
  User.all.each do |user|
    result = Mailchimp::AddToMailingList.subscribe(user)
    puts result
  end
end