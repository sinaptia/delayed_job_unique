# Delayed Job Uniq

Delayed Job Uniq is a Ruby gem that provides an extension to `delayed_job_active_record` for handling unique jobs in the queue.

## Installation

Add the following lines to your application's Gemfile:

```ruby
gem 'delayed_job_active_record'
gem 'delayed_job_uniq'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install delayed_job_uniq

## Usage
It's just a extension for Delayed Job
You can use the enqueue_once method to add unique jobs to the queue:

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
Delayed::Job.enqueue_once MyUniqueJob.new
```

## Development

```bash
git clone https://github.com/sinaptia/delayed_job_uniq.git
cd delayed_job_uniq
bundle install
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Create a new Pull Request
