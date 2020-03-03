.DEFAULT_GOAL := regen


regen_site:
	bundle exec jekyll build

regen_pdf:
	bundle exec jekyll serve -B
	weasyprint -q -u https://azoplee.com http://localhost:4000 docs/pdf/portfolio_fr.pdf
	weasyprint -q -u https://azoplee.com http://localhost:4000/en docs/pdf/portfolio_en.pdf
	pkill -2 -f jekyll

regen: regen_pdf regen_site
