module Phrases
  class Create < ActiveInteraction::Base
    object :word
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
    array :interrogatives, default: nil

    def execute
      create_statements_phrases
      create_negatives_phrases
      create_questions_phrases
    end

    private

    def create_statements_phrases
      Phrases::Statements::Create.run data
    end

    def create_negatives_phrases
      Phrases::Negatives::Create.run data
    end

    def create_questions_phrases
      Phrases::Questions::Create.run data
    end

    def data
      { word: word, en: en, ru: ru, interrogatives: interrogatives }
    end
  end
end
