#CREATE
post '/new_option/:question_id' do
  option = Option.new(params[:option])
  question_parent = Question.find(params[:question_id])
  user = User.find(current_user.id )
  if option && question_parent && user
    if option.save
      #option.update(question_id: question_parent.id)
      question_parent.options << option
      redirect to("/question/#{question_parent.id}")
    end
  else
    redirect to('/Error')
  end
end

#READ
get '/option/:id' do
  @option = Option.find(params[:id])
  if @option != nil
    erb :'option/option'
  else
    redirect to('/Error')
  end
end

#UPDATE
get '/option/:id/edit' do
  @option = Option.find(params[:id]) 
  erb :'option/_edit'
end

put '/option/:id' do
  option = Option.find(params[:id])
  if option != nil
    option.update(params[:option])
    question_id = option.question.id
    redirect to("/question/#{question_id}")
  else
    redirect to ('/Error')
  end
end

#DELETE
delete '/option/:id' do
  option = Option.find(params[:id])
  question_id = option.question.id
  option.destroy
  redirect to ("/question/#{question_id}")
end















#