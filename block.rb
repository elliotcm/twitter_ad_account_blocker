require "pdf/reader"

pdf = PDF::Reader.new(ARGV.first)
text = pdf.pages.map(&:text).join("\n")
handles = text.scan(/@(\w+)/).flatten

require "yaml"
config = YAML.load_file("config.yml")

require "twitter"
twitter_api = Twitter::REST::Client.new(config)

puts twitter_api.users(handles).map(&:id)
