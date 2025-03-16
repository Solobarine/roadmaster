require 'rails_helper'

RSpec.describe ReviewPolicy, type: :policy do
  let(:user) { User.new }
  let(:customer) { Customer.new }
  let(:other_customer) { Customer.new }
  let(:review) { Review.new(customer: customer) }
  let(:policy) { described_class.new(entity, review) }

  describe '#create?' do
    context 'when the entity is a Customer' do
      let(:entity) { customer }

      it 'allows creation' do
        expect(policy.create?).to be true
      end
    end

    context 'when the entity is not a Customer (User)' do
      let(:entity) { user }

      it 'denies creation' do
        expect(policy.create?).to be false
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

    context 'when the entity is the review\'s customer' do
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
    context 'when the entity can update the review (User or Customer)' do
      let(:entity) { user }

      it 'allows destruction' do
        expect(policy.destroy?).to be true
      end
    end

    context 'when the entity can update the review (Customer who owns the review)' do
      let(:entity) { customer }

      it 'allows destruction' do
        expect(policy.destroy?).to be true
      end
    end

    context 'when the entity cannot update the review (Different customer)' do
      let(:entity) { other_customer }

      it 'denies destruction' do
        expect(policy.destroy?).to be false
      end
    end
  end
end
