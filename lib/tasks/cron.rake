task :cron => :environment do 
    puts "Pulling new requests"
    EdiListiner.process_new_messages
    puts "Done"
end