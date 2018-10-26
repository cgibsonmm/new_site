require "shrine/storage/s3"
s3_options = {
  bucket:            Rails.application.credentials.aws[:bucket],
  access_key_id:     Rails.application.credentials.aws[:access_key_id],
  secret_access_key: Rails.application.credentials.aws[:secret_access_key],
  region:            Rails.application.credentials.aws[:region]
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: {acl: "public-read"}, **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", upload_options: {acl: "public-read"}, **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :direct_upload
Shrine.plugin :restore_cached_data
