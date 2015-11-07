require 'tmpdir'
require 'open3'

module SubmissionsHelper

#class Judge
#  @queue = :judge
#
#  def self.perform(submission_id)
#    submission = Submission.find(submission_id)
#    task = submission.task
##    result = judge_local(task.test_code, submission.code)
#    puts 'judge ', submission.id, task.id
#  end
#end

def judge_async(submission)
  Thread.new {
    res = judge_local(submission.task.test_code, submission.code)
    submission.status = true
    submission.passed = res
    submission.save
  }
end

def judge_local(tester, solution)
  Dir.mktmpdir do |dir|
    puts "Tmp dir: #{dir}"
    Dir.chdir(dir) do
      run_tests_py(tester, solution)
    end
  end
end

def run_tests_py(tester, solution)
  File.write('solution.py', solution)
  File.write('test_solution.py', tester)
  out, err, status = Open3.capture3('timeout', '1', 'nosetests2', 'test_solution.py')
  puts "Test output", err
  return status == 0
end

end
