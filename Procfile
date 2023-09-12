notion: fswatch -0 --event Created --include ".*\.txt$" --exclude ".*\.pdf$" ~/My\ Drive/Rocketbook\ notes  | xargs -0 -n1 -I{} ./send-to-notion.sh "{}"
confluence: fswatch -0 --event Created --include ".*\.txt$" --exclude ".*\.pdf$" ~/My\ Drive/Rocketbook\ notes  | xargs -0 -n1 -I{} ./send-to-confluence.sh "{}"
