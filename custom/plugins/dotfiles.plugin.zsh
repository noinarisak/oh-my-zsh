function dotfiles {
	#create symbolic link
        for f in `find . -maxdepth 1 -type f \( ! -iname "." ! -iname ".git" ! -iname ".DS_Store" ! -iname "*.txt" ! -iname "*.text*" ! -iname "*.sh" ! -iname "*.md" \)`; do
                echo $PWD"${f#.}" $HOME"${f#.}"
                #ln -fs $PWD"${f#.}" $HOME"${f#.}"
        done
}
