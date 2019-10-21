Pump it up - Predicting faulty pumps
================
Arun Marria
19/10/2019

The project uses data from [Taarifa](http://taarifa.org/) and [the
Tanzanian Ministry of
Water](https://www.drivendata.org/competitions/7/pump-it-up-data-mining-the-water-table/),
to predict water which pumps are functional, which need some repairs,
and which don’t work at all. I came across this problem and dataset from
one of the machine learning competition hosted by
[datadriven.org](https://www.drivendata.org/competitions/7/pump-it-up-data-mining-the-water-table/).

## Table of Contents

  - [Loading data and required
    libraries](#Loading%20data%20and%20required%20packages)

### Loading data and required packages

Loading the libraries which I’ll be using through out the project.

``` r
#loading libraries 
library(dplyr)
library(ggplot2)
library(readr)
library(tidyverse)
library(knitr)
```

Reading data from `csv`
files.

``` r
test_df <- read_csv("../data/testFeatures.csv") # test data for ranking in competition
pumps_df <- read_csv("../data/trainFeatures.csv")
temp_df <- read_csv("../data/trainLabels.csv") 
pumps_df <- merge(pumps_df, temp_df, by = "id" ) #actual data for train

kable(pumps_df[1:5,])
```

| id | amount\_tsh | date\_recorded | funder          | gps\_height | installer | longitude |   latitude | wpt\_name      | num\_private | basin           | subvillage | region      | region\_code | district\_code | lga      | ward             | population | public\_meeting | recorded\_by            | scheme\_management | scheme\_name           | permit | construction\_year | extraction\_type  | extraction\_type\_group | extraction\_type\_class | management  | management\_group | payment        | payment\_type | water\_quality | quality\_group | quantity     | quantity\_group | source       | source\_type | source\_class | waterpoint\_type            | waterpoint\_type\_group | status\_group  |
| -: | ----------: | :------------- | :-------------- | ----------: | :-------- | --------: | ---------: | :------------- | -----------: | :-------------- | :--------- | :---------- | -----------: | -------------: | :------- | :--------------- | ---------: | :-------------- | :---------------------- | :----------------- | :--------------------- | :----- | -----------------: | :---------------- | :---------------------- | :---------------------- | :---------- | :---------------- | :------------- | :------------ | :------------- | :------------- | :----------- | :-------------- | :----------- | :----------- | :------------ | :-------------------------- | :---------------------- | :------------- |
|  0 |           0 | 2012-11-13     | Tasaf           |           0 | TASAF     |  33.12583 | \-5.118154 | Mratibu        |            0 | Lake Tanganyika | Majengo    | Tabora      |           14 |              3 | Uyui     | Igalula          |          0 | NA              | GeoData Consultants Ltd | VWC                | NA                     | TRUE   |                  0 | afridev           | afridev                 | handpump                | vwc         | user-group        | unknown        | unknown       | milky          | milky          | enough       | enough          | shallow well | shallow well | groundwater   | hand pump                   | hand pump               | non functional |
|  1 |           0 | 2011-03-05     | Shipo           |        1978 | SHIPO     |  34.77072 | \-9.395641 | none           |            0 | Rufiji          | Magoda C   | Iringa      |           11 |              4 | Njombe   | Uwemba           |         20 | TRUE            | GeoData Consultants Ltd | NA                 | NA                     | FALSE  |               2008 | other - rope pump | rope pump               | rope pump               | vwc         | user-group        | never pay      | never pay     | soft           | good           | enough       | enough          | shallow well | shallow well | groundwater   | hand pump                   | hand pump               | functional     |
|  2 |           0 | 2011-03-27     | Lvia            |           0 | LVIA      |  36.11506 | \-6.279268 | Bombani        |            0 | Wami / Ruvu     | Songambele | Dodoma      |            1 |              4 | Chamwino | Msamalo          |          0 | TRUE            | GeoData Consultants Ltd | VWC                | Mgun                   | TRUE   |                  0 | mono              | mono                    | motorpump               | vwc         | user-group        | pay per bucket | per bucket    | soft           | good           | insufficient | insufficient    | machine dbh  | borehole     | groundwater   | communal standpipe multiple | communal standpipe      | functional     |
|  3 |          10 | 2013-06-03     | Germany Republi |        1639 | CES       |  37.14743 | \-3.187555 | Area 7 Namba 5 |            0 | Pangani         | Urereni    | Kilimanjaro |            3 |              5 | Hai      | Masama Magharibi |         25 | TRUE            | GeoData Consultants Ltd | Water Board        | Losaa-Kia water supply | TRUE   |               1999 | gravity           | gravity                 | gravity                 | water board | user-group        | pay per bucket | per bucket    | soft           | good           | enough       | enough          | spring       | spring       | groundwater   | communal standpipe          | communal standpipe      | functional     |
|  4 |           0 | 2011-03-22     | Cmsr            |           0 | CMSR      |  36.16489 | \-6.099290 | Ezeleda        |            0 | Wami / Ruvu     | Maata A    | Dodoma      |            1 |              4 | Chamwino | Majeleko         |          0 | TRUE            | GeoData Consultants Ltd | VWC                | NA                     | TRUE   |                  0 | nira/tanira       | nira/tanira             | handpump                | vwc         | user-group        | unknown        | unknown       | soft           | good           | dry          | dry             | shallow well | shallow well | groundwater   | hand pump                   | hand pump               | non functional |

``` r
dim(pumps_df)
```

    ## [1] 59400    41
