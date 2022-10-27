require 'rake'
require 'fileutils'

def check_os(os)
  system "cat /etc/*release | grep -i #{os.downcase}"
end

desc "Hook our dotfiles into system-standard positions."
task :install => [:submodule_init, :submodules] do
  puts
  puts "======================================================"
  puts "Welcome to YADR Installation."
  puts "======================================================"
  puts

  if RUBY_PLATFORM.downcase.include?("darwin")
    install_homebrew
  elsif check_os('ubuntu')
    install_ubuntu
  elsif check_os('centos')
    install_ubuntu
  end
  #install_rvm_binstubs

  # this has all the runcoms from this directory.
  install_files(Dir.glob('git/*')) if want_to_install?('git configs (color, aliases)')
  install_files(Dir.glob('irb/*')) if want_to_install?('irb/pry configs (more colorful)')
  install_files(Dir.glob('ruby/*')) if want_to_install?('rubygems config (faster/no docs)')
  install_files(Dir.glob('ctags/*')) if want_to_install?('ctags config (better js/ruby support)')
  if want_to_install?('tmux config')
    install_files(Dir.glob('tmux/*'))
    run %{ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm }
  end
  install_files(Dir.glob('vimify/*')) if want_to_install?('vimification of command line tools')

  Rake::Task["install_prezto"].execute

  install_fonts

  install_term_theme if RUBY_PLATFORM.downcase.include?("darwin")

  run_bundle_config
  if want_to_install?('vim configuration (highly recommended)')
    install_files(Dir.glob('{vim,vimrc}'))
    has_nvim = File.exists?(File.join(ENV['HOME'], ".config", 'nvim'))
    if has_nvim
      run %{mv ~/.config/nvim ~/.config/nvim.#{Time.now.to_i}}
      puts "Your nvim config was moved to ~/.config/nvim.#{Time.now.to_i}"
    end
    run %{ mkdir -p ~/.config && ln -nfs #{ENV["PWD"]}/vim/nvim ~/.config/}
    Rake::Task["install_plug"].execute
    #has_ycm = File.exists?(File.join(ENV['HOME'], ".vim", 'bundle', 'YouCompleteMe'))
    #Rake::Task["compile_ycm"].execute unless has_ycm
  end

  Rake::Task["install_docker_completion"].execute

  puts "You can install tmux plugins via 'prefix + I'"
  success_msg("installed")
end

task :install_prezto do
  if want_to_install?('zsh enhancements & prezto')
    install_prezto
  end
end

task :install_docker_completion do
  if want_to_install?('Docker completion')
    install_docker_completion
  end
end


desc 'Updates the installation'
task :update do

  system "test -d $HOME/.zprezto/contrib && (cd $HOME/.zprezto/contrib && git submodule update --remote) || (cd $HOME/.zprezto && git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib)"

  puts "update Prezto ..........."
  system "test -d $HOME/.zprezto && cd $HOME/.zprezto && git co master && git pull && git submodule update --init --recursive"


  puts "update Vim-Plug packages ..........."
  system "nvim --noplugin -u #{ENV['HOME']}/.vim/plug.vim -N \"+set hidden\" \"+syntax on\" +PlugClean +PlugUpgrade +PlugUpdate +qall"
  run %{
    cd $HOME/.tmux/plugins/tpm
    git pull
  }
  puts "You can update tmux plugins via 'prefix + U'"
  #TODO: for now, we do the same as install. But it would be nice
  #not to clobber zsh files
end

task :submodule_init do
  unless ENV["SKIP_SUBMODULES"]
    run %{ git submodule update --init --recursive }
  end
end

desc "Init and update submodules."
task :submodules do
  unless ENV["SKIP_SUBMODULES"]
    puts "======================================================"
    puts "Downloading YADR submodules...please wait"
    puts "======================================================"

    run %{
      cd $HOME/.yadr
      git submodule update --recursive
      git clean -df
    }
    puts
  end
end

desc "Runs Plug installer in a clean vim environment"
task :install_plug do
  puts "======================================================"
  puts "Installing and updating Vim-Plug."
  puts "======================================================"

  puts ""

  plug_path = File.join('vim','autoload', 'plug.vim')
  max_retry_times = 5
  retry_times = 0
  while !File.exists?(plug_path) && retry_times < max_retry_times
    system "curl -fLo #{plug_path} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    sleep 1
    puts "retry #{retry_times} install plug.vim"
  end
  puts "Install Vim-Plug packages ..........."
  system "nvim --noplugin -u #{ENV['HOME']}/.vim/plug.vim -N \"+set hidden\" \"+syntax on\" +PlugClean +PlugInstall +qall"
end

desc "compile YouCompleteMe"
task :compile_ycm do
  run %{
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
  }
end

task :default => 'install'


private
def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def number_of_cores
  if RUBY_PLATFORM.downcase.include?("darwin")
    cores = run %{ sysctl -n hw.ncpu }
  else
    cores = run %{ nproc }
  end
  puts
  cores.to_i
end

def run_bundle_config
  return unless system("which bundle")

  bundler_jobs = number_of_cores - 1
  puts "======================================================"
  puts "Configuring Bundlers for parallel gem installation"
  puts "======================================================"
  run %{ bundle config --global jobs #{bundler_jobs} }
  puts
end

def install_rvm_binstubs
  puts "======================================================"
  puts "Installing RVM Bundler support. Never have to type"
  puts "bundle exec again! Please use bundle --binstubs and RVM"
  puts "will automatically use those bins after cd'ing into dir."
  puts "======================================================"
  run %{ chmod +x $rvm_path/hooks/after_cd_bundler }
  puts
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    puts "======================================================"
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts "already installed, this will do nothing."
    puts "======================================================"
    run %{ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"}
  end

  puts
  puts
  puts "======================================================"
  puts "Updating Homebrew."
  puts "======================================================"
  run %{brew update}
  puts
  puts
  puts "======================================================"
  puts "Installing Homebrew packages...There may be some warnings."
  puts "======================================================"
  run %{brew install curl zsh git hub tmux reattach-to-user-namespace the_silver_searcher ghi coreutils jq tree fzf jsonlint neovim tldr ripgrep bat fd exa global git-delta dust duf glances ccache autoconf automake libtool gpg gawk}
  run %{brew install --HEAD universal-ctags/universal-ctags/universal-ctags}
  #run %{brew install macvim --custom-icons --with-override-system-vim --with-lua --with-luajit}
  run %{$(brew --prefix)/opt/fzf/install}
  puts
  puts
end


def install_ubuntu
  puts
  puts
  puts "======================================================"
  puts "Updating"
  puts "======================================================"
  run %{sudo apt update}
  puts
  puts
  puts "======================================================"
  puts "Installing packages...There may be some warnings."
  puts "======================================================"
  run %{sudo apt install -y curl zsh git tmux silversearcher-ag coreutils jq tree jsonlint neovim tldr bat global ccache}
  puts
  puts
end

def install_centos
  puts
  puts
  puts "======================================================"
  puts "Updating"
  puts "======================================================"
  run %{sudo apt update}
  puts
  puts
  puts "======================================================"
  puts "Installing packages...There may be some warnings."
  puts "======================================================"
  run %{sudo yum install -y curl zsh git tmux the_silver_searcher coreutils jq tree neovim tldr global ccache}
  puts
  puts
end


def install_fonts
  puts "======================================================"
  puts "Installing patched fonts for Powerline/Lightline."
  puts "======================================================"
  run %{ cp -f $HOME/.yadr/fonts/* $HOME/Library/Fonts } if RUBY_PLATFORM.downcase.include?("darwin")
  run %{ mkdir -p ~/.fonts && cp ~/.yadr/fonts/* ~/.fonts && fc-cache -vf ~/.fonts } if RUBY_PLATFORM.downcase.include?("linux")
  puts
end

def install_term_theme
  puts "======================================================"
  puts "Installing iTerm2 solarized theme."
  puts "======================================================"
  run %{ /usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Light' dict" ~/Library/Preferences/com.googlecode.iterm2.plist }
  run %{ /usr/libexec/PlistBuddy -c "Merge 'iTerm2/Solarized Light.itermcolors' :'Custom Color Presets':'Solarized Light'" ~/Library/Preferences/com.googlecode.iterm2.plist }
  run %{ /usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist }
  run %{ /usr/libexec/PlistBuddy -c "Merge 'iTerm2/Solarized Dark.itermcolors' :'Custom Color Presets':'Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist }

  # If iTerm2 is not installed or has never run, we can't autoinstall the profile since the plist is not there
  if !File.exists?(File.join(ENV['HOME'], '/Library/Preferences/com.googlecode.iterm2.plist'))
    puts "======================================================"
    puts "To make sure your profile is using the solarized theme"
    puts "Please check your settings under:"
    puts "Preferences> Profiles> [your profile]> Colors> Load Preset.."
    puts "======================================================"
    return
  end

  # Ask the user which theme he wants to install
  message = "Which theme would you like to apply to your iTerm2 profile?"
  color_scheme = ask message, iTerm_available_themes

  return if color_scheme == 'None'

  color_scheme_file = File.join('iTerm2', "#{color_scheme}.itermcolors")

  # Ask the user on which profile he wants to install the theme
  profiles = iTerm_profile_list
  message = "I've found #{profiles.size} #{profiles.size>1 ? 'profiles': 'profile'} on your iTerm2 configuration, which one would you like to apply the Solarized theme to?"
  profiles << 'All'
  selected = ask message, profiles

  if selected == 'All'
    (profiles.size-1).times { |idx| apply_theme_to_iterm_profile_idx idx, color_scheme_file }
  else
    apply_theme_to_iterm_profile_idx profiles.index(selected), color_scheme_file
  end
end

def iTerm_available_themes
   Dir['iTerm2/*.itermcolors'].map { |value| File.basename(value, '.itermcolors')} << 'None'
end

def iTerm_profile_list
  profiles=Array.new
  begin
    profiles <<  %x{ /usr/libexec/PlistBuddy -c "Print :'New Bookmarks':#{profiles.size}:Name" ~/Library/Preferences/com.googlecode.iterm2.plist 2>/dev/null}
  end while $?.exitstatus==0
  profiles.pop
  profiles
end

def ask(message, values)
  puts message
  while true
    values.each_with_index { |val, idx| puts " #{idx+1}. #{val}" }
    selection = STDIN.gets.chomp
    if (Float(selection)==nil rescue true) || selection.to_i < 0 || selection.to_i > values.size+1
      puts "ERROR: Invalid selection.\n\n"
    else
      break
    end
  end
  selection = selection.to_i-1
  values[selection]
end

def install_prezto
  puts
  puts "Installing Prezto (ZSH Enhancements)..."

  run %{ ln -nfs "$HOME/.yadr/zsh/prezto" "${ZDOTDIR:-$HOME}/.zprezto" }

  # The prezto runcoms are only going to be installed if zprezto has never been installed
  install_files(Dir.glob('zsh/prezto/runcoms/z*'), :symlink)

  run %{ ln -nfs ~/.yadr/.zshrc ~/.zshrc }

  puts
  puts "Overriding prezto ~/.zpreztorc with YADR's zpreztorc to enable additional modules..."
  run %{ ln -nfs "$HOME/.yadr/zsh/prezto-override/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc" }

  puts
  puts "Creating directories for your customizations"
  run %{ mkdir -p $HOME/.zsh.before }
  run %{ mkdir -p $HOME/.zsh.after }
  run %{ mkdir -p $HOME/.zsh.prompts }

  if "#{ENV['SHELL']}".include? 'zsh' then
    puts "Zsh is already configured as your shell of choice. Restart your session to load the new settings"
  else
    puts "Setting zsh as your default shell"
    zsh_path = "#{ENV["HOMEBREW_PREFIX"]}/bin/zsh"
    if File.exists?(zsh_path)
      if File.exists?("/private/etc/shells") && File.readlines("/private/etc/shells").grep(zsh_path).empty?
        puts "Adding zsh to standard shell list"
        run %{ echo "#{zsh_path}" | sudo tee -a /private/etc/shells }
      end
      run %{ chsh -s #{zsh_path} }
    else
      run %{ chsh -s /bin/zsh }
    end
  end

  system "test -d $HOME/.zprezto/contrib || (cd $HOME/.zprezto && git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib)"
end

def install_docker_completion
  puts
  puts "Installing Docker completion..."
  run %{ mkdir -p ~/.zsh/completion }
  run %{ curl -L https://raw.githubusercontent.com/docker/compose/1.16.1/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose }
  run %{ curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o ~/.zsh/completion/_docker }
end

def want_to_install? (section)
  if ENV["ASK"]=="true"
    puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end

def install_files(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end

    # Temporary solution until we find a way to allow customization
    # This modifies zshrc to load all of yadr's zsh extensions.
    # Eventually yadr's zsh extensions should be ported to prezto modules.
    source_config_code = "for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file"
    if file == 'zshrc'
      File.open(target, 'a+') do |zshrc|
        if zshrc.readlines.grep(/#{Regexp.escape(source_config_code)}/).empty?
          zshrc.puts(source_config_code)
        end
      end
    end

    puts "=========================================================="
    puts
  end
end

def list_vim_submodules
  result=`git submodule -q foreach 'echo $name"||"\`git remote -v | awk "END{print \\\\\$2}"\`'`.select{ |line| line =~ /^vim.bundle/ }.map{ |line| line.split('||') }
  Hash[*result.flatten]
end

def apply_theme_to_iterm_profile_idx(index, color_scheme_path)
  values = Array.new
  16.times { |i| values << "Ansi #{i} Color" }
  values << ['Background Color', 'Bold Color', 'Cursor Color', 'Cursor Text Color', 'Foreground Color', 'Selected Text Color', 'Selection Color']
  values.flatten.each { |entry| run %{ /usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':#{index}:'#{entry}'" ~/Library/Preferences/com.googlecode.iterm2.plist } }

  run %{ /usr/libexec/PlistBuddy -c "Merge '#{color_scheme_path}' :'New Bookmarks':#{index}" ~/Library/Preferences/com.googlecode.iterm2.plist }
  run %{ defaults read com.googlecode.iterm2 }
end

def success_msg(action)
  puts ""
  puts "   _     _           _         "
  puts "  | |   | |         | |        "
  puts "  | |___| |_____  __| | ____   "
  puts "  |_____  (____ |/ _  |/ ___)  "
  puts "   _____| / ___ ( (_| | |      "
  puts "  (_______\_____|\____|_|      "
  puts ""
  puts "YADR has been #{action}. Please restart your terminal and vim."
end
