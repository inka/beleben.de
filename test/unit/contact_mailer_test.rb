require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  tests ContactMailer
  def test_confirmation
    @expected.subject = 'ContactMailer#confirmation'
    @expected.body    = read_fixture('confirmation')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ContactMailer.create_confirmation(@expected.date).encoded
  end

  def test_message
    @expected.subject = 'ContactMailer#message'
    @expected.body    = read_fixture('message')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ContactMailer.create_message(@expected.date).encoded
  end

end
