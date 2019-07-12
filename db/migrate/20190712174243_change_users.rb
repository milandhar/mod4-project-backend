class ChangeUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :message_template, :text, :default => "I found this pup's profile on BarkBrowser and I am interested in potentially meeting and adopting them. Please let me know your availability so we can set up a meeting! Looking forward to connecting."
  end
end
