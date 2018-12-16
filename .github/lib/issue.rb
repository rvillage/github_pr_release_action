require "shellwords"

module Issue
  module_function

  def create_comment(url, comment)
    options = <<~OPTIONS.strip
      -X POST -H "Authorization: token ${GIT_PR_RELEASE_TOKEN}" \
      --data #{Shellwords.escape({ body: comment }.to_json)}
    OPTIONS
    run "curl #{options} #{url}/comments"
  end

  def close(url)
    options = <<~OPTIONS.strip
      -X PATCH -H "Authorization: token ${GIT_PR_RELEASE_TOKEN}" \
      --data #{Shellwords.escape({ state: "closed" }.to_json)}
    OPTIONS
    run "curl #{options} #{url}"
  end
end
