require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    # the current variable is never used because of your tail method
    # current = @head
    new_tail = Node.new(data)
    if empty?
      @head = new_tail
    else
      # you only use the tail method here. it doesn't save much code if it isnt used more than once
      tail.next_node = new_tail
    end
    # this is calling the object when you could just return `data` that is originally passed in
    new_tail.data
  end

  def count
    # recursion?
    count = 0
    current = @head
    until current == nil
      current = current.next_node
      count +=1
    end
    count
  end

  def to_string
    elements = []
    current = @head
    # this works, but there's a better way to do this.
    # while current.next_node != nil
      # elements << current.data
      # current = current.next_node
    # end
    # elements << current.data

    # MARK
    until current.nil?
      elements << current.data
      current = current.next_node
    end
    # MARK

    #this doesnt need to be explicitly returned
    return elements.join(" ")
  end

  def prepend(data)
    current = Node.new(data)
    current.next_node = @head
    @head = current

    # MARK
    data
    # MARK
  end

  def insert(num, data)
    current = @head
    if num == 0
      prepend(data)
    elsif num < count
      insert_node(current, num, data)
    else
      # fail fast, this should be first
      return "Number provided is longer than list!"
    end

    # MARK
    data
    # MARK
  end

  def find(num1, num2)
    # fancy
    # also, what about a check to see if there are enough numbers to satisfy this condition?
    if num1.abs != num1 || num2.abs != num2
      return "Only positive integers!"
    else
      words = to_string.split(" ")
      # make this more readable?
      final_index = (num1 + num2 - 1)
      str = words[num1..final_index].join(" ")
    end
    str
  end

  def includes(word)
    # words = to_string.split(" ")
    # include? also works on a string
    # words.include?(word)

    # but i think the idea of includes is to step through the list
    # MARK
    current = @head
    until current.nil?
      if current.data == word
        return true
      end
      current = current.next_node
    end
    return false
    # MARK
  end

  def pop
    current = @head
    # MARK
    popped = ''
    # MARK
    if empty?
      nil
    elsif count == 1
      @head = nil
      popped = current.data
    else
      # MARK
      popped = pop_returner(current)
      # MARK
    end
    # this doesnt work because of scope.
    popped
  end

##### helper methods
  # you can use a private
  private

  def insert_node(current, num, data)
    current = find_node(num, current)
    right_node = current.next_node
    current.next_node = Node.new(data)
    current.next_node.next_node = right_node
  end

  def find_node(num, current)
    (num - 1).times { current = current.next_node }
    current
  end

  def tail
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

  def empty?
    @head == nil
  end

  def pop_returner(current)
    while current.next_node.next_node != nil
      current = current.next_node
    end
    popped = current.next_node.data
    current.next_node = nil
    return popped
  end
end
