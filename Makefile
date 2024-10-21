.DEFAULT_GOAL := regen


regen_site:
	bundle exec jekyll build

regen_pdf:
	bundle exec jekyll serve -B
	weasyprint -q -s <(echo '@page {size: Letter; margin: 1cm;}') -u https://azoplee.com http://localhost:4000 pdf/portfolio_fr.pdf
	weasyprint -q -s <(echo '@page {size: Letter; margin: 1cm;}') -u https://azoplee.com http://localhost:4000/en pdf/portfolio_en.pdf
	pkill -2 -f jekyll

regen: regen_site
