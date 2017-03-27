# Open Refine Mapping

| Google Sheet Field | xpath location |
|-------------------|-----------------|
| filename | /identifier[@type="filename"] |
| title | /titleInfo/title |
| date_text | /originInfo/dateCreated |
| shelf_locator | **NOT IN DATA DICTIONARY** |
| public_note | /note |
| rights | /accessCondition |
| series | /relatedItem[@type="series"]/titleInfo/title |
| collection | /relatedItem[@displayLabel="Collection"][@type="host"]/titleInfo/title |
| collection_identifier | /relatedItem[@displayLabel="Collection"][@type="host"]/identifier |
| extent | /physicalDescription/extent |
| form | /physicalDescription/form[@authority="aat'][@valueURI="http://vocab.getty.edu/aat/300127173"] |
| project_title | /relatedItem[@displayLabel="Project"][@type="host"]/titleInfo/title |
| repository | /location/physicalLocation/ |

## Template

Below is the template I used for this project.

#### Prefix

```
<?xml version="1.0" encoding="UTF-8"?>
<modsCollection xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
```
####Body

```


<mods xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
<identifier type="filename">{{jsonize(cells["filename"].value).replace('"', '')}}</identifier>
<titleInfo><title>{{jsonize(cells["title"].value).replace('"', '')}}</title></titleInfo>
<originInfo><dateCreated>{{jsonize(cells["date_text"].value).replace('"', '')}}</dateCreated></originInfo>
<note>{{jsonize(cells["public_note"].value).replace('"', '')}}</note>
<accessCondition type="local rights statement">{{jsonize(cells["rights"].value).replace('"', '')}}</accessCondition>
<relatedItem type="series"><titleInfo><title>{{jsonize(cells["series"].value).replace('"', '')}}</title></titleInfo></relatedItem>
<relatedItem displayLabel="Collection" type="host"><titleInfo><title>{{jsonize(cells["collection"].value).replace('"', '')}}</title></titleInfo>
<identifier>{{jsonize(cells["collection_identifier"].value).replace('"', '')}}</identifier></relatedItem>
<physicalDescription><extent>{{jsonize(cells["extent"].value).replace('"', '')}}</extent></physicalDescription>
<physicalDescription><form authority="aat" valueURI="http://vocab.getty.edu/aat/300127173">{{jsonize(cells["form"].value).replace('"', '')}}</form></physicalDescription>
<relatedItem displayLabel="Project" type="host"><titleInfo><title>{{jsonize(cells["project_title"].value).replace('"', '')}}</title></titleInfo></relatedItem>
<location><physicalLocation>{{jsonize(cells["repository"].value).replace('"', '')}}</physicalLocation></location>
<name><namePart>Roth, Albert, 1890-1974</namePart><role><roleTerm type="text" authority="marcrelators" valueURI="http://id.loc.gov/vocabulary/relators/pht.html">Photographer</roleTerm></role></name>
</mods>

```

#### Suffix

```
</modsCollection>
```