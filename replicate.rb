##
# This program replicates files
# from one directory to another based
# on their status in a postgres table.
#
#
##
require 'pg'

class Replicate
  def db(dbname,user,pw)
    conn = PG.connect(:dbname=>dbname,:user=>user,:password=>pw)
  end

end

r = Replicate.new

conn = r.db('postgres','postgres','postgres')

conn.exec("select * from shire") do |result|
  result.each do |row|
    puts "%7d | %-16s | %s | %s" % row.values_at('eid', 'name', 'job','repc')
  end
end

log = "log.txt"

dir1 = "./dir1"
dir2 = "./dir2"

File.open(log, "w") do |f|
  (1...50).each do |x|
    f.puts "#{x}:\t\t#{x * x}"
  end
end
