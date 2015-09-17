# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

begin
  # This code is in a begin/rescue block so that the Rakefile is usable
  # in an environment where RSpec is unavailable (i.e. production).

  require 'rspec/rails'
  require 'rspec/core/rake_task'

  namespace :spec do
    [:unit, :integration].each do |type|
      RSpec::Core::RakeTask.new(type) do |spec|
        spec.pattern = FileList['spec/**/*_spec.rb']
        spec.pattern += FileList['spec/*_spec.rb']
        spec.rspec_opts = ['--backtrace'] if ENV['CI']
        RSpec.configure do |c|
          c.filter_run_including type: type
        end
      end
    end
  end
  RSpec::Core::RakeTask.new(:rcov) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
    spec.pattern += FileList['spec/*_spec.rb']
    spec.rcov = true
  end

rescue LoadError => e
  puts "[Warning] Exception creating rspec rake tasks.  " +
  "This message can be ignored in environments that intentionally" +
  " do not pull in the RSpec gem (i.e. production)."
  puts e
end

task :ci => ['jetty:clean', 'spec:unit', 'spec:integration']

task :spec => ['spec:unit']

task :default => [:ci]