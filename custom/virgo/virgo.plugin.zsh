# based on mvn plugin, by jonathanpullano
export BOLD=`tput bold`
export UNDERLINE_ON=`tput smul`
export UNDERLINE_OFF=`tput rmul`
export TEXT_BLACK=`tput setaf 0`
export TEXT_RED=`tput setaf 1`
export TEXT_GREEN=`tput setaf 2`
export TEXT_YELLOW=`tput setaf 3`
export TEXT_BLUE=`tput setaf 4`
export TEXT_MAGENTA=`tput setaf 5`
export TEXT_CYAN=`tput setaf 6`
export TEXT_WHITE=`tput setaf 7`
export BACKGROUND_BLACK=`tput setab 0`
export BACKGROUND_RED=`tput setab 1`
export BACKGROUND_GREEN=`tput setab 2`
export BACKGROUND_YELLOW=`tput setab 3`
export BACKGROUND_BLUE=`tput setab 4`
export BACKGROUND_MAGENTA=`tput setab 5`
export BACKGROUND_CYAN=`tput setab 6`
export BACKGROUND_WHITE=`tput setab 7`
export RESET_FORMATTING=`tput sgr0`
 
# Wrapper function for Virgo's startup command.
s()
{
  ${VIZZ_SERVER_HOME}/bin/startup.sh -clean -debug $@ | sed -e "s/^\(\[[^]]*\] INFO.*\)$/${BOLD}${TEXT_BLUE}\1${RESET_FORMATTING}/g" \
               -e "s/^\(\[[^]]*\] WARN.*\)$/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
               -e "s/^\(\[[^]]*\] ERROR.*\)$/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
               -e "s/^\(\[[^]]*\] DEBUG.*\)$/${BOLD}${TEXT_CYAN}\1${RESET_FORMATTING}/g" 
 
  # Make sure formatting is reset
  echo -ne ${RESET_FORMATTING}
}
 
k()
{
  virgoid=`ps ax | grep virgo | grep -v grep | grep -v maven | grep -v vim | awk -F" " '{ print $1 }' | head -n 1`;
  [ ! -z "$virgoid" ] && kill -9 "$virgoid";
}
