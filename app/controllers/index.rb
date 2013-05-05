require 'tempfile'

get '/' do
  erb :gallery
end

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


#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end


