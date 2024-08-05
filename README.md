

# Satroid

This repository contains various scripts for Termux and other Unix-like environments. One of the scripts, `measure_io_speed.sh`, is designed to measure the I/O speed of your device.

## Usage

You can download and execute the `measure_io_speed.sh` script directly using `curl` or `wget` with the following one-line commands:

### Using `curl`

```bash
curl -sSL https://raw.githubusercontent.com/sarabbafrani/satroid/main/measure_io_speed.sh | bash
```

### Using `wget`

```bash
wget -qO- https://raw.githubusercontent.com/sarabbafrani/satroid/main/measure_io_speed.sh | bash
```

## Script Details

The `measure_io_speed.sh` script measures the write and read speeds of your device using the `dd` command. It creates a temporary file, measures the write speed, reads the file back, measures the read speed, and then cleans up the temporary file.

## Contributing

Feel free to contribute to this repository by submitting pull requests or opening issues.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
