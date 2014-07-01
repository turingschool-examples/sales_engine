guard :minitest do
  watch(/test\/.+_test\.rb/)
  watch(/lib\/(.+)\.rb/) do |data|
    "test/#{data[1]}_test.rb"
  end
end
 
