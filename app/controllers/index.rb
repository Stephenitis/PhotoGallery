get '/' do
  # Look in app/views/index.erb
  erb :upload
end

get '/upload' do
  erb :upload
end


post '/upload' do
  filename = params[:file][:filename]
  tempfile = params[:file][:tempfile]
  @target = "public/uploads/#{filename}"

  File.open(@target, 'wb') {|f| f.write tempfile.read }
  @target = "/uploads/#{filename}"
  erb :show_photo
end

get '/show' do
  filename = params[:file][:filename]
  erb :show_photo
end