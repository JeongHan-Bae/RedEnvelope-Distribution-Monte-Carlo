# cython: language_level=3

from libc.stdlib cimport rand, srand
from libc.time cimport time
import numpy as np
cimport numpy as np

def distribute_envelope(int n, int envelope_money=20000):
    """
    Simulate the distribution of a red envelope to n people.
    Returns a list with the amount of money each person gets.
    """
    cdef int money_left = envelope_money
    cdef int i
    cdef int max_amount
    cdef int amount
    distribution: list[int] = [0] * n

    for i in range(n - 1):
        max_amount = (money_left - 1) // (n - i) * 2
        amount = rand() % max_amount + 1
        distribution[i] = amount
        money_left -= amount

        # The last person gets all the money left
    distribution[-1] = money_left

    return distribution


def analyze_red_envelope(int simulation_times, int n, int envelope_money=20000):
    """
    Perform the Monte Carlo simulation for the red envelope distribution.
    Returns a list with the expected amount of money each person gets.
    """
    cdef int i
    cdef np.ndarray[np.float64_t, ndim=1] total_distribution = np.zeros(n, dtype=np.float64)
    cdef list distribution

    for i in range(simulation_times):
        distribution = distribute_envelope(n, envelope_money)
        total_distribution += np.array(distribution, dtype=np.float64)

    # Calculate the expectation for each person
    expected_distribution = (total_distribution / simulation_times).tolist()

    return expected_distribution