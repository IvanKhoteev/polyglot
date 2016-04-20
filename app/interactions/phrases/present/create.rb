module Phrases
  module Present
    class Create < Phrases::Create
      def execute
        create_statement
        create_question
        create_negative
      end

      private

      def create_statement
        Phrases::Present::Statements::Create.run word: word, ru: ru, en: en
      end

      def create_question
        Phrases::Present::Questions::Create.run word: word, ru: ru, en: en
      end

      def create_negative
        Phrases::Present::Negatives::Create.run word: word, ru: ru, en: en
      end
    end
  end
end
