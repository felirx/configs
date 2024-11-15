if type -q /opt/homebrew/bin/brew
    eval $(/opt/homebrew/bin/brew shellenv)
    fish_add_path "/opt/homebrew/opt/openjdk@21/bin"
    export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
end
