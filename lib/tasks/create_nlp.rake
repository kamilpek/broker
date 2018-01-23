desc "Create media research"
task :create_nlp => :environment do
  nlp = build_create_nlp
  if nlp.nil?
    puts "Something is wrong."
  else
    puts "Successfull analyze."
  end
end

def build_create_nlp
  puts "Analyze begining.\n"
  nlp = `Rscript lib/tasks/nlp.R`
  nlp_result = nlp[4..-2]
  nlp_result_int = 1 if nlp_result == "positive"
  nlp_result_int = 2 if nlp_result == "negative"
  DjiNlp.create!(
    :result => nlp_result,
    :result_int => nlp_result_int,
  )
end
