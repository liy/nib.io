#coding: utf-8
namespace :db do
  task populate: :environment do
    # reset database
    Rake::Task['db:reset'].invoke

    create_users
  end

  def create_users
    user = User.create!(email: 'liy@ac.com', password: '0000', name: '李旸')
    create_books(user)

    user = User.create!(email: 'sisi@ac.com', password: '0000', name: '刘思斯')
    create_books(user)
  end

  def create_books(user)
    book = user.writings.create(title: "日记本", summary: "#{user.name}的私人日记")
    book.sections.create!(title: '序', content: '啥都没有')
  end
end