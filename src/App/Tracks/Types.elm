module Tracks.Types exposing (..)

-- `Track` record


type alias Tags =
    { nr : Int

    -- Main
    , album : String
    , artist : String
    , title : String

    -- Extra
    , genre : Maybe String
    , year : Maybe Int
    }


type alias TagUrls =
    { getUrl : String
    , headUrl : String
    }


type alias Track =
    { path : String
    , sourceId : SourceId
    , tags : Tags
    }


type alias SourceId =
    String



-- Sorting


type SortBy
    = Artist
    | Album
    | Title


type SortDirection
    = Asc
    | Desc



-- Other


type Msg
    = Add (List Track)
    | Remove SourceId
    | RemoveByPath SourceId (List String)
    | SortBy SortBy


type alias Model =
    { collection : List Track
    , sortBy : SortBy
    , sortDirection : SortDirection
    }



-- 🌱


emptyTags : Tags
emptyTags =
    { nr = 0
    , album = "Empty"
    , artist = "Empty"
    , title = "Empty"
    , genre = Nothing
    , year = Nothing
    }


emptyTrack : Track
emptyTrack =
    { path = ""
    , sourceId = ""
    , tags = emptyTags
    }


makeTrack : String -> ( String, Tags ) -> Track
makeTrack sourceId ( path, tags ) =
    { path = path
    , sourceId = sourceId
    , tags = tags
    }
