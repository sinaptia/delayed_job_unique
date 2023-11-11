require "delayed_job_uniq/version"
require "delayed_job_uniq/unique_job"

ActiveSupport.on_load(:active_record) do
  require "delayed_job_uniq/active_record_extension"
end
