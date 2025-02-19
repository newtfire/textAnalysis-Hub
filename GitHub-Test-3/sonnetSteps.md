#  Sonnet Conversion Steps

## Steps to Convert Text to XML

### Step 1: Remove Unnecessary Text
- Deleted the Project Gutenberg headers and footers to isolate the sonnets.
- Removed text before *START OF THIS PROJECT GUTENBERG EBOOK SHAKESPEARE'S SONNETS* and after *END OF THIS PROJECT GUTENBERG EBOOK SHAKESPEARE'S SONNETS*.

### Step 2: Identify and Process Each Sonnet
- Used regex to detect Roman numerals indicating sonnet numbers.
- Started a new `<sonnet>` element for each detected numeral and assigned it a `number` attribute.

### Step 3: Tag Each Line
- Wrapped each line of poetry inside `<line>` tags using regex.
- Ensured that only non-empty lines were tagged.

### Step 4: Close Sonnet Tags
- After processing all lines of a sonnet, inserted a closing `</sonnet>` tag before the next sonnet began.

### Step 5: Wrap in Root XML Element
- Enclosed all `<sonnet>` elements within a root `<xml>` element.

## Sample Sonnet XML
```xml
<sonnet number="I">
    <line>From fairest creatures we desire increase,</line>
    <line>That thereby beauty's rose might never die,</line>
    <line>But as the riper should by time decease,</line>
    <line>His tender heir might bear his memory:</line>
    <line>But thou, contracted to thine own bright eyes,</line>
    <line>Feed’st thy light’s flame with self-substantial fuel,</line>
    <line>Making a famine where abundance lies,</line>
    <line>Thy self thy foe, to thy sweet self too cruel:</line>
    <line>Thou that art now the world's fresh ornament,</line>
    <line>And only herald to the gaudy spring,</line>
    <line>Within thine own bud buriest thy content,</line>
    <line>And tender churl mak’st waste in niggarding:</line>
    <line>Pity the world, or else this glutton be,</line>
    <line>To eat the world's due, by the grave and thee.</line>
</sonnet>
<sonnet number="II">
    <line>When forty winters shall besiege thy brow,</line>
    <line>And dig deep trenches in thy beauty's field,</line>
    <line>Thy youth’s proud livery so gazed on now,</line>
    <line>Will be a tatter’d weed of small worth held:</line>
    <line>Then being asked, where all thy beauty lies,</line>
    <line>Where all the treasure of thy lusty days;</line>
    <line>To say, within thine own deep sunken eyes,</line>
    <line>Were an all-eating shame, and thriftless praise.</line>
    <line>How much more praise deserv’d thy beauty’s use,</line>
    <line>If thou couldst answer 'This fair child of mine</line>
    <line>Shall sum my count, and make my old excuse,'</line>
    <line>Proving his beauty by succession thine!</line>
    <line>This were to be new made when thou art old,</line>
    <line>And see thy blood warm when thou feel’st it cold.</line>
</sonnet>
```

## Key Takeaways
- Regular expressions help automate XML conversion.
- XML structure should be validated before use.
- Proper XML tagging ensures readability and organization.
- Converting structured text preserves meaning and context.
- Using XML allows for better data management and processing.

