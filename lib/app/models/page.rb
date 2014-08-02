require 'sequel'
require 'sqlite3'

Database = Sequel.sqlite('db/test.sqlite3')

class Page
  def self.create(data)
    Page.new(data).save!
  end

  def self.find_by_slug(slug)
    data = table.where(:slug => slug).first
    Page.new(data) if data
  end

  def self.table
    Database.from(:pages)
  end

  attr_reader :slug, :content

  def initialize(data)
    @slug = data[:slug]
    @content = data[:content]
  end

  def save!
    self if table.insert(:slug => slug, :content => content)
  end

  def table
    self.class.table
  end

  def ==(other)
    slug == other.slug && content == other.content
  end
end
