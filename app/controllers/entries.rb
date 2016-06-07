get '/users/:user_id/entries/new' do
  @user = current_user
   erb :"entries/new"
end

post '/users/:user_id/entries' do
  @entry = Entry.new(params[:entry])
  @user = User.new(params[:user])

  @entry.user_id = current_user.id
  if @user && @entry.save
    redirect '/'
  else
    @error = "LEAVE NOTHING BLANK"
    erb :"entries/new"
  end
end

