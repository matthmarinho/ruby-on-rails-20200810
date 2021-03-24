class ProcessJson
    def initialize(params)
        @file = params["file"]
    end

    def process
        file = URI::Data.new(@file)
        json_file = JSON.parse(file.data)
        json_file.each do |word|
            Resque.enqueue(SaveProduct, word)
        end
    end
end