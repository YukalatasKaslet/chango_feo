post '/new_survey_answered/:id' do 
  params[:survey].each do |key, value|
    id = key.to_i
    question = Question.find(id)
    question.choices
  end

  redirect to ('/')
end