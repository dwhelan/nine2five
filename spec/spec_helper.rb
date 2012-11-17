require 'nine2five'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |c|
  c.color_enabled = true
  c.filter_run :focus => true
  c.filter_run_excluding :vendor => true
  c.run_all_when_everything_filtered = true
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.tty = true # enable color in watchr
end
