#!bin/bash

__propertree_helper_install_propertree() {
    if command -v git >/dev/null 2>&1; then
        (
            echo '=== Installing ProperTree....'
            rm -rf "$HOME/.config/propertree"
            mkdir -p "$HOME/.config/"
            cd "$HOME/.config/"
            git clone https://github.com/corpnewt/ProperTree --depth=10 propertree
            chmod +x ./propertree/ProperTree.command
            echo "=== ProperTree installed!"
        )
    else
        echo '=== Git is not detected. Please Install Git first!'
    fi
}

__propertree_helper_update_propertree() {
    if command -v git >/dev/null 2>&1; then
        (
            echo "=== Updating ProperTree..."
            cd "$HOME/.config/propertree"
            git pull
            chmod +x ./ProperTree.command
        )
    else
        echo '=== Git is not detected. Please Install Git first!'
    fi
}

propertree() {
    case "$1" in

    update)
        __propertree_helper_update_propertree
        ;;

    uninstall)
        echo -n '=== Uninstalling ProperTree... '
        rm -rf "$HOME/.config/propertree"
        sleep 2
        echo 'Done!'
        ;;

    help)
        echo "Usage: propertree <command>"
        echo ""
        echo "Commands:"
        echo "   [path/to/plist]   Edit plist file with ProperTree"
        echo "   update            Update ProperTree"
        echo "   uninstall         Uninstall ProperTree"
        echo "   help              Show help message"
        ;;

    *)
        echo ""

        case "$(uname -s)" in

        Darwin)
            if command -v python3 >/dev/null 2>&1; then
                if [ ! -f "$HOME/.config/propertree/ProperTree.command" ]; then
                    echo '=== ProperTree is not found!'
                    echo -n "Do you want to install ProperTree now?? [y/N] "
                    read -r __propertree_helper_read_install

                    case "$__propertree_helper_read_install" in

                    [yY][eE][sS] | [yY])
                        __propertree_helper_install_propertree
                        ;;
                    *)
                        return 0
                        ;;
                    esac
                else
                    TK_SILENCE_DEPRECATION=1 $HOME/.config/propertree/ProperTree.command "$@"
                fi
            else
                echo '=== python3 is not detected. Please Install python3 first!'
                return 1
            fi
            ;;

        Linux)
            echo '=== ProperTree is not supported on Linux!!'
            ;;

        CYGWIN* | MINGW32* | MSYS*)
            if command -v python3 >/dev/null 2>&1; then
                if [ ! -f "$HOME/.config/propertree/ProperTree.bat" ]; then
                    echo '=== ProperTree is not found!'
                    echo -n "Do you want to install ProperTree now?? [y/N] "
                    read -r __propertree_helper_read_install

                    case "$__propertree_helper_read_install" in

                    [yY][eE][sS] | [yY])
                        __propertree_helper_install_propertree
                        ;;
                    *)
                        return 0
                        ;;
                    esac
                else
                    TK_SILENCE_DEPRECATION=1 $HOME/.config/propertree/ProperTree.bat "$@"
                fi
            else
                echo '=== python3 is not detected. Please Install python3 first!'
                return 1
            fi
            ;;

        esac
        ;;
    esac
}
