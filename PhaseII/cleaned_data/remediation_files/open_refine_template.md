# Open Refine Template for Dutch Roth - Phase II


## Template

#### Prefix

```
<?xml version="1.0" encoding="UTF-8"?>
<modsCollection xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
```
####Body

```
<mods>
<identifier type="local">{{cells["filename"].value}}</identifier>
{{if(isBlank(cells["title"].value),'', '<titleInfo><title>' + cells['title'].value + '</title></titleInfo>')}}
{{if(isBlank(cells["title"].value),'', '<note displayLabel="Transcribed from Original Collection">' + cells['title'].value + '</note>')}}
{{if(isBlank(cells['date_text'].value), '', '<originInfo><dateCreated>' + cells['date_text'].value + '</dateCreated></originInfo>')}}
{{'<physicalDescription>' + '<extent>' + cells['extent'].value + '</extent><form authority="aat" valueURI="' + cells['form_URI'].value + '">' + cells['form'].value + '</form>' + '<internetMediaType>image/jpeg</internetMediaType><digitalOrigin>reformatted digital</digitalOrigin></physicalDescription>'}}
{{if(isBlank(cells['name'].value), '', '<name valueURI="' + cells['name_URI'].value + '"><namePart>' + cells['name'].value + '</namePart>' + if(isBlank(cells['name'].value), '', '<role><roleTerm authority="marcrelator" valueURI="http://id.loc.gov/vocabulary/relators/pht">Photographer</roleTerm></role>') + '</name>')}}
{{if(isBlank(cells["public_note"].value),'', '<note>' + cells['public_note'].value + '</note>')}}
<accessCondition type="use and reproduction" xlink:href="{{cells['rights_URI'].value}}">{{cells['rights'].value}}</accessCondition>
<subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85057008"><geographic>Great Smoky Mountains (N.C. and Tenn.)</geographic></subject>
<language><languageTerm type="code" authority="iso639-2b">{{cells['language'].value}}</languageTerm></language>
<relatedItem displayLabel="Project" type="host"><titleInfo><title>{{cells['project_title'].value}}</title></titleInfo></relatedItem>
<relatedItem displayLabel="Collection" type="host"><titleInfo><title>{{cells['collection'].value}}</title></titleInfo><identifier>{{cells['collection_identifier'].value}}</identifier><location><url>{{cells['ARK'].value}}</url></location></relatedItem>
<location><physicalLocation valueURI="http://id.loc.gov/authorities/names/no2014027633">University of Tennessee, Knoxville. Special Collections</physicalLocation></location>
<recordInfo><recordContentSource valueURI="http://id.loc.gov/authorities/names/n87808088">University of Tennessee, Knoxville. Libraries</recordContentSource><languageOfCataloging><languageTerm authority= "iso639-2b">eng</languageTerm></languageOfCataloging></recordInfo>
</mods>

```

#### Suffix

```
</modsCollection>
```