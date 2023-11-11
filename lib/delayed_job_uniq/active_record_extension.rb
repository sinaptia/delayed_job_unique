require "delayed_job_uniq/unique_job"

module Delayed
  class Job < ActiveRecord::Base
    extend Delayed::UniqueJob
  end
end
