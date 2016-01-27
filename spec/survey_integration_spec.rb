ENV['RACK_ENV'] = 'test'

require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('survey pathways', {:type => :feature}) do
  it('adds surveys to homepage') do
    visit('/')
    click_link('Add Survey')
    fill_in('title', with: 'Survey test')
    click_button('Submit')
    expect(page).to have_content('Survey Test')
  end
  it('add questions to surveys') do
    survey = create_survey
    visit("/surveys/#{survey.id}/questions")
    click_link('Add Questions')
    fill_in('question', with: 'question test')
    click_button('Submit')
    expect(page).to have_content('question test')
  end
end
