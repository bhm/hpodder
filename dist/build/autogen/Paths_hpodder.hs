module Paths_hpodder (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [1,1,6], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/hiv/.cabal/bin"
libdir     = "/home/hiv/.cabal/lib/hpodder-1.1.6/ghc-7.0.3"
datadir    = "/home/hiv/.cabal/share/hpodder-1.1.6"
libexecdir = "/home/hiv/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "hpodder_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "hpodder_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "hpodder_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "hpodder_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
