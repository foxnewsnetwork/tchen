{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleInstances #-}
------------------------------------------------------------------------------
-- | This module defines our application's state type and an alias for its
-- handler monad.
module Application where

------------------------------------------------------------------------------
import            Control.Lens
import            Snap.Snaplet
import            Snap.Snaplet.Heist
import            Snap.Snaplet.Auth
import            Snap.Snaplet.Session
import            Snap.Snaplet.PostgresqlSimple
import            Control.Monad.State
import qualified  Data.Text as T
import            Data.Time.LocalTime
import            Data.Aeson as J
------------------------------------------------------------------------------
data App = App
    { _heist :: Snaplet (Heist App)
    , _sess :: Snaplet SessionManager
    , _auth :: Snaplet (AuthManager App)
    , _pg   :: Snaplet Postgres
    }

makeLenses ''App

instance HasHeist App where
    heistLens = subSnaplet heist

data NavTag = NavTag 
  { parent_id :: Maybe Integer
  , name :: T.Text
  , tag_id :: Integer }

instance ToJSON NavTag where
  toJSON (NavTag pid name i) =
    let   keys = map T.pack ["id", "name", "parent_id"]
          values = [show i, show name, show pid]
    in    object $ zipWith (J..=) keys values

instance FromRow NavTag where
  fromRow = do
    tag_id <- field
    name <- field
    parent_id <- field
    return $ NavTag parent_id name tag_id


data BlogPost = BlogPost 
  { blog_id :: Integer
  , title :: T.Text
  , content :: T.Text
  , updated_at :: LocalTime
  , created_at :: LocalTime }

instance ToJSON BlogPost where
  toJSON (BlogPost i t c ua ca) = 
    let   keys = map T.pack ["id", "title", "content", "updated_at", "created_at"]
          values = [show i, show t, show c, show ua, show ca]
    in    object $ zipWith (J..=) keys values

instance FromRow BlogPost where
  fromRow = do
    i <- field
    t <- field
    c <- field
    up <- field
    cr <- field
    return $ BlogPost i t c up cr

instance HasPostgres (Handler b App) where
    getPostgresState = with pg get

instance Show BlogPost where
  show (BlogPost _ t c ua ca) = "{ title: '" ++ show t ++ "', content: '" ++ show c ++ "', updated_at: '" ++ show ua ++ "', created_at: '" ++ show ca ++ "' }"
------------------------------------------------------------------------------
type AppHandler = Handler App App


