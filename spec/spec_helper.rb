require('rspec')
require('pg')
require('sinatra/activerecord')
require('survey')
require('question')

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
    Question.all().each() do |question|
      question.destroy()
    end
  end
end

def create_survey
  Survey.create({:title => "Health Insurance!"})
end

def create_question
  Question.create({:question => "Why does health insurance suck in America?"})
end
