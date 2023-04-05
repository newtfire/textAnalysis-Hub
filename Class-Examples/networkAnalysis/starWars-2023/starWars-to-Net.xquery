let $starWarsColl := collection('ner-xml/?select=*.xml')
let $names := $starWarsColl//name => distinct-values()
return $names