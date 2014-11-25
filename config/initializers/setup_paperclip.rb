Paperclip::Attachment.default_options.merge!({
 storage: :s3,
 s3_credentials: {
   access_key_id: ENV['katie@resilientapp.com'],
   secret_access_key: ENV['developeR2014'],
   bucket:        'resilient-bucket'
 }
});