class BuildkiteFailsController < ApplicationController
  FAIL0 = <<~FAILS
    Braze::UserExport::Map when there is an access error sends a notification through the hoster
  FAILS
  FAIL1 = <<~FAILS
    Braze::UserExport::Map email fields can include user_aliases
  FAILS
  FAIL2 = <<~FAILS
    Braze::UserExport::Map email fields can include user_aliases
  FAILS
  FAIL3 = <<~FAILS
  FAILS
  FAIL4 = <<~FAILS
    Braze::UserExport::Map email fields can include user_aliases
    Braze::UserExport::Map when there is an access error sends a notification through the hoster
  FAILS
  FAIL5 = <<~FAILS
    Braze::UserExport::Map email fields can include user_aliases
  FAILS
  FAIL6 = <<~FAILS
  FAILS
  FAIL7 = <<~FAILS
    Braze::UserExport::Map email fields can include user_aliases
  FAILS
  FAIL8 = <<~FAILS
    Braze::UserExport::Map email fields can include user_aliases
    Braze::UserExport::Map when there is an access error sends a notification through the hoster
  FAILS
  FAIL9 = <<~FAILS
  FAILS

  def failure_trends
    client = Buildkit.new(token: ENV["BUILDKITE_TOKEN"])
    organization = client.organization(ENV["BUILDKITE_ORG")

    build_fails = fake_failures
    fails_to_count = build_fails.each_with_object({}) do |failure_log, fails_to_count|
      failure_log.each_line do |l|
        if l.present?
          fails_to_count[l] ||= 0
          fails_to_count[l] += 1
        end
      end
    end

    @failures = fails_to_count.map do |name, count|
      {name: name, percent: (count.to_f / build_fails.length * 100).to_i}
    end
    @failures.sort_by! { |f| -f[:percent] }
  end

  def fake_failures
    [FAIL0, FAIL1, FAIL2, FAIL3, FAIL4, FAIL5, FAIL6, FAIL7, FAIL8, FAIL9]
  end
end
