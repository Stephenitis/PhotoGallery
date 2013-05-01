require 'tempfile'

get '/' do
  # Look in app/views/index.erb
  erb :upload
end

get '/upload' do
  erb :upload
end


# post '/upload' do
#   p params
#   # p file1 = params[:file][:tempfile][0]
#   # p "tempfile2 "
#   # p file2 = params[:file][:tempfile][1]
#   # File.open(File.join(Dir.pwd,"public/uploads", "hello"), "wb") { |f| f.write(file1.read) }
#   # puts 'success'
#   # File.open(File.join(Dir.pwd,"public/uploads", "world"), "wb") { |f| f.write(file2.read) }
#   #  puts 'success'
# end


post '/upload' do
  "hello"
  filename = params[:file][:filename]
  tempfile = params[:file][:tempfile]
  @target = "public/uploads/#{filename}"
  Photo.create()
  File.open(@target, 'wb') {|f| f.write tempfile.read }
  @filepath = "/uploads/#{filename}"
  a_photo = Photo.create(filepath: @filepath)
  redirect '/gallery'
end

get '/show' do
  filename = params[:file][:filename]
  erb :show_photo
end

get '/images' do
content_type:json
@gallery = Photo.all.map {|x| x.filepath}
p @gallery.to_json
end

get '/gallery' do
  erb :gallery
end