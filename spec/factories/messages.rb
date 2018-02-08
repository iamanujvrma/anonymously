FactoryBot.define do
	factory :message do
		trait :message_present do
			content 'This is a Message Text'
		end
		
		trait :message_empty do
			content nil
		end

		trait :receiver_id_found do
			content 101
		end

		trait :receiver_id_not_found do
			content nil
		end

		factory :message_given_for_valid_user, traits: [:message_present, :receiver_id_found]
		factory :no_message_given_for_valid_user, traits: [:message_empty, :receiver_id_found]
		factory :no_message_given_for_invalid_user, traits: [:message_empty, :receiver_id_not_found]
		factory :message_given_for_invalid_user, traits: [:message_present, :receiver_id_not_found] 
		end
end
