module Math
  def self.cos(input)
  end
end


module HasAttributes

  # after you have called include
  def self.included(base)
    puts "Hey #{self} has just been included by : #{base}"
    # base class extend class methods
    puts "Now you should extend the class you need"
    base.extend ClassMethods
  end

  def self.extended(base)
  end

  #{ title: "War and Peace", ...}
  def initialize(hash)
    @hash = hash
  end

  module ClassMethods
    def attribute(name, options={})
      define_method name do
        @hash[name] || options[:default]
      end

      define_method "#{name}=" do |value|
        @hash[name] = value
      end

      attribute_list.push(name)

    end

    def attribute_list
      if @attribute_list.nil?
        @attribute_list = []
      end
      @attribute_list
    end

    def attributes(*names)
      names.each {|name| attribute(name)}
    end
  end


end

class Article
  # extend HasAttributes   # (add self. to make a class method)
  # include HasAttributes  (instance method)

  def self.all
    [new({}), new({})]
  end

  include HasAttributes

  attribute :title, default: "World Z"
  attributes :title, :author, :publish_date

  def to_json
    #{title: title, author: author, publish_date: publish_date}
    hash = {}
    Article.attribute_list.each do |attribute|
      puts "Storing in hash #{attribute} #{send(attribute)}"
      # :title
      # :author
      # :publish_date
      # hash[:title] = send(attribute)
      hash[attribute] = send(attribute)      # send is executing the code
    end
    hash
  end
end

class Gallery
  puts "before include"
  include HasAttributes
  puts "after include"

end

#article = Article.new author: "Tol", publish_date :"1/1/1901"
#puts article.attribute_list
#galary = Gallery.new title: "Kim K baby"