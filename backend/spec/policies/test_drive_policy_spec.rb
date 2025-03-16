require 'rails_helper'

RSpec.describe TestDrivePolicy, type: :policy do
  let(:user) { User.new }
  let(:customer) { Customer.new }
  let(:other_customer) { Customer.new }
  let(:test_drive) { TestDrive.new(customer: customer) }
  let(:policy) { described_class.new(entity, test_drive) }

  describe '#index?' do
    context 'when the entity is a User' do
      let(:entity) { user }

      it 'allows access' do
        expect(policy.index?).to be true
      end
    end

    context 'when the entity is not a User' do
      let(:entity) { customer }

      it 'denies access' do
        expect(policy.index?).to be false
      end
    end
  end

  describe '#show?' do
    context 'when the entity can update the test drive' do
      let(:entity) { user }

      it 'allows viewing' do
        expect(policy.show?).to be true
      end
    end

    context 'when the entity is the test drive\'s customer' do
      let(:entity) { customer }

      it 'allows viewing' do
        expect(policy.show?).to be true
      end
    end

    context 'when the entity cannot update the test drive' do
      let(:entity) { other_customer }

      it 'denies viewing' do
        expect(policy.show?).to be false
      end
    end
  end

  describe '#update?' do
    context 'when the entity is a User' do
      let(:entity) { user }

      it 'allows updating' do
        expect(policy.update?).to be true
      end
    end

    context 'when the entity is the test drive\'s customer' do
      let(:entity) { customer }

      it 'allows updating' do
        expect(policy.update?).to be true
      end
    end

    context 'when the entity is a different customer' do
      let(:entity) { other_customer }

      it 'denies updating' do
        expect(policy.update?).to be false
      end
    end
  end

  describe '#destroy?' do
    context 'when the entity can update the test drive (User or the customer)' do
      let(:entity) { user }

      it 'allows destruction' do
        expect(policy.destroy?).to be true
      end
    end

    context 'when the entity can update the test drive (Customer who owns the test drive)' do
      let(:entity) { customer }

      it 'allows destruction' do
        expect(policy.destroy?).to be true
      end
    end

    context 'when the entity cannot update the test drive (Different customer)' do
      let(:entity) { other_customer }

      it 'denies destruction' do
        expect(policy.destroy?).to be false
      end
    end
  end
end
