#!/usr/bin/env python3
from __future__ import annotations

import re
import shutil
import subprocess
from pathlib import Path


SRC_ROOT = Path("/home/yaroslav/QuantumChemistryTranslation/Translation/build/Translation/Translation")
IMAGE_ROOT = Path("/home/yaroslav/QuantumChemistryTranslation/Translation/build/Translation")
OUT_ROOT = Path("/home/yaroslav/typst_projects/translation")
CHAPTER_DIR = OUT_ROOT / "chapters"
ASSET_DIR = OUT_ROOT / "assets" / "figures"
TABLE_SNIPPETS: dict[str, str] = {}
TASK_SNIPPETS: dict[str, str] = {}
FILE_PROLOGUE = """#import "../macros.typ": task

#set text(lang: "ru", font: "New Computer Modern", size: 12pt)
#set page(
  paper: "a4",
  margin: (
    left: 2cm,
    right: 2cm,
    top: 2cm,
    bottom: 2cm,
  ),
  numbering: "1",
)

#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 1.2em,
)

#set heading(numbering: "1.1.")

#let chapter_num() = {
  let nums = counter(heading).get()
  if nums.len() > 0 { str(nums.at(0)) } else { "0" }
}

#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}

#set math.equation(
  numbering: n => "(" + chapter_num() + "." + str(n) + ")",
)

#set figure(
  numbering: n => "(" + chapter_num() + "." + str(n) + ")",
)

#show math.equation: set text(font: "New Computer Modern Math")
"""


DIRECT_FILES = [
    ("00-introduction.typ", SRC_ROOT / "introduction.tex"),
    ("01-glossary.typ", SRC_ROOT / "alias.tex"),
    ("02-mathematical-review.typ", SRC_ROOT / "subchapters" / "1_3_the_variation_method.tex"),
    ("03-01-electronic-task.typ", SRC_ROOT / "subchapters" / "2_1_электронная задача Саша (+предисловие).tex"),
    ("03-02-felix.typ", SRC_ROOT / "subchapters" / "2_2_феликс.tex"),
    ("03-02-amina.typ", SRC_ROOT / "subchapters" / "2_2_амина.tex"),
    ("03-03-maxim.typ", SRC_ROOT / "subchapters" / "2_3_максим.tex"),
    ("03-03-yaroslav.typ", SRC_ROOT / "subchapters" / "2_3_ярослав.tex"),
    ("04-01-hartree-fock-equations.typ", SRC_ROOT / "subchapters" / "3_1_the_hartree_fock_equations.tex"),
    ("04-02-derivation-of-hartree-fock-equations.typ", SRC_ROOT / "subchapters" / "3_2_derivation_of_the_hartree_fock_equations.tex"),
    ("04-03-interpretation-of-solutions-to-hf-equations.typ", SRC_ROOT / "subchapters" / "3_3_interpretation_of_solutions_to_the_hartree_fock_equations.tex"),
    ("04-04-sasha.typ", SRC_ROOT / "subchapters" / "3_4_Саша.tex"),
    ("04-04-yaroslav.typ", SRC_ROOT / "subchapters" / "3_4_Ярослав.tex"),
    ("04-05-model-calculations-on-h2-and-heh-plus.typ", SRC_ROOT / "subchapters" / "3_5_model_calculations_on_h2_and_heh.tex"),
    ("04-06-polyatomic-basis-sets.typ", SRC_ROOT / "subchapters" / "3_6_polyatomic_basis_sets.tex"),
    ("04-07-illustrative-closed-shell-hf.typ", SRC_ROOT / "subchapters" / "3_7_some_illustratibe_closed_shell_hartree_fock.tex"),
    ("04-08-unrestricted-open-shell-hf.typ", SRC_ROOT / "subchapters" / "3_8_unrestricted_open_shell_hartree_fock.tex"),
    ("05-01-full-ci-matrix.typ", SRC_ROOT / "subchapters" / "4_1_multiconfigurational_wave_functions_and_the_structure_of_the_full_ci_matrix.tex"),
    ("05-02-doubly-excited-ci.typ", SRC_ROOT / "subchapters" / "4_2_doubly_excited_ci.tex"),
    ("05-03-illustrative-calculations.typ", SRC_ROOT / "subchapters" / "4_3_some_illustrative_calculations.tex"),
    ("05-04-natural-orbitals-and-1rdm.typ", SRC_ROOT / "subchapters" / "4_4_natural_orbitals_and_the_one_particle_reduced_density_matrix.tex"),
    ("05-05-mcscf-and-gvb.typ", SRC_ROOT / "subchapters" / "4_5_the_multiconfiguration_mscf_and_gvb_methods.tex"),
    ("05-06-truncated-ci-and-size-consistency.typ", SRC_ROOT / "subchapters" / "4_6_truncated_ci_and_the_size_consistency_problem.tex"),
    ("06-01-rs-perturbation-theory.typ", SRC_ROOT / "subchapters" / "6_1_rs_perturbation_theory.tex"),
    ("06-02-diagrammatic-rs-theory.typ", SRC_ROOT / "subchapters" / "6_2_diagrammaic_representation_of_rs_theory.tex"),
    ("06-03-orbital-perturbation-theory.typ", SRC_ROOT / "subchapters" / "6_3_orbital_perturbation_theory_one_particle_perturbations.tex"),
    ("06-04-diagrammatic-orbital-perturbation-theory.typ", SRC_ROOT / "subchapters" / "6_4_diagrammatic_representation_of_orbital_perturbation_theory.tex"),
    ("06-05-perturbation-expansion-of-correlation-energy.typ", SRC_ROOT / "subchapters" / "6_5_perturbation_expansion_of_the_correlation_energy.tex"),
    ("06-06-n-dependence-of-rs-expansion.typ", SRC_ROOT / "subchapters" / "6_6_the_n_dependence_of_the_rs_perturbation_expansion.tex"),
    ("06-07-diagrammatic-expansion-of-correlation-energy.typ", SRC_ROOT / "subchapters" / "6_7_digrammatic_representation_of_the_perturbation_expansion_of_the_correlation_energy.tex"),
]


WRAPPERS = {
    "03-02-orbitals-slater-determinants-and-basis-functions.typ": {
        "title": "Орбитали, определители Слейтера и базисные функции",
        "label": "subsec:08ac26",
        "includes": [
            "03-02-felix.typ",
            "03-02-amina.typ",
        ],
    },
    "03-03-operators-and-matrix-elements.typ": {
        "title": "Операторы и матричные элементы",
        "label": "subsec:8def7f",
        "includes": [
            "03-03-maxim.typ",
            "03-03-yaroslav.typ",
        ],
    },
    "04-04-roothaan-equations.typ": {
        "title": "Ограниченный метод Хартри-Фока для закрытых оболочек: уравнения Рутана",
        "label": None,
        "includes": [
            "04-04-sasha.typ",
            "04-04-yaroslav.typ",
        ],
    },
    "03-many-electron-wave-functions-and-operators.typ": {
        "title": "Mногоэлектронные волновые функции и операторы",
        "label": "sec:chapter2",
        "includes": [
            "03-01-electronic-task.typ",
            "03-02-orbitals-slater-determinants-and-basis-functions.typ",
            "03-03-operators-and-matrix-elements.typ",
        ],
    },
    "04-hartree-fock.typ": {
        "title": "Приближение Хартри-Фока",
        "label": "sec:chapter3",
        "includes": [
            "04-01-hartree-fock-equations.typ",
            "04-02-derivation-of-hartree-fock-equations.typ",
            "04-03-interpretation-of-solutions-to-hf-equations.typ",
            "04-04-roothaan-equations.typ",
            "04-05-model-calculations-on-h2-and-heh-plus.typ",
            "04-06-polyatomic-basis-sets.typ",
            "04-07-illustrative-closed-shell-hf.typ",
            "04-08-unrestricted-open-shell-hf.typ",
        ],
    },
    "05-configuration-interaction.typ": {
        "title": "Конфигурационное взаимодействие",
        "label": "sec:chapter4",
        "includes": [
            "05-01-full-ci-matrix.typ",
            "05-02-doubly-excited-ci.typ",
            "05-03-illustrative-calculations.typ",
            "05-04-natural-orbitals-and-1rdm.typ",
            "05-05-mcscf-and-gvb.typ",
            "05-06-truncated-ci-and-size-consistency.typ",
        ],
    },
    "06-many-body-perturbation-theory.typ": {
        "title": "Многочастичная теория возмущений",
        "label": "sec:45145d",
        "includes": [
            "06-01-rs-perturbation-theory.typ",
            "06-02-diagrammatic-rs-theory.typ",
            "06-03-orbital-perturbation-theory.typ",
            "06-04-diagrammatic-orbital-perturbation-theory.typ",
            "06-05-perturbation-expansion-of-correlation-energy.typ",
            "06-06-n-dependence-of-rs-expansion.typ",
            "06-07-diagrammatic-expansion-of-correlation-energy.typ",
        ],
    },
}


def run_pandoc(tex: str) -> str:
    proc = subprocess.run(
        ["pandoc", "-f", "latex", "-t", "typst", "--wrap=none"],
        input=tex,
        text=True,
        capture_output=True,
        check=True,
    )
    return proc.stdout


def pandoc_fragment(tex: str) -> str:
    tex = strip_tex_noise(tex)
    tex = normalize_ocr_artifacts(tex, Path("<fragment>"))
    return normalize_typst_output(run_pandoc(tex).strip())


def strip_tex_noise(text: str) -> str:
    text = re.sub(r"\\begin\{(itemize|enumerate)\}\\keepwithnext\\itemsep0pt", r"\\begin{\1}", text)
    text = re.sub(r"\\end\{(itemize|enumerate)\}\\keepwithnext\\itemsep0pt", r"\\end{\1}", text)
    text = re.sub(r"\\begin\{(itemize|enumerate)\}\s*\\keepwithnext\\itemsep0pt", r"\\begin{\1}", text)
    text = re.sub(r"\\end\{(itemize|enumerate)\}\s*\\keepwithnext\\itemsep0pt", r"\\end{\1}", text)
    return text


def normalize_ocr_artifacts(text: str, src_path: Path) -> str:
    # Keep the source text intact unless we see obvious OCR damage that breaks parsing.
    text = re.sub(r"\{([0-9.]+)\}\\textwidth", r"\1\\textwidth", text)
    text = re.sub(r"\{([0-9.]+)\}\\textheight", r"\1\\textheight", text)
    if src_path.name == "3_6_polyatomic_basis_sets.tex":
        text = re.sub(r"6-31G\\+textit\{", "6-31G*", text)
        text = re.sub(r"6-31G\\+\}\*", "6-31G**", text)
        text = re.sub(r"6-31G\\+\}", "6-31G*", text)
        text = text.replace("6-31G}", "6-31G*")
        text = re.sub(r"6-31G\*\\+textit\{", "6-31G**", text)
        text = re.sub(r"6-31G\*\\textit\{", "6-31G**", text)
        text = re.sub(r"6-31G\*\\\}", "6-31G**", text)
        text = re.sub(r"6-31G\*\\\*", "6-31G**", text)
    return text


def extract_longtblr(text: str) -> str:
    pattern = re.compile(
        r"\\begin\{longtblr\}(?:\[(?P<opts>.*?)\])?\{(?P<spec>.*?)\}(?P<body>.*?)\\end\{longtblr\}",
        re.S,
    )
    counter = 0

    def repl(match: re.Match[str]) -> str:
        nonlocal counter
        opts = match.group("opts") or ""
        body = match.group("body")
        label_m = re.search(r"label=\{([^}]+)\}", opts)
        caption_m = re.search(r"caption=\{\{(.*?)\}\}", opts, re.S)
        label = label_m.group(1).strip() if label_m else ""
        caption = " ".join(caption_m.group(1).split()) if caption_m else ""

        rows: list[list[str]] = []
        for raw_line in body.splitlines():
            line = raw_line.strip()
            if not line:
                continue
            if line.startswith("\\") and "&" not in line:
                continue
            line = re.sub(r"\\\\\s*$", "", line)
            line = line.strip()
            if not line or "&" not in line:
                continue
            cells = [cell.strip() for cell in line.split("&")]
            rows.append(cells)

        if not rows:
            return ""

        table_id = f"TB{counter}"
        counter += 1

        converted_rows = []
        for row_index, row in enumerate(rows):
            converted_cells = []
            for cell_index, cell in enumerate(row):
                cell_typst = pandoc_fragment(cell)
                if row_index == 0:
                    cell_typst = f"#strong[{cell_typst}]"
                converted_cells.append(f"[{cell_typst}]")
            converted_rows.append(converted_cells)

        header = rows[0]
        columns = len(header)
        table_lines = [
            "#figure(caption: [" + pandoc_fragment(caption) + "])[",
            f"  #table(columns: {columns},",
        ]
        for row in converted_rows:
            table_lines.append("    " + ", ".join(row) + ",")
        table_lines.extend([
            "  )",
            "]",
        ])
        if label:
            table_lines.append(f"<{label}>")

        TABLE_SNIPPETS[table_id] = "\n".join(table_lines)
        return f"@@TABLEBLOCK:{table_id}@@"

    return pattern.sub(repl, text)


def extract_exercises(text: str) -> str:
    pattern = re.compile(
        r"\\begin\{exercise\}(?P<body>.*?)\\end\{exercise\}",
        re.S,
    )
    counter = 0

    def repl(match: re.Match[str]) -> str:
        nonlocal counter
        body = match.group("body")
        label_m = re.search(r"\\label\{(exercise:[^}]+)\}", body)
        label = label_m.group(1).strip() if label_m else ""
        body = re.sub(r"\\label\{exercise:[^}]+\}", "", body)
        body = body.strip()
        if not body:
            body_typst = ""
        else:
            body_typst = pandoc_fragment(body)
        task_id = f"TK{counter}"
        counter += 1
        task_lines = [
            "#task()[",
            f"  {body_typst}" if body_typst else "",
            "]",
        ]
        if label:
            task_lines.append(f"<{label}>")
        TASK_SNIPPETS[task_id] = "\n".join(line for line in task_lines if line != "")
        return f"@@TASKBLOCK:{task_id}@@"

    return pattern.sub(repl, text)


def normalize_typst_output(typst: str) -> str:
    typst = re.sub(r"(?<![\w/.-])\"([^\"]+\.(?:png|jpg|jpeg|pdf))\"", lambda m: f'"../assets/figures/{Path(m.group(1)).name}"', typst)
    typst = re.sub(r"#link\(<([^>]+)>\)\[[^\]]*\]", lambda m: f"@{m.group(1)}", typst)
    typst = re.sub(r"@([A-Za-z0-9:._-]+)\]", r"@\1", typst)
    typst = re.sub(r"#(strong|emph|underline|strike)\[([^\]]+)\]\(", r"#\1[\2] (", typst)
    typst = typst.replace("#blockquote[", "#block[")
    typst = typst.replace('mat(delim: "||",', 'mat(delim: "|",')
    typst = typst.replace("angle.l", "chevron.l").replace("angle.r", "chevron.r")
    typst = typst.replace("planck.reduce", "planck")
    typst = re.sub(r"\bdiff\b", "partial", typst)
    typst = re.sub(
        r"([0-9.]+)\\text(width|height)",
        lambda m: f"{float(m.group(1)) * 100:.6g}%",
        typst,
    )
    typst = typst.replace(r"\textwidth", "100%")
    typst = typst.replace(r"\textheight", "100%")
    return typst


def inject_equation_labels(text: str) -> str:
    pattern = re.compile(
        r"\\begin\{(?P<env>equation\*?|align\*?|gather\*?|multline\*?)\}(?P<body>.*?)\\end\{(?P=env)\}",
        re.S,
    )

    def repl(match: re.Match[str]) -> str:
        body = match.group("body")
        labels = re.findall(r"\\label\{(eq:[^}]+)\}", body)
        if not labels:
            return match.group(0)
        markers = "\n".join(f"@@EQLABEL:{label}@@" for label in labels)
        return match.group(0) + "\n" + markers

    return pattern.sub(repl, text)


def convert_tex_file(src_path: Path, out_path: Path) -> None:
    TABLE_SNIPPETS.clear()
    TASK_SNIPPETS.clear()
    tex = src_path.read_text(encoding="utf-8")
    tex = strip_tex_noise(tex)
    tex = normalize_ocr_artifacts(tex, src_path)
    tex = inject_equation_labels(tex)
    tex = extract_longtblr(tex)
    tex = extract_exercises(tex)

    try:
        typst = run_pandoc(tex)
    except subprocess.CalledProcessError as exc:
        raise RuntimeError(f"pandoc failed for {src_path}\n{exc.stderr}") from exc

    typst = normalize_typst_output(typst)
    typst = re.sub(r"@@TABLEBLOCK:(TB\d+)@@", lambda m: TABLE_SNIPPETS[m.group(1)], typst)
    typst = re.sub(r"\\@\\@TABLEBLOCK:(TB\d+)\\@\\@", lambda m: TABLE_SNIPPETS[m.group(1)], typst)
    typst = re.sub(r"@@TASKBLOCK:(TK\d+)@@", lambda m: TASK_SNIPPETS[m.group(1)], typst)
    typst = re.sub(r"\\@\\@TASKBLOCK:(TK\d+)\\@\\@", lambda m: TASK_SNIPPETS[m.group(1)], typst)

    typst = re.sub(r"@@EQLABEL:([^@]+)@@", lambda m: f"<{m.group(1)}>", typst)
    typst = re.sub(r"\\@\\@EQLABEL:([^@]+)\\@\\@", lambda m: f"<{m.group(1)}>", typst)
    typst = re.sub(r"@@TABLABEL:([^@]+)@@", lambda m: f"<{m.group(1)}>", typst)
    typst = re.sub(r"\\@\\@TABLABEL:([^@]+)\\@\\@", lambda m: f"<{m.group(1)}>", typst)
    typst = normalize_typst_output(typst)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(FILE_PROLOGUE + "\n\n" + typst, encoding="utf-8")


def copy_images() -> None:
    ASSET_DIR.mkdir(parents=True, exist_ok=True)
    for img in sorted(IMAGE_ROOT.glob("image-*.png")):
        shutil.copy2(img, ASSET_DIR / img.name)


def write_wrapper(name: str, title: str, label: str | None, includes: list[str]) -> None:
    lines = [
        FILE_PROLOGUE,
        "",
        f"= {title}" + (f" <{label}>" if label else ""),
        "",
    ]
    for idx, inc in enumerate(includes):
        lines.append(f'#include "{inc}"')
        if idx != len(includes) - 1:
            lines.append("#pagebreak()")
            lines.append("")
    (CHAPTER_DIR / name).write_text("\n".join(lines) + "\n", encoding="utf-8")


def build() -> None:
    copy_images()
    for out_name, src_path in DIRECT_FILES:
        convert_tex_file(src_path, CHAPTER_DIR / out_name)
    for out_name, spec in WRAPPERS.items():
        write_wrapper(out_name, spec["title"], spec["label"], spec["includes"])


if __name__ == "__main__":
    build()
