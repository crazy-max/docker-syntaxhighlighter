#!/bin/sh

# https://github.com/syntaxhighlighter/syntaxhighlighter/issues/428#issuecomment-369230312
sed -i -e 's/.*Promise = global.Promise.*/Promise = require("bluebird");/' node_modules/songbird/lib/songbird.js

# https://github.com/syntaxhighlighter/syntaxhighlighter/wiki/Building#project-setup
gulp setup-project

# find main brushes / themes repos
MAIN_BRUSHES=""
MAIN_THEMES=""
for folder in repos/*/; do
  basefolder=$(basename "$folder")
  if [ $(expr substr ${basefolder} 1 6) = "brush-" ]; then
    MAIN_BRUSHES="$MAIN_BRUSHES,$(echo ${basefolder} | cut -c 7-)"
  fi
  if [ ${basefolder} != "theme-base" -a $(expr substr ${basefolder} 1 6) = "theme-" ]; then
    MAIN_THEMES="$MAIN_THEMES $(echo ${basefolder} | cut -c 7-)"
  fi
done

# custom brushes
CUSTOM_BRUSHES=""
while IFS= read -r line; do
  brush_repo=$(echo ${line} | cut -f1 -d,)
  brush_name=$(echo ${line} | cut -f2 -d,)
  brush_js=$(echo ${line} | cut -f3 -d,)
  git clone ${brush_repo} repos/brush-${brush_name}
  CUSTOM_BRUSHES="$CUSTOM_BRUSHES,repos/brush-${brush_name}/${brush_js}"
done < "/customBrushes.txt"

# custom themes
CUSTOM_THEMES=""
while IFS= read -r line; do
  theme_repo=$(echo ${line} | cut -f1 -d,)
  theme_name=$(echo ${line} | cut -f2 -d,)
  theme_css=$(echo ${line} | cut -f3 -d,)
  git clone ${theme_repo} repos/theme-${theme_name}
  CUSTOM_THEMES="$CUSTOM_THEMES repos/theme-${theme_name}/${theme_css}"
done < "/customThemes.txt"

# display
BRUSHES=$(echo "${MAIN_BRUSHES}${CUSTOM_BRUSHES}" | cut -c 2- | xargs)
THEMES=$(echo "${MAIN_THEMES} ${CUSTOM_THEMES}" | xargs)
echo "========================="
echo "Brushes: $BRUSHES"
echo "========================="
echo "Themes: $THEMES"
echo "========================="

# https://github.com/syntaxhighlighter/syntaxhighlighter/wiki/Building#building-syntaxhighlighterjs
for theme in ${THEMES}; do
  gulp build --theme=${theme} --compat
  mv "dist/theme.css" "dist/theme-$theme.css"
done
gulp build --brushes=${BRUSHES} --compat

ls -al dist/

exec "$@"
