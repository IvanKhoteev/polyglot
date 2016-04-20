module Words
  class Create < ActiveInteraction::Base
    hash :wordset do
      string :word
      hash :ru do
        string :present_i
        string :present_you
        string :present_we
        string :present_they
        string :present_he
        string :present_she
        string :past_i
        string :past_you
        string :past_we
        string :past_they
        string :past_he
        string :past_she
        string :future_i
        string :future_you
        string :future_we
        string :future_they
        string :future_he
        string :future_she
      end
      hash :en do
        string :common
        string :specific_present_statement
        string :specific_past_statement
      end
    end

    def execute
      word = Word.create(word: wordset['word'])
      Phrases::Create.run word: word, ru: wordset['ru'], en: wordset['en']
    end
  end
end
