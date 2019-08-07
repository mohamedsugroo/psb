module Api::V2::Modules::Consumer
    def self.start
        return create
    end

    def self.create
        "#{self} Transaction running . . ."
    end
end