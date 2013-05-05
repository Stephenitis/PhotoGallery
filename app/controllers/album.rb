post "/album/create" do 
  p params
  @album = Album.create(params)

  erb :_album_created
end
