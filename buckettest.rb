require 'aws-sdk-s3'
require 'csv'
load "./local_ENV.rb" if File.exist?('./local_ENV.rb')
arr = []
def bucket_read
    bucket = ENV['S3_BUCKET']
    region = ENV['S3_Region']
    s3 = Aws::S3::Client.new(region: region, access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'])
    response = s3.get_object(bucket: bucket, key: ENV['S3_FILE'])
    file = CSV.parse(response.body)
    return file
end
def bucket_write(newboy)
    bucket = ENV['S3_BUCKET']
    region = ENV['S3_Region']
    s3 = Aws::S3::Client.new(region: region, access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'])
    response = s3.get_object(bucket: bucket, key: ENV['S3_File'])
    file = CSV.parse(response.body)
    file << newboy
    CSV.open("result.csv", 'wb') do |csv|
        file.each do |v|
            csv << v
        end
    end
    s3 = Aws::S3::Resource.new(region: region, access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'])
    file1 = 'result.csv'
    (s3.bucket(bucket).object(file1)).upload_file(file1)
end