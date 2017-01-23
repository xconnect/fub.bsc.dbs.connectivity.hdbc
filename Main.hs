-- HelloDatabaseWorld main-module
module Main (
             main  -- main-function
            )
  where
  
  -- imports --
  import Control.Monad
  import Control.Exception
  import Database.HDBC
  import Database.HDBC.MySQL

  -- functions --
  main :: IO ()
  main = do {conn <- connectMySQL defaultMySQLConnectInfo {            -- build a connection
                       mysqlHost = "localhost",                        -- host
                       mysqlDatabase = "myDB",                         -- database name
                       mysqlUser = "myUSER",                           -- database user
                       mysqlPassword = "passwort",                     -- database password
                       mysqlUnixSocket = "/var/run/mysqld/mysqld.sock" -- socket crap
                     };
             rows <- quickQuery' conn "SELECT * FROM ausgabe"[];       -- do a query
             forM_ rows $ \row -> putStrLn $ show row;                 -- print the query; forM_ :: Monad m => [a] -> (a -> m b) -> m ()
            }
