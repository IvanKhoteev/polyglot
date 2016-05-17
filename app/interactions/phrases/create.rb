module Phrases
  class Create < ActiveInteraction::Base
    object :word
    hash :ru do
      hash :present_i do
        string :word
        array :pronouns
      end
      hash :present_you do
        string :word
        array :pronouns
      end
      hash :present_we do
        string :word
        array :pronouns
      end
      hash :present_they do
        string :word
        array :pronouns
      end
      hash :present_he do
        string :word
        array :pronouns
      end
      hash :present_she do
        string :word
        array :pronouns
      end
      hash :past_i do
        string :word
        array :pronouns
      end
      hash :past_you do
        string :word
        array :pronouns
      end
      hash :past_we do
        string :word
        array :pronouns
      end
      hash :past_they do
        string :word
        array :pronouns
      end
      hash :past_he do
        string :word
        array :pronouns
      end
      hash :past_she do
        string :word
        array :pronouns
      end
      hash :future_i do
        string :word
        array :pronouns
      end
      hash :future_you do
        string :word
        array :pronouns
      end
      hash :future_we do
        string :word
        array :pronouns
      end
      hash :future_they do
        string :word
        array :pronouns
      end
      hash :future_he do
        string :word
        array :pronouns
      end
      hash :future_she do
        string :word
        array :pronouns
      end
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
