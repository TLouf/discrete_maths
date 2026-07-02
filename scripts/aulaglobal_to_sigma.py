import argparse
import datetime
import sys
from pathlib import Path

import polars as pl


def generate_table(group_dir: Path, percentages=True) -> pl.DataFrame:
    list_path = list(group_dir.glob("*listado*"))[0]
    grades_path = list(group_dir.glob("*Grades*"))[0]
    students = pl.read_csv(
        list_path,
        has_header=False,
        encoding="latin1",
        new_columns=["NIA", "DNI", "NOMBRE"],
        separator=";",
    )
    norm = 10 if percentages else 1
    grades = (
        pl.read_csv(grades_path, null_values="-")
        .with_columns(
            pl.col("Email address")
            .str.extract(r"100([0-9]+)@.*")
            .cast(int)
            .alias("NIA")
        )
        .select("NIA", (pl.col("Course total (Real)").alias("grade") / norm).round(1))
    )
    sigma = (
        students.join(grades, on="NIA", how="left")
        .fill_null(0)
        .with_columns(pl.col("grade").cast(pl.Utf8).str.replace(".", ",", literal=True))
    )
    return sigma


def save(sigma, path) -> None:
    sigma.write_csv(path, include_header=False, separator=";")
    with open(path, "r") as f:
        utf8_csv = f.read()
    with open(path, "wb") as f:
        f.write(utf8_csv.encode("latin1"))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("group")
    parser.add_argument("-y", "--year", default=datetime.datetime.now().year, type=int)
    args = parser.parse_args()
    group_dir = Path(__file__).parent.parent / "exams" / f"{args.year}" / args.group

    sigma = generate_table(group_dir)
    sigma_path = group_dir / "sigma.csv"
    save(sigma, sigma_path)
