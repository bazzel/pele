include FactoryBot::Syntax::Methods if defined?(FactoryBot)

Song.destroy_all
create_list(:song, 50)
