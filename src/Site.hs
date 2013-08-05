{-# LANGUAGE OverloadedStrings #-}

------------------------------------------------------------------------------
-- | This module is where all the routes and handlers are defined for your
-- site. The 'app' function is the initializer that combines everything
-- together and is exported by this module.
module Site
  ( app
  ) where

------------------------------------------------------------------------------
import           Control.Applicative
import           Control.Monad
import           Control.Monad.IO.Class
import           Data.ByteString (ByteString)
import           Data.ByteString.Char8
import           Data.Maybe
import qualified Data.Text as T
import           Snap.Core
import           Snap.Snaplet
import           Snap.Snaplet.Auth
import           Snap.Snaplet.Auth.Backends.JsonFile
import           Snap.Snaplet.Heist
import           Snap.Snaplet.Session.Backends.CookieSession
import           Snap.Snaplet.PostgresqlSimple
import           Snap.Util.FileServe
import           Heist
import qualified Heist.Interpreted as I
import           Data.Aeson as J

------------------------------------------------------------------------------
import           Application


------------------------------------------------------------------------------
-- | Render login form
handleLogin :: Maybe T.Text -> Handler App (AuthManager App) ()
handleLogin authError = heistLocal (I.bindSplices errs) $ render "login"
  where
    errs = [("loginError", I.textSplice c) | c <- maybeToList authError]


------------------------------------------------------------------------------
-- | Handle login submit
handleLoginSubmit :: Handler App (AuthManager App) ()
handleLoginSubmit =
    loginUser "login" "password" Nothing
              (\_ -> handleLogin err) (redirect "/")
  where
    err = Just "Unknown user or password"


------------------------------------------------------------------------------
-- | Logs out and redirects the user to the site index.
handleLogout :: Handler App (AuthManager App) ()
handleLogout = logout >> redirect "/"


------------------------------------------------------------------------------
-- | Handle new user form submit
handleNewUser :: Handler App (AuthManager App) ()
handleNewUser = method GET handleForm <|> method POST handleFormSubmit
  where
    handleForm = render "new_user"
    handleFormSubmit = registerUser "login" "password" >> redirect "/"


------------------------------------------------------------------------------
-- | Handle blogposts#index... Haskell is hard and doesn't make much sense
handleBlogpostIndex :: Handler App Postgres ()
handleBlogpostIndex = do
  tag_id <- liftM toMaybeInteger (getParam "tag_id")
  blogposts <- postMaker tag_id
  writeLBS $ J.encode (blogposts :: [BlogPost])
  where   postMaker Nothing = query_ "SELECT * FROM blogposts ORDER BY id DESC"
          postMaker (Just x) = query "SELECT b.* FROM blogposts AS b INNER JOIN blogpost_tag_relationships AS r ON b.id = r.blogpost_id WHERE r.tag_id = ? ORDER BY b.id DESC" (Only x)

handleTagShow :: Handler App Postgres ()
handleTagShow = do
  name <- getParam "name"
  tag <- query "SELECT * FROM tags WHERE name = ? LIMIT 1" (Only name)
  writeLBS $ J.encode (tag :: [NavTag])

handleTagIndex :: Handler App Postgres ()
handleTagIndex = do
  parent_id <- liftM toMaybeInteger (getParam "id")
  tags <- tagsMaker parent_id
  writeLBS $ J.encode (tags :: [NavTag])  
  where   tagsMaker Nothing = query_ "SELECT * FROM tags WHERE parent_id is NULL ORDER BY id DESC LIMIT 25"
          tagsMaker (Just x) = query "SELECT * FROM tags WHERE parent_id = ? ORDER BY id DESC LIMIT 25" (Only x)

toMaybeInteger :: Maybe ByteString -> Maybe Int
toMaybeInteger Nothing = Nothing
toMaybeInteger (Just x) = liftM fst $ readInt x
-----------------------------------------------------------------------------
-- | The application's routes.
routes :: [(ByteString, Handler App App ())]
routes = [ ("/bps",              with pg handleBlogpostIndex)
         , ("/tags",             with pg handleTagIndex)
         , ("/tag/:name",        with pg handleTagShow)
         , ("/login",            with auth handleLoginSubmit)
         , ("/logout",           with auth handleLogout)
         , ("/new_user",         with auth handleNewUser)
         , ("",                  serveDirectory ".tmp")
         , ("",                  serveDirectory "app")
         ]


------------------------------------------------------------------------------
-- | The application initializer.
app :: SnapletInit App App
app = makeSnaplet "app" "An snaplet example application." Nothing $ do
    h <- nestSnaplet "" heist $ heistInit "templates"
    s <- nestSnaplet "sess" sess $
           initCookieSessionManager "site_key.txt" "sess" (Just 3600)

    -- NOTE: We're using initJsonFileAuthManager here because it's easy and
    -- doesn't require any kind of database server to run.  In practice,
    -- you'll probably want to change this to a more robust auth backend.
    a <- nestSnaplet "auth" auth $
           initJsonFileAuthManager defAuthSettings sess "users.json"
    p <- nestSnaplet "pg" pg pgsInit
    addRoutes routes
    addAuthSplices auth
    return $ App h s a p

