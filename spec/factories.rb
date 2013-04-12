FactoryGirl.define do
	factory :member do
		username "Jack"
		email "jack@tower.com"
		password "jacktower"
	end

	factory :hacker, class: Member do
		username "hacker"
		email "thief@hacker.com"
		password "thieftower"
	end

	factory :member_with_projects, parent: :member do
		after(:create) do |member|
			member.projects = ["abc", 'def', 'ghi'].map do |i|
				FactoryGirl.create(:project, name: i)
			end
		end
	end


	factory :project do
		name "test project"
	end

	factory :new_project, class: Project do
		name "new project"
	end
end