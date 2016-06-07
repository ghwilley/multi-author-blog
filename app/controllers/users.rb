get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = "WTF BRUH?!"
    erb :"users/new"
  end
end

get '/users/:user_id' do
  if logged_in?
    @user = User.find_by(id: params[:user_id])
    erb :"users/show"
  else
    redirect '/'
  end
end
