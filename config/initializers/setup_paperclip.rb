Paperclip::Attachment.default_options.merge!({
 storage: :s3,
 s3_credentials: {
   access_key_id: 'AKIAIQU6LKXE737EURCQ',
   secret_access_key: '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',
   bucket:        'resilient-bucket'
 }
});