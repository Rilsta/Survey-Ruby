require ('spec_helper')

describe(Survey) do
  describe('#title') do
    it('will return information when inputted') do
      survey = create_survey
      expect(survey.title()).to(eq('Health Insurance!'))
    end
  end
end
