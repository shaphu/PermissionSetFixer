
#!/bin/bash
####Loop for each fields

for field in $(cat fields.txt); do
  echo "Field to process: $field"

  for i in permissionsets/*
  do
    echo "PermSet file: $i"
    echo "Start processing ...."
    #echo "xml ed -d "//_:classAccesses[_:apexClass = "\"$field"\"]" $i > new/$i"
    xml ed -d "//_:classAccesses[_:apexClass = "\"$field"\"]" $i > new/$i
    echo "Completed processing ...."
  done
  rm -fv permissionsets/*
  mv -fv new/permissionsets/* permissionsets/
done
