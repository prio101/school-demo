class AddSubjectIdAndSubjectiveMarkAndObjectiveMarkAndExamIdToResult < ActiveRecord::Migration
  def change
    add_column :results, :subject_id, :integer
    add_column :results, :subjective_mark, :decimal
    add_column :results, :objective_mark, :decimal
    add_column :results, :exam_id, :integer
  end
end
