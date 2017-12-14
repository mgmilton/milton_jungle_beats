gem 'minitest'
require './lib/linked_list'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class LinkedListTest < Minitest::Test
  # def setup
    # @list = LinkedList.new
  # end

  def test_head_initializes_with_nil
    list = LinkedList.new
    assert_nil list.head
  end

  def test_append_returns_data
    list = LinkedList.new
    assert_equal "doop", list.append("doop")
  end

  def test_append_adds_data_to_list
    list = LinkedList.new
    list.append("doop")
    assert_nil list.head.next_node
    assert_equal "doop", list.to_string
  end

  def test_count
    list = LinkedList.new
    list.append("doop")
    assert_equal 1, list.count
    list.append("boop")
    assert_equal 2, list.count
  end

  def test_to_string_returns_a_string
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    assert_equal "doop boop" ,list.to_string
  end

  def test_prepend_adds_data_to_beginnig
    list = LinkedList.new
    list.append("doop")
    # creating minimal amounts of data
    list.append("boop")
    list.prepend("woop")
    assert_equal "woop doop boop", list.to_string

    # the spec asks for the original sound to be returned
    assert_equal "yup", list.prepend("yup")
    assert_equal 4, list.count
  end

  def test_insert_adds_data_at_num
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.prepend("woop")
    list.insert(2, "gawk")
    assert_equal "woop doop gawk boop", list.to_string

    # the spec asks for the original sound to be returned
    assert_equal "yup", list.insert(1, "yup")
  end

  def test_insert_prepends_when_zero_is_given
    list = LinkedList.new
    list.append("doop")
    list.append("doop")
    list.append("doop")
    list.insert(0, "romp")
    assert_equal "romp doop doop doop", list.to_string
  end

  def test_insert_prevents_adding_beyond_length
    list = LinkedList.new
    list.append("doop")
    assert_equal "Number provided is longer than list!", list.insert(9, 'gawk')
  end

  def test_find_locates_correct_substring
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    list.append("gawk")
    assert_equal "woop", list.find(2,1)
  end

  def test_find_prevent_negative_numbers
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    assert_equal "Only positive integers!", list.find(-2,-2)
  end

  def test_includes_checks_list_for_existing_values
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    refute list.includes("ramen")
    assert list.includes("woop")
  end

  def test_pop_removes_last_item_from_list
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    list.pop
    assert_equal "doop boop", list.to_string

    # the spec asks for the original sound to be returned
    assert_equal "boop", list.pop
  end

  def test_pop_returns_last_item_from_list
    list = LinkedList.new
    list.append("doop")
    assert_equal "doop", list.pop
  end

  ###### helper method tests ######
  def test_empty_returns_true_when_head_is_nil
    list = LinkedList.new
    assert list.empty?
    list.append("doop")
    refute list.empty?
  end

  def test_insert_node_stores_trailing_node
    list = LinkedList.new
    list.append("boop")
    list.append("doop")
    list.append("romp")
    assert_equal list.tail, list.insert_node(list.head.next_node, 1, "douy")
  end


  def test_tail_generates_linkedlist_tail
    list = LinkedList.new
    list.append("boop")
    list.append("doop")
    list.append("romp")
    assert_equal list.head.next_node.next_node, list.tail
  end

  def test_find_node_runs_to_specified_node
    list = LinkedList.new
    list.append("boop")
    list.append("doop")
    list.append("romp")
    assert_equal list.head.next_node, list.find_node(2, list.head)
  end

  def pop_returner_finds_last_node
    list = LinkedList.new
    list.append("boop")
    list.append("doop")
    list.append("romp")
    assert_equal "romp", list.pop_returner(current)
  end
end
