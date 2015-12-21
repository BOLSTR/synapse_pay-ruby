require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class RequesterTest < ::Test::Unit::TestCase
    setup do
    end

    context '#query_string' do
      should 'join #query_array results with an "&"' do
        start = { :a => 1, :b => [2, 3] }
        expected = ["a=1", "b[]=2", "b[]=3"]

        actual = Requester.query_string(start).split('&')
        actual.each do |str|
          assert(expected.include?(str))
        end
      end
    end

    context '#query_array' do
      should 'convert { :a => "value" } to []' do
        start = { :a => "value" }
        finish = ["a=value"]

        assert_equal(finish, Requester.query_array(start))
      end

      should 'convert { :a => { :b => { :c => "cvalue" } } } to ["a[b][c]=cvalue"]' do
        start = { :a => { :b => { :c => "cvalue" } } }
        finish = ["a[b][c]=cvalue"]

        assert_equal(finish, Requester.query_array(start))
      end

      should 'convert { :a => [1, 2] } to ["a[]=1", "a[]=2"]' do
        start = { :a => [1, 2] }
        finish = ["a[]=1", "a[]=2"]

        assert_equal(finish, Requester.query_array(start))
      end
    end

  end
end
