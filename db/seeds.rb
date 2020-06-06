return unless Rails.env.development?

include FactoryBot::Syntax::Methods if defined?(FactoryBot)
Faker::Config.locale = 'nl'

Group.destroy_all
User.destroy_all
Song.destroy_all
Songwriter.destroy_all

songwriters = create_list(:songwriter, 25)
songs =
  200.times.reduce([]) do |arr, _i|
    arr << create(:song, songwriter: songwriters.sample)
  end
students = create_list(:user, 50, :student)
student = create(:user, :student, email: 'student@mail.com', name: nil)
teachers = create_list(:user, 5, :teacher)
teacher = create(:user, :teacher, email: 'teacher@mail.com')
create(:user, :admin, email: 'admin@mail.com')

10.times do
  create(:group, teacher: teachers.sample) do |g|
    5.times { g.students << students.sample }
    10.times { g.lessons.create(song: songs.sample) }
  end
  create(:group, teacher: teacher) do |g|
    5.times { g.students << students.sample }
    g.students << student
    10.times { g.lessons.create(song: songs.sample) }
  end
end
