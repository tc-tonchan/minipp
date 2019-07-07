class RemoveImageFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :image, :text
  end
end
