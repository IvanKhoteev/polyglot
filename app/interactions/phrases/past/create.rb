module Phrases
  module Past
    class Create < Phrases::Create
      def execute
        create_statement
        create_question
        create_negative
      end

      private

      def create_statement
        Phrases::Past::Statements::Create.run word: word, ru: ru, en: en
      end

      def create_question
        Phrases::Past::Questions::Create.run word: word, ru: ru, en: en
      end

      def create_negative
        Phrases::Past::Negatives::Create.run word: word, ru: ru, en: en
      end
    end
  end
end
