#!/bin/bash

rm -rf gh-root
mkdir gh-root

touch gh-root/CNAME
cat << EOF > gh-root/index.html
<html>
<head>
	<meta charset="utf-8">
	<title>Redirecting</title>
	<noscript>
		<meta http-equiv="refresh" content="1; url=latest/" />
	</noscript>
	<script>
		window.location.replace(window.location.href+"latest/");
	</script>
</head>
<body>
Redirecting to <a href="latest/">latest/</a>...
</body>
</html>
EOF

gh-pages -b gh-pages -d gh-root -a
