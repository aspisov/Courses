#!/usr/bin/env python3
"""
Test runner script with coverage report generation
"""

import os
import subprocess
import sys


def main():
    """Run tests with coverage and generate reports"""
    # Create coverage directory if it doesn't exist
    if not os.path.exists("coverage"):
        os.makedirs("coverage")

    # Run pytest with coverage
    cmd = [
        sys.executable,
        "-m",
        "pytest",
        "test_gcd.py",
        "-v",
        "--cov=GCD",
        "--cov-report=term",
        "--cov-report=html:coverage",
    ]

    result = subprocess.run(cmd, cwd=os.path.dirname(os.path.abspath(__file__)))

    if result.returncode == 0:
        print("\nTests completed successfully!")
        print("Coverage report generated in the 'coverage' directory")
    else:
        print("\nSome tests failed. See output above for details.")

    return result.returncode


if __name__ == "__main__":
    sys.exit(main())
