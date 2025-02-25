import pytest
from GCD import GCD
import math
import random


class TestGCD:
    def setup_method(self):
        self.gcd = GCD().gcd

    def test_positive_values(self):
        for _ in range(1000):
            x = random.randint(1, 1000000)
            y = random.randint(1, 1000000)
            assert self.gcd(x, y) == math.gcd(x, y)

        assert self.gcd(12, 18) == 6
        assert self.gcd(48, 36) == 12
        assert self.gcd(17, 23) == 1
        assert self.gcd(100, 25) == 25
        assert self.gcd(3, 9) == 3

    @pytest.mark.parametrize(
        "x, y, expected",
        [(-1, 1, 1), (1, -1, 1), (-1, -15, 1), (-3, -15, 3)],
    )
    def test_negative_values(self, x, y, expected):
        assert self.gcd(x, y) == expected

    @pytest.mark.parametrize("x", [1, 1231241, -4213])
    def test_zero_values(self, x):
        assert self.gcd(0, x) == abs(x)
        assert self.gcd(x, 0) == abs(x)
        assert self.gcd(0, -x) == abs(x)

    def test_both_zero(self):
        assert self.gcd(0, 0) == 0

    def test_coprime_values(self):
        assert self.gcd(100, 33) == 1
        assert self.gcd(12345567, 17) == 1
        assert self.gcd(18, 13) == 1

    @pytest.mark.parametrize(
        "x",
        [102131313, -1021313213, 4130],
    )
    def test_equal_values(self, x):
        assert self.gcd(x, x) == abs(x)
        assert self.gcd(-x, x) == abs(x)
        assert self.gcd(x, -x) == abs(x)
        assert self.gcd(-x, -x) == abs(x)

    @pytest.mark.parametrize(
        "x, y, expected",
        [(120, 10, 10), (120, 100, 20), (243, 123, 3), (925, 355, 5)],
    )
    def test_different_noncoprime_values(self, x, y, expected):
        assert self.gcd(x, y) == expected

    def test_one_divides_another(self):
        assert self.gcd(10, 5) == 5
        assert self.gcd(5, 10) == 5
        assert self.gcd(100, 25) == 25
        assert self.gcd(25, 100) == 25
        assert self.gcd(-20, 5) == 5
        assert self.gcd(5, -20) == 5

    @pytest.mark.parametrize(
        "x, y, expected",
        [
            (-(2**31), 2**31 - 1, 1),
            (2**31 - 1, -(2**31), 1),
            (-(2**31), -(2**31) + 1, 1),
            (-(2**31), -(2**31), 2**31),
        ],
    )
    def test_edge_cases(self, x, y, expected):
        assert self.gcd(x, y) == expected

    @pytest.mark.parametrize(
        "n",
        [
            10000,
            100000,
            200000,
        ],
    )
    def test_fibonacci_values(self, n):
        prev, cur = 0, 1
        for _ in range(n):
            prev, cur = cur, prev + cur
        assert self.gcd(prev, cur) == 1
