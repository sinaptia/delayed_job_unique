require "delayed_job_unique/unique_job"

module Delayed
  class Job < ActiveRecord::Base
    extend Delayed::UniqueJob
  end
end
