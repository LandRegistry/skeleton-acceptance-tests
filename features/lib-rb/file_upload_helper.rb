# frozen_string_literal: true

def single_upload_file
  File.join(File.dirname(__FILE__), '/sample_files/file1.txt')
end

def two_upload_files
  [File.join(File.dirname(__FILE__), '/sample_files/file1.txt'),
   File.join(File.dirname(__FILE__), '/sample_files/file2.txt')]
end

def readable_filename(file)
  file.split('/').last
end
