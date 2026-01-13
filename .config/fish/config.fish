if status is-interactive
    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config '~/.config/ohmyposh/zen.toml' | source
end

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/env.fish
