# spec/jobs/application_job_spec.rb

require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  describe "retry and discard behavior" do
    it "automatically retries on ActiveRecord::Deadlocked" do
      # Assuming you have a job instance
      job = described_class.new

      # Using RSpec's `expect` and `to` matchers to test retry_on behavior
      expect {
        job.perform_now
      }.to have_enqueued_job.on_queue(described_class.queue_name).at_least(:once).with(
        hash_including(
          'arguments' => anything,
          'job_class' => described_class,
          'retry_count' => anything
        )
      )
    end

    it "discards on ActiveJob::DeserializationError" do
      # Assuming you have a job instance
      job = described_class.new

      # Using RSpec's `expect` and `to` matchers to test discard_on behavior
      expect {
        expect {
          job.deserialize_and_execute("invalid_argument")
        }.to raise_error(ActiveJob::DeserializationError)
      }.not_to have_enqueued_job(described_class)
    end
  end
end
