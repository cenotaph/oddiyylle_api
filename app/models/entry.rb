class Entry < ApplicationRecord
  has_one_attached :yword
  has_one_attached :ysound
  has_one_attached :homestory

  validates :cookie, presence: true, uniqueness: true
  
  def self.to_csv
    require 'csv'
    attributes = %w{id name email municipality contact_details submitted anonymous comments }

    CSV.generate(headers: true) do |csv|
      csv << csv_header_row

      all.each do |contact|
        csv << [attributes.map{ |attr| contact.send(attr) }, !contact.ysound.blank?, !contact.yword.blank?, !contact.homestory.blank?].flatten
      end
    end
  end
  def self.csv_header_row
    %w(ID Name Email Municipality Contact Submitted? Anonymous? Comments YSound? YWord? Homestory?)
  end

end
