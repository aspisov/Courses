# Report


## Setup and Installation

Install the required dependencies:

```bash
pip install -r requirements.txt
```

## Running Tests

To run the tests and generate a coverage report:

```bash
python run_tests_with_coverage.py
```

This will:
- Run all tests in `test_gcd.py`
- Generate a coverage report in the terminal
- Create an HTML coverage report in the `coverage` directory

## Coverage Report

The HTML coverage report can be found in the `coverage` directory after running the tests. Open `coverage/index.html` in your browser to view the report.


## Bugs

Bugs where not found.<br>
$\gcd(-2^{31}, -2^{31})$ does also work correctly in python.
