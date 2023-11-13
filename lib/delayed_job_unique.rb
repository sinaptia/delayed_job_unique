require "delayed_job_unique/version"
require "delayed_job_unique/unique_job"

ActiveSupport.on_load(:active_record) do
  require "delayed_job_unique/active_record_extension"
end
