# frozen_string_literal: true

# Создание категорий
backend_category, frontend_category, devops_category, management_category, _hr_category =
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
ruby_test, java_test =
  backend_category.tests.create!([
                                   { title: 'Ruby', level: 1, author: ivanov_user },
                                   { title: 'Java', level: 2, author: petrov_user }
                                 ])
angular_test, bulma_test =
  frontend_category.tests.create!([
                                    { title: 'Angular', level: 3, author: sidorov_user },
                                    { title: 'Bulma', level: 1, author: ivanov_user }
                                  ])
kubernetis_test, gitlab_test =
  devops_category.tests.create!([
                                  { title: 'Kubernetis', level: 2,
                                    author: petrov_user },
                                  { title: 'Gitlab', level: 3,
                                    author: sidorov_user }
                                ])
jira_test = management_category.tests.create!(
  { title: 'Jira', level: 4, author: ivanov_user }
)

# Создание вопросов
q_ruby_data_types, q_ruby_class_define =
  ruby_test.questions.create!([
                                { title: 'Типы данных в Ruby',
                                  body: 'Какой из перечисленных вариантов верный?' },
                                { title: 'Определение класса',
                                  body: 'Какой из перечисленных вариантов верный?' }
                              ])
q_jira_my_tasks, _q_jira_team_tasks =
  jira_test.questions.create!([
                                { title: 'Как посмотреть список своих задач?',
                                  body: 'Какой из перечисленных вариантов верный?' },
                                { title: 'Как посмотреть список задач команды?',
                                  body: 'Какой из перечисленных вариантов верный?' }
                              ])
q_kuber_pods_quantity, q_kuber_pod_exec =
  kubernetis_test.questions.create!([
                                      {
                                        title: 'Как увеличить количество подов?',
                                        body: 'Какой из перечисленных вариантов верный?'
                                      },
                                      {
                                        title: 'Как войти в консоль нужного пода?',
                                        body: 'Какой из перечисленных вариантов верный?'
                                      }
                                    ])

# Создание ответов
q_ruby_data_types.answers.create!([
                                    { body: 'String, Integer, Nil', correct: true },
                                    { body: 'String, Integer, Boolean', correct: false }
                                  ])
q_ruby_class_define.answers.create!([
                                      { body: 'Определение Класса', correct: true },
                                      { body: 'Ничего не делать', correct: false }
                                    ])
q_jira_my_tasks.answers.create!([
                                  { body: 'Воспользоваться фильтром', correct: true },
                                  { body: 'Спросить у коллег', correct: false }
                                ])
q_kuber_pods_quantity.answers.create!([
                                        { body: 'Зайти в раздел deplyments', correct: true },
                                        { body: 'Считать вручную', correct: false }
                                      ])
q_kuber_pod_exec.answers.create!([
                                   { body: 'Нажать кнопку exec', correct: true },
                                   { body: 'Нельзя заходить в Pod, это опасно', correct: false }
                                 ])

# Создание прохождений тестов
ivanov_user.test_passings.create!([
                                    { passing_status: 'passed',      test: ruby_test },
                                    { passing_status: 'in_progress', test: java_test },
                                    { passing_status: 'passed',      test: angular_test }
                                  ])
petrov_user.test_passings.create!([
                                    { passing_status: 'passed',      test: kubernetis_test },
                                    { passing_status: 'in_progress', test: bulma_test },
                                    { passing_status: 'in_progress', test: gitlab_test }
                                  ])
sidorov_user.test_passings.create!([
                                     { passing_status: 'passed', test: jira_test },
                                     { passing_status: 'in_progress', test: ruby_test },
                                     { passing_status: 'passed',      test: java_test }
                                   ])
