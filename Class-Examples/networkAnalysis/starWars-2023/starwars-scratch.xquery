let $starWarsColl := collection('ner-xml/?select=*.xml')
for $m in $starWarsColl
return $m ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')