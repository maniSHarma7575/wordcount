require 'pathname'

module WordCounts
  class FileHandler
    attr_reader :files_paths

    def initialize(files_paths)
      @files_paths = files_paths
    end


    def absolute_paths
      files_paths.map { |file_path| resolve_file_path(file_path) }
    end

    private

    def resolve_file_path(file_path)
      Pathname.new(file_path).realpath
    rescue
      nil
    end
  end
end