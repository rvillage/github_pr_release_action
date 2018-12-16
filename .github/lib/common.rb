require "json"

def run(*command)
  puts "\n===== START #{command} ====="
  system(*command)
end

def event_json
  @event_json ||= JSON.parse(File.read(ENV["GITHUB_EVENT_PATH"]))
end
