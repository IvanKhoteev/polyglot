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

    def execute
      create_present_statement_phrases
      create_future_statement_phrases
      create_past_statement_phrases
    end

    private

    def create_present_statement_phrases
      Phrases::Present::Create.run word: word, en: en, ru: ru
    end

    def create_future_statement_phrases
      Phrases::Future::Create.run word: word, en: en, ru: ru
    end

    def create_past_statement_phrases
      Phrases::Past::Create.run word: word, en: en, ru: ru
    end
  end
end
