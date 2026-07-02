import argparse
import datetime
import io
import zipfile
from pathlib import Path

import polars as pl
import PyPDF2


def write_student_file(
    zipf, student, questions_reader, feedback_reader, nr_pages_questions=2
):
    writer = PyPDF2.PdfWriter()
    first_page = student["first_page"] - 1
    first_page_answers = first_page + nr_pages_questions
    for i in range(first_page, first_page_answers):
        writer.add_page(questions_reader.pages[i])
    for i in range(first_page_answers, student["last_page"]):
        writer.add_page(feedback_reader.pages[i])

    fname = f"{student['Identifier'].replace(' ', '_')}_assignsubmission_file_{student['Full name'].replace(' ', '_')}.pdf"
    with zipf.open(fname, "w") as f:
        file_content = io.BytesIO()
        writer.write(file_content)
        file_content.seek(0)
        f.write(file_content.read())


def write_feedback_zip(
    grades_path,
    questions_path,
    feedback_path,
    nr_pages_questions=2,
    nr_students=None,
):
    questions_reader = PyPDF2.PdfReader(questions_path)
    feedback_reader = PyPDF2.PdfReader(feedback_path)
    grades_df = (
        pl.read_csv(grades_path, glob=False)
        .drop_nulls("first_page")
        .sort("first_page")
        .with_columns(
            last_page=pl.col("first_page")
            .shift(-1)
            .fill_null(len(questions_reader.pages) + 1)
            - 1
        )
    )
    if nr_students is not None:
        print(f"{grades_df.height} have filled in info")
        assert grades_df.height == nr_students

    with zipfile.ZipFile(grades_path.parent / "feedback.zip", "w") as zipf:
        for student in grades_df.iter_rows(named=True):
            write_student_file(
                zipf, student, questions_reader, feedback_reader, nr_pages_questions
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("group")
    parser.add_argument("exam")
    parser.add_argument("-y", "--year", default=datetime.datetime.now().year, type=int)
    parser.add_argument("-q", "--nr-pages-questions", default=2, type=int)
    parser.add_argument("-n", "--nr-students", type=int)
    args = parser.parse_args()
    exam_dir = (
        Path(__file__).parent.parent
        / "exams"
        / f"{args.year}"
        / args.group
        / args.exam
        / "results"
    )

    grades_path = next(exam_dir.glob("Grades*.csv"))
    questions_path = exam_dir / "questions.pdf"
    feedback_path = exam_dir / "feedback.pdf"
    write_feedback_zip(
        grades_path,
        questions_path,
        feedback_path,
        nr_pages_questions=args.nr_pages_questions,
        nr_students=args.nr_students,
    )
