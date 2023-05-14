    #!/usr/bin/env bash

    if [ "$(whoami)" != 'root' ]; then
            echo $"You have no permission to run $0 as non-root user. Use sudo"
            exit 1;
    fi

    if [ $# -lt 2 ]; then
            printf "Usage: fix-permission.sh {DIRECTORY} {USER:GROUP}\n";
            exit 1;
    fi

    dir=$1
    ug=$2

    # chown
    find $dir -type d -not -path "$dir/node_modules" -not -path "$dir/node_modules/*" -not -path "$dir/**/node_modules" -not -path "$dir/**/node_modules/*" -not -path "$dir/vendor" -not -path "$dir/vendor/*" -not -path "$dir/**/vendor" -not -path "$dir/**/vendor/*" -exec chown $ug {} +
    find $dir -type f -not -path "$dir/node_modules" -not -path "$dir/node_modules/*" -not -path "$dir/**/node_modules" -not -path "$dir/**/node_modules/*" -not -path "$dir/vendor" -not -path "$dir/vendor/*" -not -path "$dir/**/vendor" -not -path "$dir/**/vendor/*" -exec chown $ug {} +

    #chmod
    find $dir -type d -not -path "$dir/node_modules" -not -path "$dir/node_modules/*" -not -path "$dir/**/node_modules" -not -path "$dir/**/node_modules/*" -not -path "$dir/vendor" -not -path "$dir/vendor/*" -not -path "$dir/**/vendor" -not -path "$dir/**/vendor/*" -exec chmod 0775 {} +
    find $dir -type f -not -path "$dir/node_modules" -not -path "$dir/node_modules/*" -not -path "$dir/**/node_modules" -not -path "$dir/**/node_modules/*" -not -path "$dir/vendor" -not -path "$dir/vendor/*" -not -path "$dir/**/vendor" -not -path "$dir/**/vendor/*" -exec chmod 0664 {} +

    printf "Done\n"