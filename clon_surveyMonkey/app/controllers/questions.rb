#CREATE
get '/new_question/:survey_id'do
  @survey = Survey.find(params[:survey_id])
  if @survey
    erb :'question/new'
  else
    redirect to('/Error')
  end
end

post '/new_question/:survey_id' do
  question = Question.create(params[:question])
  survey = Survey.find(params[:survey_id])
  if survey && question
    survey.questions << question
    redirect to("/question/#{question.id}")
  else
    redirect to('/Error')
  end
end

#READ
get '/question/:id' do
  @question = Question.find(params[:id])
  answers  = @question.answers
  if @question != nil
    if answers != nil
      @answers = answers
    end
      erb :'question/question'
  else
    redirect to('/Error')
  end
end

#UPDATE
get '/question/:id/edit' do
  @question = Question.find(params[:id]) 
  erb :'question/_edit'
end

put '/question/:id' do
  question = Question.find(params[:id])
  if question != nil
    question.update(params[:question])
    redirect to("/question/#{question.id}")
  else
    redirect to ('/Error')
  end
end

#DELETE
delete '/question/:id' do
  question = Question.find(params[:id])
  question.destroy
  redirect to ("/users/#{current_user.id}")
end