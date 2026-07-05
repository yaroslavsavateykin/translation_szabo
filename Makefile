TYPSTYLE = typstyle --line-width 70 --indent-width 2 --no-reorder-import-items

fmt:
	$(TYPSTYLE) -i .

fmt-check:
	$(TYPSTYLE) --check .

fmt-diff:
	$(TYPSTYLE) --diff .

build:
	typst compile main.typ main.pdf

ci: fmt-check build
