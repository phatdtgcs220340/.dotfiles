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

    # Commands to run in interactive sessions can go here
end
