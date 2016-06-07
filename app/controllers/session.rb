get '/login' do
  erb :"users/login"
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "YOU DON'T EXIST!"
    erb :"users/login"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
