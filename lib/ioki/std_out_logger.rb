# frozen_string_literal: true

module Ioki
  class StdOutLogger
    def log(str)
      puts str.encode(Encoding.find('UTF-8'), invalid: :replace, undef: :replace, replace: '')
    end

    alias debug log
    alias info log
    alias warn log
    alias error log
    alias fatal log
    alias unknown log
  end
end
