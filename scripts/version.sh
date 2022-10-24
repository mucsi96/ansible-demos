#!/bin/bash

read -d EOF
tag_prefix=$(echo "$TAG_PREFIX")
ignore=$(echo "$IGNORE" | tr ',' '\n' | sed "s/^/:(exclude)/" | tr '\n' ' ')

if [[ -z "$tag_prefix" ]]
then
    echo "Missing tag_prefix" >&2
    exit 2
fi

prev_tag=$(git describe --tags --match=$tag_prefix-* --abbrev=0)
if [ $? -eq 0 ]
then
    git diff --quiet HEAD $prev_tag -- . $ignore
    if [ $? -eq 0 ]
    then
        version=$(echo "$prev_tag" | sed "s/^$tag_prefix-//")
        echo -n "$version"
        exit 0
    fi
fi

latest_version=$(git tag --list --sort=taggerdate $tag_prefix-* | tail -1 | sed "s/^$tag_prefix-//")
new_version=
if [[ -z "$latest_version" ]]
then
    new_version=1
else
    new_version=$((latest_version + 1))
fi

git tag "$tag_prefix-$new_version"
git push --tags > /dev/null

echo -n "$new_version"