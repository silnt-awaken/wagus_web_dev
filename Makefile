build_web:
	flutter clean
	flutter pub get
	flutter build web --base-href / --release


	cd build/web
	git init
	git add .
	git commit -m "Deploy to GitHub Pages"
	git remote add origin git@github.com:silnt-awaken/wagus_web.git
	git push -u -f origin main