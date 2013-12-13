function dotfiles {

   if (( $# == 0 )); then
      echo "Usage: dotfiles [-action]"
      echo
      echo Options:
      echo "    -n, --dry-run    Dry run."
      echo "    -i, --install    Apply symbolic link."
      echo "    -u, --uninstall  Remove symbolic link."
      echo
      echo "Report bugs to noi.narisak@gmail.com"
   fi

	#create symbolic link
   for f in `find . -maxdepth 1 -type f \( ! -iname "." ! -iname ".git" ! -iname ".DS_Store" ! -iname "*.txt" ! -iname "*.text*" ! -iname "*.sh" ! -iname "*.md" \)`; do

      if [[ "$1" == "-n" ]] || [[ "$1" == "--dry-run" ]]; then
         echo "dry-runing..."
         echo "ln -fs" $PWD"${f#.}" $HOME"${f#.}"
      fi      
      
      if [[ "$1" == "-i" ]] || [[ "$1" == "--install" ]]; then
         echo "applying..."
         #ln -fs $PWD"${f#.}" $HOME"${f#.}"
      fi        
       
      if [[ "$1" == "-u" ]] || [[ "$1" == "--uninstall" ]]; then
         #//TODO: Retain the list of the dotfiles and validate if they are the same on in the oh-my-zsh root.  
         echo "removing..."
         echo "//TODO: Implement me, uninstall"
         echo $PWD"${f#.}" $HOME"${f#.}"
      fi      
      
   done
}
