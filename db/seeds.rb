return unless Rails.env.development?
include FactoryBot::Syntax::Methods if defined?(FactoryBot)

Song.destroy_all
create_list(:song, 50)

Group.destroy_all

User.destroy_all
User.create!(email: 'admin@mail.com', role: User.roles[:admin])
