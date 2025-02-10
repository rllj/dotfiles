#!/bin/bash
RELEASE_NAME=nvim-macos-arm64.tar.gz
CHECKSUM_NAME="shasum.txt"
INSTALL_PATH=/Users/m01632/.local/

function install_new_release() {
    mkdir -p release
    echo "Installing new release..."
    tar -xzf "$RELEASE_NAME" -C release --strip-components=1
    rsync -a release/ $INSTALL_PATH
    echo "Done!"
}

assets_url=$(curl -sL  \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_API_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/neovim/neovim/releases/tags/nightly \
  | jq -r '.assets_url')


assets=$(curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_API_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
     $assets_url \
     | jq -c '.[]')


# This needs some cleanup...
while read asset; do
    asset_name=$(echo $asset | jq -r '.name')
    download_url=$(echo $asset | jq -r '.browser_download_url')
    if [ "$asset_name" = "$CHECKSUM_NAME" ]; then
        previous_checksum=$(cat $CHECKSUM_NAME)
        echo "Fetching checksum..."
        curl -sL \
            -H "Accept: application/vnd.github+json" \
            -H "Authorization: Bearer $GITHUB_API_TOKEN" \
            -H "X-GitHub-Api-Version: 2022-11-28" \
            -o $CHECKSUM_NAME \
            $download_url
        checksum=$(cat $CHECKSUM_NAME)
        break
    fi
done < <(echo "$assets")


while read asset; do
    asset_name=$(echo $asset | jq -r '.name')
    download_url=$(echo $asset | jq -r '.browser_download_url')
    ISO_date=$(echo $asset | jq -r '.updated_at')
    formatted_date=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "$ISO_date" "+%B %d, %Y at %I:%M %p")
    if [ "$asset_name" = "$RELEASE_NAME" ]; then
        if [ "$previous_checksum" != "$checksum" ]; then
            echo "New release found from $formatted_date!"
            echo "Downloading $asset_name..."
            curl -sL \
                -H "Accept: application/vnd.github+json" \
                -H "Authorization: Bearer $GITHUB_API_TOKEN" \
                -H "X-GitHub-Api-Version: 2022-11-28" \
                -o $asset_name \
                $download_url
            install_new_release
            break
        else
            echo "No new release found!"
            break
        fi
    fi
done < <(echo "$assets")
