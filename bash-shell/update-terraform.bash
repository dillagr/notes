#!/opt/bin/env bash
###
### SCRIPT-TO-UPDATE TERRAFORM!
###

# Lists terraform releasesusing GitHub API.

OPTION_STABLE_ONLY=""
OPTION_ORDER=""

[[ -n "${DEBUG}" ]] && { set -x; }

# Usage: display_help
display_help()
{
	cat <<-EOT
	Usage: ${APP_NAME}
	       ${APP_NAME} <-h|--help>
	       ${APP_NAME} <-v|--version>
	       ${APP_NAME} [options]

	Will output latest terraform releases on GitHub.

	Options:
	  -v | --version      Displays script version information.
	  -h | --help         Displays this message.
	  -n | --number-only  Removes "v" prefix from versions.
	  -s | --stable-only  Avoids alpha, beta and release candidates.
	  -o | --order        Numerical order versions, olders first.

	Bugs and suggestions can be sent to https://github.com/augustohp.
	EOT
}

# Usage: assert_environment
assert_environment() {
	for dependency in curl jq sed unzip ; do
		command -v "${dependency}" 2>&1 > /dev/null \
			|| { echo "Error! Missing dependency ${dependency}." >&2; exit 42; }
	done
}


# Usage: list_latest_releases | filter_numbers_only
filter_numbers_only() {
	[ -n $OPTION_NUMBER_ONLY ] && sed 's/^v//'
}


# Usage: list_latest_releases | filter_order
filter_order() {
	[ -n $OPTION_ORDER ] && sort
}


# Usage: list_latest_releases
list_latest_releases() {

	assert_environment

	curl \
		--silent \
		-H "Accept: application/vnd.github.v3+json" \
		https://api.github.com/repos/hashicorp/terraform/releases \
		| jq ".[] | .tag_name" \
		| sed 's/"//g' \
		| filter_numbers_only \
		| filter_order
}


# Usage: latest_release_only
latest_release_only() {
    list_latest_releases \
        | tail -n 1
}


# Usage: download_latest_release
download_latest_release() {
    if [ ! -f terraform-v${LATEST}.zip ] ; then
        curl \
            --silent \
            -output terraform-v${LATEST}.zip \
            ttps://releases.hashicorp.com/terraform/${LATEST}/terraform_${LATEST}_linux_amd64.zip
    fi
}


# Usage: extract_terraform
extract_zipfile() {
    [ -d $HOME/.local/bin ] && TARGETDIR=$HOME/.local/bin/
    [ -z $TARGETDIR ] && TARGETDIR=/usr/local/bin/
    sudo unzip -qq -o terraform-v${LATEST}.zip terraform -d ${TARGETDIR}
}



# Parses options and arguments
while true; do
	# If no argument/option left, stop
	[ $# -eq 0 ] && break

	# Matches current option/argument, configuring environment
	case "$1" in
		-h|--help|help)
			display_help
			exit 1
			;;
		-v|--version|version)
			echo "${APP_NAME} ${APP_VERSION}"
			exit 1
			;;
		-n|--number-only)
			OPTION_NUMBER_ONLY=1
			;;
		-s|--stable-only)
			OPTION_STABLE_ONLY=1
			;;
		-o|--order)
			OPTION_ORDER=1
			;;
		*)
			echo "Error! Unrecognized '${1}' as option or argument." >&2
			exit 2
			;;
	esac

	# Pop argument list, parses next argument on following iteration
	shift
done


LATEST=$(latest_release_only)
download_latest_release
extract_zipfile
