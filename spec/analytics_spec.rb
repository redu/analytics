require 'spec_helper'

module ReduAnalytics
  describe 'Analytics' do
    before do
      class MyObject < ActiveRecord::Base
      end
    end

    it "should initialize my_object" do
      MyObject.new.should respond_to :id
      MyObject.new.should respond_to :created_at
    end

    it "should count my_objects by date" do
      a = Analytics.count_by_date(MyObject, Date.today, Date.today)
      a.should be_a Array
    end

    context "Sign up by date" do
      before do
        @result = [[Date.today, 3]]
      end

      it "should return the data in the correct form" do
        MyObject.create
        MyObject.create
        MyObject.create
        analytics = Analytics.count_by_date(MyObject, Date.today, Date.today)
        analytics.should == @result
      end
    end
  end
end
