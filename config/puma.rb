workers_count = Integer(ENV["PUMA_WORKERS"] || 2)
threads_count = Integer(ENV["PUMA_THREADS"] || 5)

workers workers_count
threads threads_count, threads_count

rackup      DefaultRackup
port        ENV["PORT"]
environment ENV["RACK_ENV"]

preload_app!
