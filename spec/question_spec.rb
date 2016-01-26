require ('spec_helper')

describe(Question) do
  describe('#question') do
    it('will return information when inputted') do
      question = create_question
      expect(question.question()).to(eq('Why does health insurance suck in America?'))
    end
  end
end
