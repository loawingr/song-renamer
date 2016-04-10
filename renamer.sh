# regex s/(1)/(2)/flag means search for pattern (1) and replace it with pattern (2)
SONGS="*.mp3"
for song in $SONGS
do
 
 # globally remove numbers
 newname=`echo "$song" | sed 's/[[:digit:]]//g'`

 #trim leading spaces
 newname=`echo "$newname" | sed 's/^ *//'`

 #trim trailing spaces
 newname=`echo "$newname" | sed 's/* $//'`

 #remove leading dash
 newname=`echo "$newname" | sed 's/^-//'`

 #remove leading period
 newname=`echo "$newname" | sed 's/^\.//'`

 #globally replace multiple spaces with one space
 newname=`echo "$newname" | sed 's/ \+/ /gp'`

 #globally replace spaces with underscore
 newname=`echo "$newname" | sed 's/[[:space:]]/\_/g'`

 #remove leading underscore
 newname=`echo "$newname" | sed 's/^_//'`

 #remove parenthesis
 newname=`echo "$newname" | sed 's/[()]//g'`

 #remove brackets
 newname=`echo "$newname" | sed 's/[][]//g'`

 #convert to lowercase
 newname=`echo "$newname" | sed -e 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`

 #replace ft. with ft
 newname=`echo "$newname" | sed 's/ft\./ft/'`

 #extension remains .mp3
 newname=`echo "$newname" | sed 's/\.mp$/\.mp3/'`

 #replace _-_ with -
 newname=`echo "$newname" | sed 's/_\-_/\-/'`

 #replace deadmau- with deadmau5-
 newname=`echo "$newname" | sed 's/deadmau_/deadmau5_/'`
 echo "Compare names:"
 echo "$song"
 echo "$newname \n"
 mv -i -v "${song}" "${newname}"
done

