pwd=$(pwd)
filename=$1
folder=$2
branch_name=$3

while read -r repo; do
    # Reading each line
    if [[ -d "$folder/$repo" ]]; then
        # shellcheck disable=SC2164
        cd "$folder/$repo"
        echo "###############################################################"
        echo "Preparing changes for $repo..."

        git checkout HEAD .

         git checkout develop
         git pull

        exists=$(git show-ref refs/heads/"$branch_name")

        if [ ! -n "$exists" ]; then
           git checkout -b "$branch_name"
        else
            git checkout "$branch_name"
        fi


         if [[ "$repo" = "repo_name1"  || "$repo" = "repo_name2" || "$repo" = "repo_name3" ]]; then
             sed -i '' "s/<STRING_TO_SEARCH>/<REPLACEMENT_STRING>/g" "$FILE_TO_CHANGE"
         elif [ "$repo" = "repo_name4" ]; then
             sed -i '' "s/<STRING_TO_SEARCH>/<REPLACEMENT_STRING>/g" "$FILE_TO_CHANGE"
         else
             sed -i '' "s/<STRING_TO_SEARCH>/<REPLACEMENT_STRING>/g" "$FILE_TO_CHANGE"
         fi


        sed -i '' "s/<STRING_TO_SEARCH>/<REPLACEMENT_STRING>/g" "$FILE_TO_CHANGE"

        git add .
        git commit -m "Multichanges applied."


        remoteExists=$(git ls-remote --heads origin "$branch_name")
        if [ ! -n "$remoteExists" ]; then
            git push -u origin "$branch_name"
        else
            git push
        fi

        echo "Complete!!"
        echo " "
    fi

    # shellcheck disable=SC2164
    cd "$pwd"
done < "$filename"

echo "==============================================================="
echo "Process complete!"