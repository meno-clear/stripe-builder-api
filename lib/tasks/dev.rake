namespace :dev do
  desc "Config development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Erasing BD...") { %x(rails db:drop) }
      show_spinner("Create BD...") { %x(rails db:create) }
      show_spinner("Migrating BD...") { %x(rails db:migrate) }
      show_spinner("Seeding BD...") { %x(rails db:seed) }
    else
      puts "You are not in development environment!"
    end
  end
  def show_spinner(msg_start, msg_end = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end