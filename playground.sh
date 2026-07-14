num=0
out=""
while IFS= read -r line; do
    num=$(( num + 1 ))
    out+="$num: $line"$'\n'
done < <(awk '{ print $2 }' "$HOME/.reminders")
echo "$out"
