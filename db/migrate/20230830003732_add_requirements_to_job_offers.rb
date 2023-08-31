class AddRequirementsToJobOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :job_offers, :requirements, :text
  end
end
