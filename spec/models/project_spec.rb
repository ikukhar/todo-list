describe Project do
  describe '#to_json' do
    it 'included tasks' do
      project = Project.create(name: 'Test project')
      expect(project.to_json).to have_json_path('tasks')
    end
  end
end
