#CREATE
post '/new_answer/:question_id' do
  answer = Answer.new(params[:answer])
  question_parent = Question.find(params[:question_id])
  user = User.find(current_user.id )
  if answer && question_parent && user
    if answer.save
      answer.update(question_id: question_parent.id)
      question_parent.answers << answer
      redirect to("/question/#{question_parent.id}")
    end
  else
    redirect to('/Error')
  end
end

#READ
get '/answer/:id' do
  @answer = Answer.find(params[:id])
  if @answer != nil
    erb :'answer/answer'
  else
    redirect to('/Error')
  end
end

#UPDATE
get '/answer/:id/edit' do
  @answer = Answer.find(params[:id]) 
  erb :'answer/_edit'
end

put '/answer/:id' do
  answer = Answer.find(params[:id])
  if answer != nil
    answer.update(params[:answer])
    question_id = answer.questions[0].id
    redirect to("/question/#{question_id}")
  else
    redirect to ('/Error')
  end
end

#DELETE
delete '/answer/:id' do
  answer = Answer.find(params[:id])
  question_id = answer.questions[0].id
  answer.destroy
  redirect to ("/question/#{question_id}")
end