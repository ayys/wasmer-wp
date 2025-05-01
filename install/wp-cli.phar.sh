#!/usr/bin/bash
set -e
BIN_DIR="${WP_CLI_BIN_DIR:-vendor/bin}"

mkdir -p "$BIN_DIR"

# Download wp-cli.phar to the specified location
curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o "$BIN_DIR/wp-php"

cat > "$BIN_DIR/wp" << EOF
#!/usr/bin/bash
set -ex
alias less=cat
php "/sbin/wp-php" --path=/app --allow-root "\$@"
EOF
