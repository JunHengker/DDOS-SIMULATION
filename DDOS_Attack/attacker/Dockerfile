FROM alpine
# Install required dependencies, including Apache Benchmarking Tool
RUN apk add --no-cache apache2-utils dos2unix bash
# Copy the attack script
COPY attack.sh /attack.sh
# Convert line endings and set executable permission
RUN dos2unix /attack.sh \
    && chmod +x /attack.sh
# Clear the entrypoint in case the base image has one
ENTRYPOINT []
# Run the script
CMD ["sh", "/attack.sh"]
