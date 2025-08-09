FROM postgres:16

# Install development tools and contrib package for pageinspect
RUN apt-get update && apt-get install -y \
    postgresql-contrib \
    bsdmainutils \
    binutils \
    postgresql-filedump \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copy initialization scripts
COPY init-scripts/ /docker-entrypoint-initdb.d/

# Copy demo files and tutorial
COPY demo_queries.sql /demo_queries.sql
COPY tutorial/ /tutorial/

# Set environment variables for demo database
ENV POSTGRES_DB=makotons_substack
ENV POSTGRES_USER=makotons
ENV POSTGRES_PASSWORD=makotons

# Expose PostgreSQL port
EXPOSE 5432