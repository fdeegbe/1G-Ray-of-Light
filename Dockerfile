# Use the official Ubuntu 20.04 LTS as the base image
FROM ubuntu:20.04

# Set environment variables (optional)
ENV TZ=UTC

# Update the package list and install any desired packages
# RUN apt-get update && \
#     apt-get install -y <package1> <package2> ... && \
#     apt-get clean

# Additional configuration or software installation (if needed)
# ...

# Set the default command to run when the container starts (optional)
CMD ["/bin/bash"]
