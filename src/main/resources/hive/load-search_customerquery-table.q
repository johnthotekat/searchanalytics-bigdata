Use search;
-- setup will make sure table does not exist
DROP TABLE IF EXISTS search_customerquery;
CREATE TABLE search_customerquery(id String, customerid BIGINT, querystring String, querycount INT);
-- customer top query string in the last 30 days
INSERT INTO TABLE search_customerquery select concat(customerid,"_",queryString), customerid, querystring, count(*) as querycount from search_clicks where querystring is not null and customerid is not null and createdTimeStampInMillis > ((unix_timestamp() * 1000) - 2592000000) group by customerid, querystring order by customerid;