# GriffithNewtonMaynard_ENV872_EDE_FinalProject


## Summary

This is the repository for the final project for three students in Environmental Data Exploration (ENV872) at Duke University NSOE. The repository holds raw data, processed data, individual and collective R Markdowns, and maps developed using R Shiny. The project served to analyze the rate of growth of MPAs in the United States over time, and to understand the implementation of levels of protection and management plans as new MPAs were established. It was completed in December 2023. 


## Investigators

Eric Newton, Duke Unviersity NSOE, eric.newton@duke.edu, Data wrangling and visualization
Maia Griffith, Duke University NSOE, maia.griffith@duke.edu, Data wrangling, visualization, and statistical analysis
Justin Maynard, Duke University NSOE, justin.maynard@duke.edu, Map creation and implementation in R Shiny


## Keywords

Marine Protected Areas, Management Plan, Level of Protection, 30x30, Marine Conservation


## Database Information

Data sourced from the National Oceanic Atmospheric Administration Marine Protected Area Inventory - https://marineprotectedareas.noaa.gov/dataanalysis/mpainventory/. Accessed 11/8/2023.


## Folder structure, file formats, and naming conventions 

'Code' - individual team member RMDs, Final Project RMD, and RShiny RMD

'DataRaw' - raw data sets downloaded from Natioal Oceanic and Atmospheric Adminsitration Marine Protected Area Inventory, including inventory data in .csv format and spatial data in a geodatabase.

'DataProcessed' - wrangled and cleaned inventory data in .csv format 

'Shiny' - contains Shiny App and Leaflet Test

Files are primarly in .csv format. Spatial data is in .gdb format. Files named with descriptive title and name of individual team member primarily contributing to file. 


## Metadata

| Column Name | Data Description | Data Class | Units |
|----------|----------|----------|----------|
| FID | Internal feature number | Integer | n/a |
| OBJECTID | Database object number | Integer | n/a |
| Site.ID | Unique site identifier assigned by MPAC | Factor | n/a |
| Site.Name | Official name of the MPA | Factor | n/a |
| Level.of.Government | Level of government responsible for designating and managing the site | Factor | n/a |	
| State | Status of the site with respect to the National System of MPAs | Factor | n/a |
| Level.of.Protection | Level of legal protection afforded to the site's natural and cultural resources and ecological processes | Factor | n/a |	
| Management.Agency | Agency responsible for managing the site | Factor | n/a |	
| Management.Plan | The type of management plan developed for the site | Factor | n/a |
| Primary.Conservation.Focus | Defines the primary characteristics of the area that the MPA was established to conserve | Factor | n/a |	
| Conservation.Focus | Defines the characteristics of the area that the MPA was established to conserve | Factor | n/a |
| Fishing.Restrictions | Level of restrictions on commercial and/or recreational fishing | Factor | n/a |
| Protection.Focus | Ecological scale of site conservation targets | Factor | n/a |
| Permanence | Classification of the permanence of the site | Factor | n/a |
| Constancy | Classification of the constancy of the site protections throughout the year | Factor | n/a |	
| Year.Established | The year the site was officially designated or established | n/a |  
| Anchor | Describes whether anchoring in the site is permitted. | Factor | n/a |
| Vessel | Describes if vessel access is allowed within the MPA. | Factor | n/a |
| IUCN_MPA | Status of MPA recognized by IUCN | Integer | n/a |
| IUCN.category | Category of MPA designated by IUCN | Factor | n/a |	
| Category | Describes status of  | Factor | n/a |	
| Marine.Status | Describes the division between marine and terrestial environments with the MPA | Factor | n/a |	
| URL | Website for the MPA created by the managing agency | Factor | n/a |	
| WDPA_Cd | World Database on Protected Areas MPA ID | Integer | n/a |	
| ProSeasID | ProSeas MPA ID | Factor | n/a |	
| Designation | Defines category of MPA as designated by National Park Service | Factor | n/a | 
| Area..km2. | Area of the protected area in square kilometers, including any terrestrial portions, where applicable  | Number | km2 |	
| Marine.Area..km2. | Area of the marine component of the protected area in square kilometers. This value is unofficial, calculated by clipping the polygon to the NOAA Medium Resolution (~80k) shoreline polygon. | Number | km2 |	
| Percent.Area.Marine | Defines the area of the MPA within marine environment | Integer | n/a |	
| No.Take.Area..km2. |  Defines the area of the MPA designated as a No Take area | Number | km2 |	
| Longitude | Longitude | Number | degree |	
| Latitude | Latitude |Number  | degree |	
| VxCount | Vertices for line or polygon features | Integer | n/a |	
| SHAPE_Leng | Feature geometry | Number | grid cell |	
| SHAPE_Area |  Feature geometry| Number | grid cell |	
| Shape__Area | Feature geometry | Number | meters |	
| Shape__Length | Feature geometry | Number | meters |	
			

## Scripts and code

'Project_Template' - Final project report with R shiny included.

'Copy_Proj_Template.Rmd' - Copy of final project report with R shiny included.

'Final_Project' - Final project with R shiny link'

'Eric_MPA_Final_Markdown' - Eric Newton's individual RMD file. 

'Maia_MPA_Final_Markdown' - Maia Griffith's individual RMD file.

'Justin_MPA_Final_Markdown' - Justin Maynard's individual RMD file.

'JustinShiny' - Maps created by Justin Maynard using R Shiny.


## Quality assurance/quality control

Workflow documented with comments within code chunks. Location of the original data set noted. Website noted in the code and README file. Data wrangling described in code chunks. File names with the repository assigned descriptive names.

