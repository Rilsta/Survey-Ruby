require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('newrelic_rpm')
require('./lib/survey')
require('./lib/question')
require('pg')
require('pry')
also_reload('./lib/**/*.rb')

get('/') do
  @surveys = Survey.all
  erb(:index)
end

get('/surveys/new') do
  erb(:survey_form)
end

post('/surveys') do
  Survey.create(params)
  redirect ('/')
end

get('/surveys/:id/edit') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey_update)
end

patch('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.update({:title => params.fetch("title")})
  redirect ('/')
end

delete('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.destroy
  redirect ('/')
end

get('/surveys/:id/questions') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:questions)
end

get('/surveys/:id/questions/new') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:question_form)
end

post('/surveys/:survey_id/questions') do
  Question.create(:survey_id => params.fetch("survey_id").to_i, :question => params.fetch("question"))
  redirect ("/surveys/#{params.fetch('survey_id').to_i}/questions")
end

get('/surveys/:survey_id/questions/:id/edit') do
  @question = Question.find(params.fetch("id").to_i)
  erb(:question_update)
end

patch('/surveys/:survey_id/questions/:id') do
  @question = Question.find(params.fetch("id").to_i)
  @question.update(:survey_id => params.fetch("survey_id").to_i, :question => params.fetch("question"))
  redirect ("/surveys/#{params.fetch('survey_id').to_i}/questions")
end

delete('/surveys/:survey_id/questions/:id') do
  @question = Question.find(params.fetch("id").to_i)
  @question.destroy
  redirect ("/surveys/#{params.fetch('survey_id').to_i}/questions")
end
