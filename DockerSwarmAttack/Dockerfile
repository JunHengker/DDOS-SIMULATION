FROM alpine/curl
# Add the script
ADD curlAttack.sh /curlAttack.sh
# Convert line endings and set executable permission
RUN apk add --no-cache dos2unix \
    && dos2unix /curlAttack.sh \
    && chmod +x /curlAttack.sh
# Clear the entrypoint in case the base image has one
ENTRYPOINT []
# Run the script
CMD ["sh", "/curlAttack.sh"]