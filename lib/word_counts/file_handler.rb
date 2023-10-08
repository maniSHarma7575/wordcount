require 'pathname'

module WordCounts
  class FileHandler
    attr_reader :files_path

    def initialize(files_path)
      @files_path = files_path
    end


    def absolute_paths
      files_path.map { |file_path| resolve_file_path(file_path) }
    end

    private

    def resolve_file_path(file_path)
      Pathname.new(file_path).realpath
    rescue
      nil
    end
  end
end