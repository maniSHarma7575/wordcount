require 'pathname'
require_relative 'command'

module WordCounts
  class Executor
    attr_reader :options, :files_path

    def initialize(options:, files_path:)
      @options = options.empty? ? %w[c l w] : options
      @files_path = files_path
    end

    def run_command
      command_output = initialize_command_output_hash
    
      absolute_paths.each_with_index do |path, index|
        if path
          command = WordCounts::Command.new(path)
          options.each do |option|
            result = command.send(task_to_execute(option))
            update_command_output(command_output, index, path, option, result)
          end
        else
          update_command_output(command_output, index, path)
        end
      end
    
      generate_output_string(command_output)
    end
    
    private
    
    def initialize_command_output_hash
      command_output = Hash.new { |h, k| h[k] = {} }
      command_output['total'] = Hash.new(0)
      command_output
    end
    
    def update_command_output(command_output, index, path, option = nil, result = nil)
      file_path = files_path[index]
      command_output[file_path]['file_exists'] = path if path
      return unless option
    
      command_output[file_path][option] = result || 0
      command_output['total'][option] += result || 0
    end
    
    def generate_output_string(command_output)
      output_string = ""
      files_path.each do |file_path|
        if !command_output[file_path]['file_exists']
          output_string += "wordcount: #{file_path}: open: No such file or directory\n"
        else
          options.each do |option|
            output_string += "    #{command_output[file_path][option]}"
          end
          output_string += " #{file_path} \n"
        end
      end
    
      options.each do |option|
        output_string += "    #{command_output['total'][option]}"
      end
    
      output_string += " total"
      output_string
    end

    def task_to_execute(option)
      case option
      when 'L'
        :max_length_line
      when 'l'
        :no_of_lines
      when 'm'
        :no_of_characters
      when 'c'
        :no_of_bytes
      when 'w'
        :no_of_words
      end
    end

    def absolute_paths
      paths = []
      files_path.each do |file_path|
        paths << resolve_file_path(file_path)
      end
      paths
    end

    def resolve_file_path(file_path)
      Pathname.new(file_path).realpath
    rescue
      false
    end
  end
end