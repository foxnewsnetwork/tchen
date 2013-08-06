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
          values = [show i, show name, maybeShow pid]
          maybeShow Nothing = ""
          maybeShow (Just x) = show x
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
  , external_link :: T.Text
  , content :: T.Text
  , updated_at :: LocalTime
  , created_at :: LocalTime }

instance ToJSON BlogPost where
  toJSON (BlogPost i t el c ua ca) = 
    let   keys = map T.pack ["id", "title", "external_link", "content", "updated_at", "created_at"]
          values = [show i, show t, show el, show c, show ua, show ca]
    in    object $ zipWith (J..=) keys values

instance FromRow BlogPost where
  fromRow = do
    i <- field
    t <- field
    el <- field
    c <- field
    up <- field
    cr <- field
    return $ BlogPost i t el c up cr

instance HasPostgres (Handler b App) where
    getPostgresState = with pg get

------------------------------------------------------------------------------
type AppHandler = Handler App App


