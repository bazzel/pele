return unless Rails.env.development?

include FactoryBot::Syntax::Methods if defined?(FactoryBot)

Group.destroy_all
User.destroy_all
Song.destroy_all

songs = create_list(:song, 50)
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
