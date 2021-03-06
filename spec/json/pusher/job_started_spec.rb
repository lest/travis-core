require 'spec_helper'
require 'support/active_record'
require 'support/formats'

describe 'JSON for pusher' do
  include Support::ActiveRecord, Support::Formats

  let(:test) { Factory(:test, :worker => 'ruby3.worker.travis-ci.org:travis-ruby-4') }

  it 'job:started' do
    json_for_pusher('job:started', test).should == {
      'id' => test.id,
      'build_id' => test.owner_id,
      'started_at' => nil,
      'worker' => 'ruby3.worker.travis-ci.org:travis-ruby-4',
      'sponsor' => { 'name' => 'Railslove', 'url' => 'http://railslove.de' }
    }
  end
end
