#CREATE
get '/new_survey' do
  erb :'survey/new'
end
post '/new_survey/:user_id' do
  survey = Survey.create(params[:survey])
  user = User.find(params[:user_id])
  if user && survey
    user.surveys << survey
    redirect to("/users/#{current_user.id}")
  else
    redirect to('/Error')
  end
end

#READ
get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions  = @survey.questions
  if @survey != nil
    erb :'survey/_survey'
  else
    redirect to('/Error')
  end
end

#UPDATE
get '/survey/:id/edit' do
  @survey = Survey.find(params[:id]) 
  erb :'survey/_edit'
end

put '/survey/:id' do
  survey = Survey.find(params[:id])
  if survey != nil
    survey.update(params[:survey])
    redirect to("/survey/#{survey.id}")
  else
    redirect to ('/Error')
  end
end

#DELETE
delete '/survey/:id' do
  survey = Survey.find(params[:id])
  survey.destroy
  redirect to ("/user/#{current_user.id}")
end