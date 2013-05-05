get '/upload' do
  erb :upload
end

post '/upload' do

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
  p session
  erb :gallery
end