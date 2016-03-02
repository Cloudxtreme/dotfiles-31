# ~/bin/dotfiles/custom/ shell script
# The session name is also used as a session name

export session_name1="sys"
export session_name2="work"
# PROJECT_DIR="~/myproject"

tmux has-session -t $session_name1 2>/dev/null
if [ "$?" -eq 1 ] ; then
  echo "No session found. Creating and configuring."
  echo "session 1: ${session_name1}. Session 2: ${session_name2}."
  tmux new-session -s $session_name1 -n music -d
  tmux source-file ~/bin/dotfiles/custom/tmux/tmux.${session_name1}.conf
else
  echo "Session found."
fi
