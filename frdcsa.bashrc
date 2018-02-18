alias reload-frdcsa="source /var/lib/myfrdcsa/codebases/minor/myfrdcsa/scripts/reload-frdcsa.sh"

if [ ! $FRDCSA_LOADED ] || [ ! $LS_COLORS ]; then

    function source_if_available {
	if [ -f $1 ]; then
	    source $1
	else
	    echo "Can't source" $1
	fi
    }

    # # enable color support of ls in emacs
    # if [ "$EMACS" == "t" ]; then
    # eval "`dircolors -b`"
    # alias ls='ls --color=auto'
    # fi

    # enable color support of ls and also add handy aliases
    if [ "$TERM" != "dumb" ] || [ "$EMACS" == "t" ]; then
	if [ "$TERM" = "dumb" ]; then
	    export TEMP_TERM="dumb"
	    export TERM="xterm-debian"
	fi
	eval "`dircolors -b`"
	if [ "$TEMP_TERM" = "xterm-debian" ]; then
	    export TEMP_TERM=
	    export TERM="dumb"
	fi

	# if [ -f "$HOME/.mydircolors" ] ; then
	# 	export LS_COLORS=`dircolors -b "$HOME/.mydircolors"`
	# fi

	alias ls='ls --color=auto'
	#alias dir='ls --color=auto --format=vertical'
	#alias vdir='ls --color=auto --format=long'
    fi

    # source_if_available /var/lib/myfrdcsa/sandbox/assert-0.14/assert-0.14/.bashrc
    source_if_available /var/lib/myfrdcsa/codebases/internal/manager/systems/todo/todo.bashrc

    export EDITOR=emacsclient
    export HISTSIZE=50000
    export HISTFILESIZE=500000
    export JAVA_HOME=/usr/lib/jvm/default-java
    export JDK_HOME=/usr/lib/jvm/default-java
    # export JAVA_HOME=/usr/lib/jvm/`ls /usr/lib/jvm/ | grep java-6-sun- | head -n 1
    # export JDK_HOME=/usr/lib/jvm/`ls /usr/lib/jvm/ | grep java-6-sun- | head -n 1`

    # export FRDCSA_HOME="/var/lib/myfrdcsa"
    # export FRDCSA_CODEBASES="$FRDCSA_HOME/codebases"
    # export FRDCSA_INTERNAL_CODEBASES="$FRDCSA_CODEBASES/internal"
    # export FRDCSA_EXTERNAL_CODEBASES="$FRDCSA_CODEBASES/external"
    # export FRDCSA_MINOR_CODEBASES="$FRDCSA_CODEBASES/minor"
    # export FRDCSA_WORK="$FRDCSA_CODEBASES/work"
    # export FRDCSA_WORK_CLIENTS="$FRDCSA_WORK/clients"
    # export FRDCSA_WORK_WORK="$FRDCSA_WORK/work"
    # export FRDCSA_PROJECTS="$FRDCSA_HOME/projects"
    # export FRDCSA_SANDBOX="$FRDCSA_HOME/sandbox"
    # export FRDCSA_RELEASES="$FRDCSA_CODEBASES/releases"
    # export FRDCSA_COLLECTIONS="$FRDCSA_HOME/collections"
    # export FRDCSA_REPOSITORIES="$FRDCSA_HOME/repositories"
    # export FRDCSA_REPOSITORIES_CVS="$FRDCSA_REPOSITORIES/cvs"
    # export FRDCSA_REPOSITORIES_GIT="$FRDCSA_REPOSITORIES/git"
    # export FRDCSA_REPOSITORIES_SVN="$FRDCSA_REPOSITORIES/svn"
    # export FRDCSA_PACKAGES="$FRDCSA_HOME/packages"
    # export FRDCSA_DATASETS="$FRDCSA_HOME/datasets"
    # export FRDCSA_PARTIAL_PACKAGES="$FRDCSA_PACKAGES/partial"
    # export FRDCSA_BINARY_PACKAGES="$FRDCSA_PACKAGES/binary"
    # export FRDCSA_SOURCE_PACKAGES="$FRDCSA_PACKAGES/source"
    # export FRDCSA_EL_DIR="$FRDCSA_INTERNAL_CODEBASES/frdcsa-el"

    export GATE_PATH=/var/lib/myfrdcsa/sandbox/gate-5.0/gate-5.0

    # alias dothing="for it in `ls *.html`; do export IT2=`echo $it | sed -e 's/\.html//'`; w3m -dump $IT2.html > $IT2.txt ; done"
    alias git="git --no-pager"
    alias pa-sinks="pacmd list-sinks | grep -E '(\sindex|\sname)'"
    alias pa-sources="pacmd list-sources | grep -E '(\sindex|\sname)'"
    alias isd='install-script-dependencies-2'
    alias flora=/var/lib/flora2/runflora
    alias flora2="cd /var/lib/myfrdcsa/codebases/minor/rayon/flora2 && flora -e '[frdcsa].'"
    alias ftw="cd /var/lib/myfrdcsa/codebases/minor/rayon/flora2 && flora -e '[what_to_do].'"
    alias flrflp="cd /var/lib/myfrdcsa/codebases/minor/free-life-planner && flora -e '[free_life_planner].'"
    alias perlinc="perl -e 'print join(\"\\n\",@INC)'"
    alias scpr="rsync -P --rsh=ssh"
    alias myplayer='mplayer -alang eng -cache 8192 -lavdopts threads=2:fast:skiploopfilter=all -framedrop hard'
    alias mynosound='mplayer -nosound -alang eng -cache 8192 -lavdopts threads=2:fast:skiploopfilter=all -framedrop hard'
    alias s='grep /media/andrewdo/s3/logicmoo-2/logicmoo.org/cynd/withvars.pl -ie '
    alias l='ls -alrt '
    alias ltn='ls -alrt | tail -n 10'
    alias fig='find . | grep '
    alias ff='firefox -P -no-remote'
    alias dusort='du -m -s * | sort -n'
    # alias a='' # what was I thinking this would do?
    alias mirror='wget -rlinf -np -x '

    function pvnp {
        find "$1" | grep '\.pl$' | perl-or-prolog -s
    }

    function lastline {
	ls -art1 $1 | tail -n1
    }

    if [ -x /usr/local/WordNet-3.0/dict ]; then
	export WNHOME=/usr/local/WordNet-3.0/dict
	export WNSEARCHDIR=/usr/local/WordNet-3.0/dict
    elif [ -x /usr/share/wordnet ]; then
	export WNHOME=/usr/share/wordnet
	export WNSEARCHDIR=/usr/share/wordnet
    fi

    function has_truth_value {
        if $1 ; then
 	   echo true
	else
	   echo false
	fi
    }

    function guard_on {
        export DISABLE_GUARDIAN=
    }

    function guard_off {
        export DISABLE_GUARDIAN=1
    }

    export MYTEST=$MYTEST:1

    export CATALINA_HOME=/usr/share/tomcat5.5
    export GRADLE_HOME=/var/lib/myfrdcsa/sandbox/gradle-3.2.1/gradle-3.2.1

    # export PERL5LIB=$PERL5LIB:/usr/local/share/perl/5.10.0:/usr/local/lib/perl/5.10.0
    export PATH=$PATH:$HOME/bin:/var/lib/myfrdcsa/codebases/internal/myfrdcsa/bin:`/var/lib/myfrdcsa/codebases/internal/myfrdcsa/scripts/list-script-dirs.pl`
    export PATH=$PATH:/var/lib/myfrdcsas/versions/myfrdcsa-1.1/vagrant-machines/bin
    export PATH=$PATH:/var/lib/xsb/bin:/var/lib/myfrdcsa/sandbox/eclipse-basic-20160110/eclipse-basic-20160110/bin/x86_64_linux
    export PATH=$PATH:$GRADLE_HOME/bin

    source /var/lib/myfrdcsa/codebases/minor/execution-engine/frdcsa/execution-engine.bashrc

    export PERL_INLINE_JAVA_DIRECTORY="~/_Inline"

    export FRDCSA_LOADED=1

    export PROMPT_COMMAND=/var/lib/myfrdcsa/codebases/minor/guardian/scripts/guard-repl

    export MINIPATH=.:/var/lib/myfrdcsa/sandbox/minipar-0.5/minipar-0.5/data

    export GOPATH=/home/andrewdo/gocode

    source /var/lib/myfrdcsa/codebases/internal/myfrdcsa/frdcsa-helper.sh

    /var/lib/myfrdcsa/codebases/minor/guardian/scripts/guard-bash

fi

