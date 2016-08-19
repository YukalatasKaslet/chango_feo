get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @surveys = []
  @surveys_user = []
  surveys = Survey.all
  if current_user
    surveys.each do |survey|
      if survey.user.id == current_user.id
        @surveys_user << survey
      else
        @surveys << survey
      end
    end 
  end
  erb :index
end
