require './teacher'

describe Teacher do
  let(:specialization) { 'Mathematics' }
  let(:age) { 35 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:teacher) { Teacher.new(specialization, age, name, parent_permission: parent_permission) }

end