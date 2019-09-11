module Web.File.FileList
  ( FileList
  , length
  , item
  , items
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toMaybe)
import Data.Array (snoc)
import Data.Tuple (Tuple(..))
import Web.File.File (File)

foreign import data FileList :: Type

-- | Number of files in the `FileList` object.
foreign import length :: FileList -> Int

foreign import _item :: Int -> FileList -> Nullable File

-- | Get `File` at the certain position
item :: Int -> FileList -> Maybe File
item i = toMaybe <<< _item i

items :: FileList -> Array File
items fl = untilNothing (\c fs -> Tuple (c + 1) <<< snoc fs <$> item c fl) 0 mempty

untilNothing :: forall a b. (a -> b -> Maybe (Tuple a b)) -> a -> b -> b
untilNothing f x y = let m = f x y in
  case m of (Just (Tuple x' y')) -> untilNothing f x' y'
            Nothing -> y

