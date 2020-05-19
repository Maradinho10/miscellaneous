filename=$1
folder=$2

cd "$folder" || { echo "Path doesn't exist"; exit;}
while read -r repo; do
    # Reading each line
    if [ ! -d "$folder/$repo" ]; then
        echo "Cloning repo $repo..."
        username="<CHANGE_THIS>"
        gitURL="https://github.com/$username/$repo.git"
        git clone "$gitURL" folder
    fi
done < "$filename"

