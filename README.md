# [MongoDB Sample Dataset](https://docs.atlas.mongodb.com/sample-data/available-sample-datasets/)

[MongoDB database tools](https://www.mongodb.com/docs/database-tools/) need to be [downloaded and installed](https://www.mongodb.com/try/download/database-tools) to use tools like `mongoimport`, `mongoexport`, `mongodump` and `mongorestore`.

> This is a fork of [repo](https://github.com/neelabalan/mongodb-sample-dataset).

> To import JSON files to respective db, execute [script.sh](https://github.com/bonniss/mongodb-sample-dataset/blob/main/script.sh)

> For handy db backup and restore operations, I've added zip dump files in root by a bash [script](https://github.com/bonniss/mongodb-sample-dataset/blob/main/drmongo.sh). Every file simply the output of `mongodump`, hence you can restore the whole db using `mongorestore`.

```bash
# Create/Restore all sample dbs
./drmongo.sh -r

# Backup all sample dbs
./drmongo.sh -d
```

Atlas provides sample data you can load into your Atlas clusters. You can use this data to quickly get started experimenting with data in MongoDB and using tools such as the Atlas Perform CRUD Operations in Atlas and MongoDB Charts.

MongoDB does not provide any sample databases on their website, However, they do provide sample databases for their cloud service Atlas. These databases have been dumped from a MongoDB Atlas cluster using the MongoDB Compass GUI.  There are 7 databases, with each database collection (table) stored in a seperate JSON file.  These files will accelerate learning of MongoDB's features by allowing new developers to quickly experiment with prepopulated datasets.


## Sample Datasets

| Dataset Name                                                                                | Description                                                       | Collections                                                                |
| ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | -------------------------------------------------------------------------- |
| [Sample AirBnB Listings Dataset](https://docs.atlas.mongodb.com/sample-data/sample-airbnb/) | Contains details on AirBnB listings.                              | listingsAndReviews                                                         |
| [Sample Analytics Dataset](https://docs.atlas.mongodb.com/sample-data/sample-analytics/)    | Contains training data for a mock financial services application. | accounts, customers, transactions                                          |
| [Sample Geospatial Dataset](https://docs.atlas.mongodb.com/sample-data/sample-geospatial/)  | Contains shipwreck data.                                          | shipwrecks                                                                 |
| [Sample Mflix Dataset](https://docs.atlas.mongodb.com/sample-data/sample-mflix/)            | Contains movie data.                                              | comments, movies, theaters, users                                          |
| [Sample Supply Store Dataset](https://docs.atlas.mongodb.com/sample-data/sample-supplies/)  | Contains data from a mock office supply store.                    | sales                                                                      |
| [Sample Training Dataset](https://docs.atlas.mongodb.com/sample-data/sample-training/)      | Contains MongoDB training services dataset.                       | companies, grades, inspection, posts, routes, stories, trips, tweets, zips |
| [Sample Weather Dataset](https://docs.atlas.mongodb.com/sample-data/sample-weather/)        | Contains detailed weather reports.                                | data                                                                       |

## Running in docker

```bash
docker pull mvertes/alpine-mongo

docker run -d --name mongo -p 2717:27017 -v ~/mongodb:/data/db mvertes/alpine-mongo

# args
#   hostname
#   port
./script.sh localhost 2717

# start mongo shell
docker exec -it mongo mongo
```

