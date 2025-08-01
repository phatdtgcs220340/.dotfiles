if status is-interactive
    starship init fish | source
    # Aliases
    function cat
        bat $argv
    end

    function v
        nvim $argv
    end

    # xclip
    function xcp
        xclip -selection clipboard $argv
    end

    function lzg
        lazygit $argv
    end

    # Run password script
    function pw
        ~/run-password.sh $argv
    end

    # Lazydocker
    function lzd
        lazydocker $argv
    end

    function clearbin
        rm -rf ~/.local/share/Trash/*
    end

    set -x NIX_CONFIG "experimental-features = nix-command flakes"

    # Env vars
    set -x NVM_DIR "$HOME/.nvm"

    # Load NVM (Fish-compatible alternative via plugin preferred)
    # You can use: https://github.com/jorgebucaran/nvm.fish instead
    if test -s "$NVM_DIR/nvm.sh"
        bass source $NVM_DIR/nvm.sh
    end

    if test -s "$NVM_DIR/bash_completion"
        bass source $NVM_DIR/bash_completion
    end

    # Java (only works if nix is installed and evaluated here)
    set -x JAVA_HOME (nix eval --raw nixpkgs#jdk21.home)
    
    function java
        $JAVA_HOME/bin/java $argv
    end

    function javac
        $JAVA_HOME/bin/javac $argv
    end

    set fish_greeting 

    set -x SWAY_BACKGROUND = $HOME/.dotfiles/images/skirk-landscape-1.png

    set -x XDG_CURRENT_DESKTOP "sway"
    set -x XDG_SESSION_TYPE "wayland"
    set -x XDG_SESSION_DESKTOP "sway"
    # Commands to run in interactive sessions can go here
        function g
        git $argv
    end

    function ga
        git add $argv
    end

    function gapa
        git add --patch $argv
    end

    function gaa
        git add --all $argv
    end

    function gb
        git branch $argv
    end

    function gba
        git branch -a $argv
    end

    function gcb
        git checkout -b $argv
    end

    function gco
        git checkout $argv
    end

    function gcmsg
        git commit -m $argv
    end

    function gcam
        git commit -a -m $argv
    end

    function 'gc!'
        git commit -v --amend $argv
    end

    function 'gcn!'
        git commit -v --no-edit --amend $argv
    end

    function gd
        git diff $argv
    end

    function gf
        git fetch $argv
    end

    function gl
        git pull $argv
    end

    function glog
        git log $argv
    end

    function gloga
        git log --oneline --decorate --graph --all $argv
    end

    function gm
        git merge $argv
    end

    function gp
        git push $argv
    end

    function gpsup
        git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)
    end

    function 'gpf!'
        git push --force $argv
    end

    function grb
        git rebase $argv
    end

    function grbi
        git rebase -i $argv
    end

    function grhh
        git reset --hard $argv
    end

    function grs
        git restore $argv
    end

    function gst
        git status $argv
    end

    function gss
        git status -s $argv
    end

    function gsta
        git stash push $argv
    end

    function gstp
        git stash pop $argv
    end

    function tmn
        tmux new -s $argv
    end
    
    function tma
        tmux attach
    end

    function ss
        systemctl suspend
    end

end
