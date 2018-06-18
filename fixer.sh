
#!/bin/bash
# echo "Running script"
# for i in permissionsets/*
# do
#   echo "PermSet file: $i"
#   for field in $(cat fields.txt); do
#     echo "Field to process: $field"
#     # xml ed -d '//_:classAccesses[_:apexClass = "$field"]' $i > new/$i
#     xml ed -d '//_:classAccesses[_:apexClass = "APAC_CampaignLogicUtilitiesTestClass"]' $i >> new/$i
#     xml ed -d '//_:classAccesses[_:apexClass = "APAC_CampaignPropertyTriggerHelper"]' $i >> new/$i
#   done
#   # mv -fv new/permissionsets/* permissionsets/
# done


# for i in permissionsets/*
#  do
#     xml ed -d "//_:fieldPermissions[_:field = 'CIM_Contact_Outbound__c.MasterSourceSystemID__c']" $i > new/$i
#     # xml ed -d '//_:classAccesses[_:apexClass = "AliasTest"]' $i > new/$i
#  done
# mv -fv new/permissionsets/* permissionsets/


####Loop for each fields

for field in $(cat fields.txt); do
  echo "Field to process: $field"

  for i in permissionsets/*
  do
    echo "PermSet file: $i"
    echo "Start processing ...."
    echo "xml ed -d "//_:classAccesses[_:apexClass = "\"$field"\"]" $i > new/$i"
    xml ed -d "//_:classAccesses[_:apexClass = "\"$field"\"]" $i > new/$i
    echo "Completed processing ...."
  done
  rm -fv permissionsets/*
  mv -fv new/permissionsets/* permissionsets/
done