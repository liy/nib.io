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
  end

  def create_books(user)
    book = user.writings.create!(title: "Liy's first book", summary: "My first book's summery should be here")
    book.sections.create!(title: 'Intro', content: 'Content of the intro chapter')
  end
end