module Paths_tchen (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/shinka/verticals/tchen/cabal-dev//bin"
libdir     = "/home/shinka/verticals/tchen/cabal-dev//lib/tchen-0.1/ghc-7.4.2"
datadir    = "/home/shinka/verticals/tchen/cabal-dev//share/tchen-0.1"
libexecdir = "/home/shinka/verticals/tchen/cabal-dev//libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "tchen_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tchen_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "tchen_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tchen_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
