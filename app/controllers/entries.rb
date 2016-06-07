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

get '/users/:user_id/entries/:entry_id' do
  @entry = Entry.find(params[:entry_id])
  @user = current_user
  erb :"entries/edit"
end

put '/users/:user_id/entries/:entry_id' do
  @entry = Entry.find(params[:entry_id])
  @user = current_user
  if @entry.update_attributes(params[:entry])
    redirect '/'
  else
    erb :"entries/edit"
  end
end

delete '/users/:user_id/entries/:entry_id' do
  @entry = Entry.find(params[:entry_id])
  @entry.destroy
  redirect '/'
end
