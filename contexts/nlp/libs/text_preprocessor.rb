# frozen_string_literal: true

module NLP
  module Libs
    class TextPreprocessor
      def initialize(text)
        @text = text
      end

      def call
        text.downcase.split
      end
    end
  end
end
