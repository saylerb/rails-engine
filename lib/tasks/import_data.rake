require "csv"

namespace :import do
  desc "imports csv data into the database"
  task merchants: :environment do
    Load.csv("merchants")
  end

  task customers: :environment do
    Load.csv("customers")
  end

  task items: :environment do
    Load.csv("items")
  end

  task invoices: :environment do
    Load.csv("invoices")
  end

  task invoice_items: :environment do
    Load.csv("invoice_items")
  end

  task transactions: :environment do
    Load.csv("transactions")
  end

  task all: [ :merchants,
              :customers,
              :items,
              :invoices,
              :invoice_items,
              :transactions,
            ]
end

module Load
  def self.csv(file_name)
    puts "Importing #{file_name.capitalize}..."
    model = file_name.classify.constantize

    CSV.foreach("./db/data/#{file_name}.csv", headers: true) do |row|
      model.create!(row.to_h)
    end

    puts "#{model.count} #{file_name.capitalize} Imported!"
  end
end
