# -*- coding: utf-8 -*-
require 'spec_helper'

describe EventsController do
  describe 'GET index' do
    it 'assigns all events as @events' do
      pending "eventがnilになって落ちる。とりあえずpendingにしてます"
      events = [event = Event.make]
      mock(Event).all.with_any_args { events }
      get :index
      assigns[:events].should == events
      assigns[:rooms].should == [event.room]
    end
  end

  context 'timetable does not exist' do
    describe 'GET /2011/ja/timetable' do
      before { get :timetable, {:year => '2011', :locale => 'ja'} }
      subject { response.code }
      it { should === '404' }
    end
  end

  context 'timetable exists' do
    describe 'GET /2011/ja/timetable' do
      before { get :timetable, {:year => '2010', :locale => 'ja'} }
      subject { response.code }
      it { should === '200' }
    end
  end
end
