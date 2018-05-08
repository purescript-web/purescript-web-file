module Web.File.FileList
  ( FileList
  , length
  , item
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Web.File.File (File)

foreign import data FileList :: Type

-- | Number of files in the `FileList` object.
foreign import length :: FileList -> Int

foreign import _item :: Int -> FileList -> Nullable File

-- | Get `File` at the certain position
item :: Int -> FileList -> Maybe File
item i = toMaybe <<< _item i
