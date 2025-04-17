FROM ghcr.io/cirruslabs/flutter:3.29.0


# Set work directory
WORKDIR /app

# Copy only pubspec files first for better caching
COPY pubspec.* ./

# Get dependencies
RUN flutter pub get

# Copy the rest of the app
COPY . .

# Run doctor just in case
RUN flutter doctor

# Default command to run analyzer
CMD ["flutter", "analyze"]
