class DirectUploadsController < ActiveStorage::DirectUploadsController
  skip_before_action :verify_authenticity_token

  def create
    blob = ActiveStorage::Blob.create_before_direct_upload!(
      filename: blob_args[:filename],
      content_type: blob_args[:content_type],
      byte_size: blob_args[:byte_size],
      checksum: blob_args[:checksum]
    )
    render json: direct_upload_json(blob)
  end

  private

  def direct_upload_json(blob)
    blob.as_json(root: false, methods: :signed_id).merge(service_url: url_for(blob)).merge(
      direct_upload: { url: blob.service_url_for_direct_upload, headers: blob.service_headers_for_direct_upload }
    )
  end
end