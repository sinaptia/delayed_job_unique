# Delayed Job Uniq

Delayed Job Uniq is a Ruby gem that provides an extension to `delayed_job_active_record` for handling unique jobs in the queue.

## Installation

```bash
$ bundle add delayed_job_unique
```
Or add the following line to your application's Gemfile:

```ruby
gem 'delayed_job_unique'
```

And then execute:

```bash
$ bundle install
```

## Usage

The gem provides a `Delayed::Job::enqueue_once` class method which will use the `unique_key` of your job to check for other **not failed** jobs enqueued under the same key.
This provides a simple yet flexible mechanism to finely control the concurrency on each Job class.

If the job was already enqueued it will return `false`, otherwise it will return the enqueued job instance.

## Example

```ruby
class MyUniqueJob
  def perform
    # Your job logic here
  end

  def unique_key
    # Return a unique key for the job (String)
  end
end

# Enqueue the job only if it's not already in the queue
if Delayed::Job.enqueue_once(MyUniqueJob.new)
  # job enqueued
else
  # job was already enqueued 
end
```

## Development

```bash
git clone https://github.com/sinaptia/delayed_job_unique.git
cd delayed_job_uniq
bundle install
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Create a new Pull Request
