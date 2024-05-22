# RedEnvelope Distribution Monte Carlo

This project simulates the distribution of red envelopes among a specified number of people, each containing a random amount of money. Red envelopes are a traditional Chinese custom often used to give monetary gifts during holidays and special occasions.

## Project Structure

```
RedEnvelope
│
├── src
│   ├── red_envelope.pyx      # Cython file for red envelope distribution logic
│   └── setup.py              # Setup script for compiling Cython code
│
└── target
    ├── distribution_barcharts.png  # Bar chart images showing distribution results
    ├── main.py               # Python script to run the simulation and generate results
    ├── red_envelope.cp310-win_amd64.pyd  # Compiled Cython module (for Windows)
    ├── red_envelope.pyi      # Type hinting file for the Cython module
    └── red_envelope_simulation.xlsx      # Excel file containing simulation results
```

## How it Works

The simulation is performed using a Monte Carlo method, where red envelopes are distributed to a specified number of people for a large number of iterations. The distribution logic is implemented in the `red_envelope.pyx` file using Cython for performance optimization. The logic is based on the distribution method commonly used in WeChat's electronic red envelopes, where the giver puts a certain amount of money in the envelope and sets the number of people who can receive the money.

In this simulation, the last person tends to receive a slightly larger amount than others on average due to the way the distribution algorithm is designed. This observation holds true for all numbers of recipients from 1 to 50.

The project already includes a pre-generated Excel file (`red_envelope_simulation.xlsx`) and bar chart images (`distribution_barcharts.png`) from an example execution of the `main.py` script.

--- 

This addition provides clarity on the distribution logic and mentions the pre-existing simulation results.
## Usage

To run the simulation and generate results:

1. Ensure you have Python and Cython installed on your system.
2. Compile the Cython code using the provided `setup.py` script.
3. Run the `main.py` script.

The simulation results will be stored in the `target` directory as an Excel file (`red_envelope_simulation.xlsx`) and bar chart images (`distribution_barcharts.png`). You can customize the simulation parameters, such as the number of people and the envelope's total amount, by modifying the `main.py` script.

## 🎉 From JeongHan Bae (Researcher)

My sincere wish and I expect users of good luck to be blessed by the red envelopes! 🧧🎊
