require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do
    it 'should change complete to false if complete is true' do
      task = Task.create(name: "Mow the lawn", complete: true)
      task.toggle_complete!
      result = task.complete
      expect(result).to eq(false)
    end
    it 'should change complete to true if complete is false' do
      task = Task.create(name: "Mow the lawn", complete: false)
      task.toggle_complete!
      result = task.complete
      expect(result).to eq(true)
    end
  end

  describe '#increment_priority!' do
    it 'should update priority if its less than 10' do
      task = Task.create(priority: 8)
      task.increment_priority!
      result = task.priority
      expect(result).to eq(9)
    end
  end

  describe '#decrement_priority!' do
    it 'should update priority if its greater than 1' do
      task = Task.create(name: "Walk friends dog", priority: 4)
      task.decrement_priority!
      result = task.priority
      expect(result).to eq(3)
    end
  end

  describe '#snooze_hour!' do
    it 'should push the deadline of by one hour' do
      right_now = Time.now
      task = Task.create(deadline: Time.now)
      task.snooze_hour!
      expect(task.deadline).to eq(right_now + 1.hour)
    end
  end
end
