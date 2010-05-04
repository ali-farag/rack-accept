require File.dirname(__FILE__) + '/helper'

class LanguageTest < Test::Unit::TestCase

  L = Rack::Accept::Language

  def test_qvalue
    l = L.new('')
    assert_equal(1, l.qvalue('en'))

    l = L.new('en;q=0.5, en-gb')
    assert_equal(0.5, l.qvalue('en'))
    assert_equal(1, l.qvalue('en-gb'))
    assert_equal(0, l.qvalue('da'))
  end

  def test_matches
    l = L.new('da, *, en')
    assert_equal(%w{*}, l.matches(''))
    assert_equal(%w{da *}, l.matches('da'))
    assert_equal(%w{en *}, l.matches('en'))
    assert_equal(%w{en *}, l.matches('en-gb'))
    assert_equal(%w{*}, l.matches('eng'))

    l = L.new('en, en-gb')
    assert_equal(%w{en-gb en}, l.matches('en-gb'))
  end

  def test_best_of
    l = L.new('en;q=0.5, en-gb')
    assert_equal('en-gb', l.best_of(%w< en en-gb >))
    assert_equal('en', l.best_of(%w< en da >))
    assert_equal('en-us', l.best_of(%w< en-us en-au >))
    assert_equal(nil, l.best_of(%w< da >))
  end

end