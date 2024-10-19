require 'rails_helper'

RSpec.describe BrandPolicy, type: :policy do
  let(:user) { User.new }
  let(:brand) { Brand.new }
  let(:other_entity) { double('OtherEntity') }
  let(:policy) { described_class.new(entity, brand) }

  describe '#create?' do
    context 'when the entity is a User' do
      let(:entity) { user }

      it 'allows creation' do
        expect(policy.create?).to be true
      end
    end

    context 'when the entity is not a User' do
      let(:entity) { other_entity }

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

    context 'when the entity is not a User' do
      let(:entity) { other_entity }

      it 'denies updating' do
        expect(policy.update?).to be false
      end
    end
  end

  describe '#destroy?' do
    context 'when the entity is a User' do
      let(:entity) { user }

      it 'allows destruction' do
        expect(policy.destroy?).to be true
      end
    end

    context 'when the entity is not a User' do
      let(:entity) { other_entity }

      it 'denies destruction' do
        expect(policy.destroy?).to be false
      end
    end
  end
end
