module ApplicationHelper

    def options_for_public
        Constants.options_for_public
    end


    def hello(name)
        "こんにちは #{name}さん"
    end

end
