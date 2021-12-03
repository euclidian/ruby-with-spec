ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    reconnect: true,
    database: ENV['RACK_ENV'] == 'test' ? ENV['DATABASE_TEST_NAME'] : ENV['DATABASE_NAME'],
    username: ENV['DATABASE_USERNAME'],
    password: ENV['DATABASE_PASSWORD'],
    host: ENV['DATABASE_HOST'],
    port: ENV['DATABASE_PORT'],
    pool: ENV['DATABASE_POOL'].to_i,
    timeout: ENV['DATABASE_CONNECTION_TIMEOUT'].to_i
  )