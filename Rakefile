namespace :sanitation do
  desc "Check line lengths & whitespace with Cane"
  task :lines do
    system("cane --no-abc --style-glob 'lib/**/*.rb' --no-doc")
  end

  desc "Check method length with Reek"
  task :methods do
    system("reek -n lib/**/*.rb 2>&1 | grep -v ' 0 warnings'")
  end

  desc "Check both line length and method length"
  task :all => [:lines, :methods]
end