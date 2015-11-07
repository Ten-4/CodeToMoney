require 'tmpdir'
require 'open3'

def judge(base_repo, solution_repo)
  Dir.mktmpdir do |dir|
    puts "Tmp dir: #{dir}"
    Dir.chdir(dir) do
      clone_repo(base_repo, 'base')
      clone_repo(solution_repo, 'solution')
      run_tests_py(File.join(dir, 'base'), File.join(dir, 'solution'))
    end
  end
end

def clone_repo(repo, dest)
  run('git', 'clone', '--depth=1', repo, dest)
end

def run_tests_py(base_dir, sol_dir)
  Dir.chdir(sol_dir) do
    out, err, status = Open3.capture3({"PYTHONPATH" => base_dir}, 'nosetests2', '-P')
    puts "Test output", err
    return status == 0, err
  end
end

def run(*args)
  puts(args.join(' '))
  system(*args) or raise(args.to_s)
end
