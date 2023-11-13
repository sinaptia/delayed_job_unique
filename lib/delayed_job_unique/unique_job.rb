require "delayed_job_active_record"

module Delayed
  module UniqueJob
    def enqueue_once(*args)
      job = args.first
      raise "Job `#{job.class}` must respond to `#unique_key`" unless job.respond_to?(:unique_key)
      Delayed::Job.transaction do
        if job_already_enqueued?(job)
          Delayed::Worker.logger.error "Job with key: #{job.unique_key} it's already on queue"
          false
        else
          Delayed::Job.enqueue(job, key: job.unique_key)
        end
      end
    end

    private

    def job_already_enqueued?(job)
      # failed_at not nil means DJ doesnt retry the job again
      # https://github.com/collectiveidea/delayed_job_active_record/blob/c7e7ceb10b7a50cf4de4e485fdef4581ad2c37e1/lib/delayed/backend/active_record.rb#L57
      Delayed::Job.where(failed_at: nil, key: job.unique_key).exists?
    end
  end
end
