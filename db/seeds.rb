# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Создание категорий
backend_category, frontend_category, devops_category, management_category, hr_category =
  Category.create!([
                     { title: 'Backend' },
                     { title: 'Frontend' },
                     { title: 'Devops' },
                     { title: 'Management' },
                     { title: 'HR' }
                   ])

# Создание пользователей
ivanov_user, petrov_user, sidorov_user =
  User.create!([
                 { first_name: 'Иван', last_name: 'Иванов', email: 'ivanov@some-yandex.ru', login: 'ivanov' },
                 { first_name: 'Петр', last_name: 'Петров', email: 'petrov@some-google.com', login: 'petrov' },
                 { first_name: 'Максим', last_name: 'Сидоров', email: 'sidorov@some-mail.ru', login: 'sidorov' }
               ])

# Создание тестов
ruby_test, java_test, angular_test, bulma_test, kubernetis_test, gitlab_test, jira_test =
  Test.create!([
                 { title: 'Ruby', level: 1, category_id: backend_category.id, author_id: ivanov_user.id },
                 { title: 'Java', level: 2, category_id: backend_category.id, author_id: petrov_user.id },
                 { title: 'Angular', level: 3, category_id: frontend_category.id, author_id: sidorov_user.id },
                 { title: 'Bulma', level: 1, category_id: frontend_category.id, author_id: ivanov_user.id },
                 { title: 'Kubernetis', level: 2, category_id: devops_category.id, author_id: petrov_user.id },
                 { title: 'Gitlab', level: 3, category_id: devops_category.id, author_id: sidorov_user.id },
                 { title: 'Jira', level: 4, category_id: management_category.id, author_id: ivanov_user.id }
               ])

# Создание вопросов
q_ruby_data_types, q_ruby_class_define, q_jira_my_tasks, q_jira_team_tasks, q_kuber_pods_quantity, q_kuber_pod_exec =
  Question.create!([
                     { title: 'Типы данных в Ruby', body: 'Какой из перечисленных вариантов верный?',
                       test_id: ruby_test.id },
                     { title: 'Определение класса', body: 'Какой из перечисленных вариантов верный?',
                       test_id: ruby_test.id },
                     { title: 'Как посмотреть список своих задач?', body: 'Какой из перечисленных вариантов верный?',
                       test_id: jira_test.id },
                     { title: 'Как посмотреть список задач команды?', body: 'Какой из перечисленных вариантов верный?',
                       test_id: jira_test.id },
                     { title: 'Как увеличить количество подов?', body: 'Какой из перечисленных вариантов верный?',
                       test_id: kubernetis_test.id },
                     { title: 'Как войти в консоль нужного пода?', body: 'Какой из перечисленных вариантов верный?',
                       test_id: kubernetis_test.id }
                   ])

# Создание ответов
Answer.create!([
                 { body: 'String, Integer, Nil', correct: true, question_id: q_ruby_data_types.id },
                 { body: 'String, Integer, Boolean', correct: false, question_id: q_ruby_data_types.id },
                 { body: 'Определение Класса', correct: true, question_id: q_ruby_class_define.id },
                 { body: 'Ничего не делать', correct: false, question_id: q_ruby_class_define.id },
                 { body: 'Воспользоваться фильтром', correct: true, question_id: q_jira_my_tasks.id },
                 { body: 'Спросить у коллег', correct: false, question_id: q_jira_my_tasks.id },
                 { body: 'Воспользоваться общим фильтром', correct: true, question_id: q_jira_team_tasks.id },
                 { body: 'Спросить на стендапе', correct: false, question_id: q_jira_team_tasks.id },
                 { body: 'Зайти в раздел deplyments', correct: true, question_id: q_kuber_pods_quantity.id },
                 { body: 'Считать вручную', correct: false, question_id: q_kuber_pods_quantity.id },
                 { body: 'Нажать кнопку exec', correct: true, question_id: q_kuber_pod_exec.id },
                 { body: 'Нельзя заходить в Pod, это опасно', correct: false, question_id: q_kuber_pod_exec.id }
               ])

# Создание прохождений тестов
TestPassing.create!([
                      { passing_status: 'passed',      user_id: ivanov_user.id, test_id: ruby_test.id },
                      { passing_status: 'in_progress', user_id: ivanov_user.id,  test_id: java_test.id },
                      { passing_status: 'passed',      user_id: ivanov_user.id,  test_id: angular_test.id },
                      { passing_status: 'in_progress', user_id: petrov_user.id,  test_id: bulma_test.id },
                      { passing_status: 'passed',      user_id: petrov_user.id,  test_id: kubernetis_test.id },
                      { passing_status: 'in_progress', user_id: petrov_user.id,  test_id: gitlab_test.id },
                      { passing_status: 'passed',      user_id: sidorov_user.id, test_id: jira_test.id },
                      { passing_status: 'in_progress', user_id: sidorov_user.id, test_id: ruby_test.id },
                      { passing_status: 'passed',      user_id: sidorov_user.id, test_id: java_test.id }
                    ])

binding.pry
