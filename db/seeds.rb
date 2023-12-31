# frozen_string_literal: true

TestPassing.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Badge.destroy_all
Category.destroy_all

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
                 { first_name: 'Иван', last_name: 'Иванов', email: 'ivanov@some-yandex.ru', login: 'ivanov',
                   password: '123456', confirmed_at: Time.current },
                 { first_name: 'Петр', last_name: 'Петров', email: 'petrov@some-google.com', login: 'petrov',
                   password: '123456', confirmed_at: Time.current },
                 { first_name: 'Максим', last_name: 'Сидоров', email: 'sidorov@some-mail.ru', login: 'sidorov',
                   password: '123456', confirmed_at: Time.current }
               ])
# Создание администратора
admin_user =
  Admin.create!({ first_name: 'Admin', last_name: 'Willis', email: 'ak@devpull.ru', login: 'admin',
                  password: 'Jsfi347rfub8', confirmed_at: Time.current })

# Создание тестов
ruby_test, java_test =
  backend_category.tests.create!([
                                   { title: 'Ruby', level: 1, author: ivanov_user, duration_min: 5 },
                                   { title: 'Java', level: 2, author: petrov_user, duration_min: 5 }
                                 ])
angular_test, bulma_test =
  frontend_category.tests.create!([
                                    { title: 'Angular', level: 3, author: sidorov_user, duration_min: 5 },
                                    { title: 'Bulma', level: 1, author: ivanov_user, duration_min: 5 }
                                  ])
kubernetis_test, gitlab_test =
  devops_category.tests.create!([
                                  { title: 'Kubernetis', level: 2,
                                    author: petrov_user, duration_min: 5 },
                                  { title: 'Gitlab', level: 3,
                                    author: sidorov_user, duration_min: 5 }
                                ])
jira_test = management_category.tests.create!(
  { title: 'Jira', level: 4, author: ivanov_user, duration_min: 5 }
)

# Создание вопросов
q_ruby_data_types, q_ruby_class_define =
  ruby_test.questions.create!([
                                { title: 'Типы данных в Ruby',
                                  body: 'Какой из перечисленных вариантов верный?' },
                                { title: 'Определение класса',
                                  body: 'Какой из перечисленных вариантов верный?' }
                              ])
_q_java_data_types, _q_java_class_define =
  java_test.questions.create!([
                                { title: 'Типы данных в Java',
                                  body: 'Какой из перечисленных вариантов верный?' },
                                { title: 'Определение класса в Java',
                                  body: 'Какой из перечисленных вариантов верный?' }
                              ])

_q_angular_about, _q_angular_work =
  angular_test.questions.create!([
                                   { title: 'Что такое Angular?',
                                     body: 'Какой из перечисленных вариантов верный?' },
                                   { title: 'В каком редакторе IDE можно программировать на Angular?',
                                     body: 'Какой из перечисленных вариантов верный?' }
                                 ])

q_jira_my_tasks, _q_jira_team_tasks =
  jira_test.questions.create!([
                                { title: 'Как посмотреть список своих задач?',
                                  body: 'Какой из перечисленных вариантов верный?' },
                                { title: 'Как посмотреть список задач команды?',
                                  body: 'Какой из перечисленных вариантов верный?' }
                              ])

_q_bulma_about, _q_bulma_history =
  bulma_test.questions.create!([
                                 { title: 'Что такое BULMA?',
                                   body: 'Какой из перечисленных вариантов верный?' },
                                 { title: 'История возникновения Framework?',
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

_q_gitlab_developer, _q_gitlab_about =
  gitlab_test.questions.create!([
                                  {
                                    title: 'Кто создал Gitlab?',
                                    body: 'Какой из перечисленных вариантов верный?'
                                  },
                                  {
                                    title: 'Что такое Gitlab?',
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
                                    { test: ruby_test, current_question: ruby_test.questions.first },
                                    { test: java_test, current_question: java_test.questions.first },
                                    { test: angular_test, current_question: angular_test.questions.first }
                                  ])
petrov_user.test_passings.create!([
                                    { test: kubernetis_test, current_question: kubernetis_test.questions.first },
                                    { test: bulma_test, current_question: bulma_test.questions.first },
                                    { test: gitlab_test, current_question: gitlab_test.questions.first }
                                  ])
sidorov_user.test_passings.create!([
                                     { test: jira_test, current_question: jira_test.questions.first },
                                     { test: ruby_test, current_question: ruby_test.questions.first },
                                     { test: java_test, current_question: java_test.questions.first }
                                   ])

# Создание бейджей
Badge.create!(
  name: 'All tests by Backend category',
  award_type: 'all_tests_by_category_id',
  award_condition: Category.find_by(title: 'Backend').id,
  img_path: 'badges/category_badge.jpg'
)

Badge.create!(
  name: 'All tests with 2 level of complexity',
  award_type: 'all_tests_by_level',
  award_condition: 2,
  img_path: 'badges/level_two_badge.jpg'
)

Badge.create!(
  name: 'Test from 1 attempt',
  award_type: 'test_by_attempts_number',
  award_condition: 1,
  img_path: 'badges/attempts_one_badge.jpg'
)
