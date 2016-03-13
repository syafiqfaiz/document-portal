class AwsResourceService

  def initialize
    @aws_resource = Aws::S3::Resource::new
  end

  def create_expired_link(document)
    @aws_resource.bucket(ENV['fog_directory'])
      .object(document.file.path)
      .presigned_url(:get, expires_in: 1.minutes)
  end


end
