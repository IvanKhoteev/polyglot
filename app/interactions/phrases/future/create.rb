module Phrases
  module Future
    class Create < Phrases::Create
      def execute
        create_statement
        create_question
        create_negative
      end

      private

      def create_statement
        Phrases::Future::Statements::Create.run word: word, ru: ru, en: en
      end

      def create_question
        Phrases::Future::Questions::Create.run word: word, ru: ru, en: en
      end

      def create_negative
        Phrases::Future::Negatives::Create.run word: word, ru: ru, en: en
      end
    end
  end
end
