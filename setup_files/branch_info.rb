# for each branch...
require_relative '../helper/file_helper.rb'

class ConfigureBranch
  # get_dir() // helper methods.
  include FileHelper

  def automerge_folder_exist?
    return check_dir('.automerge_config')
  end

  def curr_branch_has_config_file?(currbranch)
    return check_file(".automerge_config/#{currbranch}.txt")
  end

  def write_branch_info(filename)
    # https://blog.bigbinary.com/2012/10/18/backtick-system-exec-in-ruby.html
    # could also have used, %x{}
    # %x{} is an equivalent to backticks and backticks look more performant
    # than system().
    system("for BRANCH in `git branch --list | cut -c 3-`; do echo $BRANCH >> #{filename}  done;")
  end

  def unused_method_get_branch_info
    return system("git branch --list | cut -c 3-")
  end

  def configure_branch
    # watch out because strip can return nil if it strips a result of nothing.
    currbranch=`git branch | grep "*" | cut -c 3-;`.strip
    configure_directory {
      configure_file(currbranch)
    }
  end

  def configure_directory(&block)
    automerge_folder_exist? ?
      handle_directory_exist(&block) :
      handle_directory_not_exist(&block)
  end
  def handle_directory_exist
      puts("Directory Existed!")
      yield
  end
  def handle_directory_not_exist
      puts("Created Directory because did not exist")
      `mkdir .automerge_config`
      yield
  end

  def configure_file(currbranch) # file_configured?
      curr_branch_has_config_file?(currbranch) ?
        update_config_file(currbranch) :
        create_config_file(currbranch)
  end

  def update_config_file(currbranch)
    puts("File Existed")
    system("rm .automerge_config/#{currbranch;}.txt")
    write_branch_info(file_name(currbranch))
    puts("done")
  end

  def file_name(currbranch)
    return ".automerge_config/#{currbranch}.txt;"
  end

  def create_config_file(currbranch)
    puts("Created File because did not exist")
    write_branch_info(file_name(currbranch))
    puts("done")
  end

end
this_script = ConfigureBranch.new
this_script.configure_branch

