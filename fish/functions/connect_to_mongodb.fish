function connect_to_mongodb
    # Check if environment variables are set
    if not set -q MONGO_USERNAME; or not set -q MONGO_PASSWORD; or not set -q MONGO_HOST; or not set -q MONGO_DB
        echo "MongoDB connection environment variables not set. Please define MONGO_USERNAME, MONGO_PASSWORD, MONGO_SERVER, and MONGO_DB."
        return 2
    end

    # Use environment variables for connection details
    set connection_string "mongodb+srv://$MONGO_USERNAME:$MONGO_PASSWORD@$MONGO_HOST/$MONGO_DB?tls=true&authSource=admin"

    # Connect to MongoDB
    mongosh $connection_string
end
