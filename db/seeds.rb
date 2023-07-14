# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Создание категорий

categories_attrs = %w[Backend Frontend Devops Management HR]

categories_attrs.each do |attr|
  Category.create(title: attr)
end

backend_category = Category.find_by(title: 'Backend')
frontend_category = Category.find_by(title: 'Frontend')
devops_category = Category.find_by(title: 'Devops')
management_category = Category.find_by(title: 'Management')
hr_category = Category.find_by(title: 'HR')

# Создание пользователей

users_attrs = [
  {first_name: 'Иван', last_name: 'Иванов', email: 'ivanov@some-yandex.ru', login: 'ivanov'},
  {first_name: 'Петр', last_name: 'Петров', email: 'petrov@some-google.com', login: 'petrov'},
  {first_name: 'Максим', last_name: 'Сидоров', email: 'sidorov@some-mail.ru', login: 'sidorov'}
]

users_attrs.each do |attr|
  User.create(attr)
end

ivanov_user = User.find_by(login: 'ivanov')
petrov_user = User.find_by(login: 'petrov')
sidorov_user = User.find_by(login: 'sidorov')

# Создание тестов

tests_attrs = [
  {title: 'Ruby', level: 1, category_id: backend_category.id, author_id: ivanov_user.id},
  {title: 'Java', level: 5, category_id: backend_category.id, author_id: petrov_user.id},
  {title: 'Angular', level: 4, category_id: frontend_category.id, author_id: sidorov_user.id},
  {title: 'Bulma', level: 3, category_id: frontend_category.id, author_id: ivanov_user.id},
  {title: 'Kubernetis', level: 2, category_id: devops_category.id, author_id: petrov_user.id},
  {title: 'Gitlab', level: 7, category_id: devops_category.id, author_id: sidorov_user.id},
  {title: 'Jira', level: 2, category_id: management_category.id, author_id: ivanov_user.id}
]

tests_attrs.each do |attr|
  Test.create(attr)
end

ruby_test = Test.find_by(title: 'Ruby')
java_test = Test.find_by(title: 'Java')
angular_test = Test.find_by(title: 'Angular')
bulma_test = Test.find_by(title: 'Bulma'),
kubernetis_test = Test.find_by(title: 'Kubernetis')
gitlab_test = Test.find_by(title: 'Gitlab')
jira_test = Test.find_by(title: 'Jira')

# Создание вопросов

questions_attrs = [
  {title: 'Типы данных в Ruby', body: 'Какой из перечисленных вариантов верный?', test_id: ruby_test.id},
  {title: 'Определение класса', body: 'Какой из перечисленных вариантов верный?', test_id: ruby_test.id},
  {title: 'Как посмотреть список своих задач?', body: 'Какой из перечисленных вариантов верный?', test_id: jira_test.id},
  {title: 'Как посмотреть список задач команды?', body: 'Какой из перечисленных вариантов верный?', test_id: jira_test.id},
  {title: 'Как увеличить количество подов?', body: 'Какой из перечисленных вариантов верный?', test_id: kubernetis_test.id},
  {title: 'Как войти в консоль нужного пода?', body: 'Какой из перечисленных вариантов верный?', test_id: kubernetis_test.id}
]

q_ruby_data_types = Question.find_by(title: 'Типы данных в Ruby')
q_ruby_class_define = Question.find_by(title: 'Определение класса')
q_jira_my_tasks = Question.find_by(title: 'Как посмотреть список своих задач?')
q_jira_team_tasks = Question.find_by(title: 'Как посмотреть список задач команды?')
q_kuber_pods_quantity = Question.find_by(title: 'Как увеличить количество подов?')
q_kuber_pod_exec = Question.find_by(title: 'Как войти в консоль нужного пода?')


questions_attrs.each do |attr|
  Question.create(attr)
end

# Создание ответов

answers_attrs = [
  {body: 'String, Integer, Nil', correct: true, question_id: q_ruby_data_types.id },
  {body: 'String, Integer, Boolean', correct: false, question_id: q_ruby_data_types.id },
  {body: 'Определение Класса', correct: true, question_id: q_ruby_class_define.id },
  {body: 'Ничего не делать', correct: false, question_id: q_ruby_class_define.id },
  {body: 'Воспользоваться фильтром', correct: true, question_id: q_jira_my_tasks.id},
  {body: 'Спросить у коллег', correct: false, question_id: q_jira_my_tasks.id},
  {body: 'Воспользоваться общим фильтром', correct: true, question_id: q_jira_team_tasks.id},
  {body: 'Спросить на стендапе', correct: false, question_id: q_jira_team_tasks.id},
  {body: 'Зайти в раздел deplyments', correct: true, question_id: q_kuber_pods_quantity.id},
  {body: 'Считать вручную', correct: false, question_id: q_kuber_pods_quantity.id},
  {body: 'Нажать кнопку exec', correct: true, question_id: q_kuber_pod_exec.id},
  {body: 'Нельзя заходить в Pod, это опасно', correct: false, question_id: q_kuber_pod_exec.id},
]

answers_attrs.each do |attr|
  Answer.create(attr)
end

puts "\nData seeding has been successfully comleted"
puts