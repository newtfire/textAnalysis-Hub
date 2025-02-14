# Mulan Steps

'[\D\d]+'
    '<xml>\0</xml>'

'(\n{2})(.+?)'
    '\1<sp>\2'
    
'<sp>'
    '</sp>\0'