## these tests are not working but are semi-defined.
require "rspec"
describe "config creation working correctly, for newly created and deleted branches" do

  # context cadidate.
  it "should get correct initial state response" do
    system( git checkout test_starting_branch)
    system(   cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq() # not figured out yet
  end

  it "should run script and no changes should occour" do
    system(ruby ../setup_files/branch_info.rb)
    system(  cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq() # not figured out yet
  end

  # context cadidate.
  it "should make a new branch" do
    system( git branch)
    .assert(self.to eq()) # not figured out yet

    system( git checkout -b test)
    system( git branch)
    .assert(self.to eq()) # not figured out yet
  end

  # context cadidate.
  if "should run script with new branch and have correct script output." do
    system(  cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq()) # should not exist prior

    system(ruby ../setup_files/branch_info.rb)
    system(  cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq()) # should be unchanged

    system(  cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq()) # should exist with correct branch results.
  end

  # context cadidate.
  it "should checkout to old branch, which will not have old branch info but have its correct info" do
    system( git add .; git commit -m "testing commit should never show up";)
    system( git checkout test_starting_branch)
    system(   cat .automerge_config/test.txt)
    .assert(self.to eq()) # should not exist.

    system( cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq()) # should equal what it was prior
  end

  it "running script on old branch should still equal what it was prior" do
    system(ruby ../setup_files/branch_info.rb)
    system(cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq()) # not figured out yet
  end

  # context cadidate.
  it "should delete the branch that was created. and have the correct output" do
    system( git branch)
    .assert(self.to eq()) # should show new branch included.

    system( git branch -d test)
    system( git branch)
    .assert(self.to eq()) # should show branch removed branch

    system(   ruby ../setup_files/branch_info.rb)
    system(     cat .automerge_config/test_starting_branch.txt)
    .assert(self.to eq()) # not figured out yet
  end

end
