post "/album/create" do 
  p params
  @album = Album.create(params[:album])
  p params[:file]
  @album.photo = params[:file]
  p @album.photo.url
  puts "hello"
end
